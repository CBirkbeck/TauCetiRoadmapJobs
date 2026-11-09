# Review of QuaternionArithmetic (pull request #1722 at 4a6edeb)

**Verdict:** needs changes

This is a full review: 435 lines of the folder changed since 5b4cda9. Of the previous review's eight findings, six are repaired, one is partly repaired and one is not (see *Previous findings*). Two blocking findings remain:

- §9.5 defines the LMFDB family `X(D;N)` by a subgroup of level 1, so every member is `X(D;1)`.
- The Brandt matrix and its multiplicativity can be stated at the pins, but `Suggested.lean` omits them, and its docstring gives a reason that does not hold.

Four P3 findings follow.

## R01 (P2) — §9.5's `X(D;N)` and `X^*(D;N)` are subgroups of level 1, so each "family" is its `N = 1` member

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:2262–2266`: "`X(D;N)` (`H = (O/NO)^× ⋊ 1 ≤ G(O,μ,N)`), also `Γ¹(O)\ℍ` — the level structure changes the stack and the index, not the component's genus, exactly as the LMFDB tables record; `X^*(D;N)` (`H = G(O,μ,N)`)". The same names appear in *Owned here* (line 77) and in the `name` row of §10.2 (line 2471).

**Claim:** By this README's own definitions the claim is false.
- **Level.** `H = (O/NO)^× ⋊ 1` contains the whole kernel of `(O/NO)^× → (O/1·O)^×`. By the level of Conventions (line 187), `N(H) = 1`.
- **Same curve.** `H` is the preimage of `1 ≤ G(O,μ,1)`. §9.5 itself says (lines 2255–2256) that passing to a preimage does not change `Γ_H`.
- **Same index.** `[G(O,μ,N) : H] = #Aut_{±μ}(O)`, which is the index of `X(D;1)`.

So neither the stack nor the index changes with `N`, and every `X(D;N)` has the level, index, curve and label prefix of `X(D;1)`. The same holds for `X^*(D;N)`: `G(O,μ,N)` is the preimage of `G(O,μ,1)`. The LMFDB uses "full level `N`" for the quotient by `Γ(Ô,N)`, which is `H = 1`. This README's Conventions row `X_H` (line 186) uses the same curve `X(O;N)^{big}`.

**Witness:** Take `D = 6`, `N = 5` and `H = GL₂(𝔽₅) ⋊ 1`. Then the index is `1920/480 = 4`, the level is 1, `Γ_H = Γ¹(O₆)`, and the prefix is `6.1.1.4.0`, the prefix of `X(6;1)`. The knowl calls `X(O;N)^{big}` "the full level N Shimura curve" (`lmfdb_shimcurve lines 114–118, 131`).

**Repair:**
- **`X(D;N)`.** For `O` maximal, define it as `H = 1 ≤ G(O,μ,N)`. Then `X_H` is the knowl's `X(O;N)^{big}`, with `Γ_H = Γ¹(O;N) = π(O¹ ∩ (1 + NO))`; §9.5 already computes this group for the trivial subgroup (line 2258). The level is `N` and the index is `#Aut_{±μ}(O)·#(O/NO)^×`.
- **`X^*(D;N)`.** Use the subgroup that the knowl `shimcurve.xdn_star` specifies. It is listed among the knowls citing `shimcurve` (`lmfdb_shimcurve line 186`) but is not in the sources cache. Cite it, together with `shimcurve.xdn`.
- **Wording.** Delete "exactly as the LMFDB tables record" and "the level structure changes the stack and the index".
- **Bookkeeping.** Update line 77 and the §10.2 `name` row.

Tested at `D = 6`, `N = 5`: `H = 1` contains no nontrivial kernel, so its level is 5 and its index is `4·480 = 1920`.

## R02 (P2) — The Brandt matrix `T(n)` and its multiplicativity are statable at the pins and absent from `Suggested.lean`; the docstring's reason does not hold

**Location:**
- `TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:26–28`: "Brandt multiplicativity, trace and theta comparison require the norm-indexed ideal correspondence of §7.1 and its Brandt module."
- README Summary, lines 7–9, and *Owned here*, lines 67–69 ("their arithmetic, multiplicativity, the Hecke algebra…").
- §§7.1–7.2.

**Claim:** Over `ℤ`, `T(n)_{ij}` counts the `J : RightIdeal O` with `J ≤ I_j` and `nrd J = n·nrd I_j` in the class of `I_i`. This needs only `RightIdeal`, `ClassRel` and the norm of a lattice, which is a `Submodule.span ℤ` of reduced norms. These are native carriers, as for `embeddingNumber` and `ellipticCount`; no Brandt module is needed. `[V, 41.3.1]` (`voight line 32152`, p. 754) gives:
- (a) for `n` coprime to `discrd O`, every column sums to `σ(n)`;
- (b) `T(mn) = T(m)T(n)` for coprime `m, n`.

Both are the Layer 7 headlines the Summary promises.

A second, smaller point: the docstring's "general mass formula" sentence (lines 24–25) covers only the λ-factor form (25.3.19 / 26.1.5). The totally real formula for Eichler orders (§5.3, `[V, 26.1.12]`, `voight line 18128`) uses no Eichler symbol. The docstring names no carrier that this headline lacks.

**Witness:** I appended the declarations below to a scratch copy of the file, inside the namespace. It elaborates under `lake env lean` with exit 0, 24 `sorry` warnings (22 + 2) and no error.

**Repair:** Add the following, tested as written, after Layer 6:

```lean
section Brandt

variable {a b : ℚˣ}

/-- The reduced norm `nrd(I)` of a lattice: the `ℤ`-submodule of `ℚ` spanned by the reduced
norms of its elements. -/
def idealNorm (I : Submodule ℤ ℍ[ℚ,(a : ℚ),(b : ℚ)]) : Submodule ℤ ℚ :=
  Submodule.span ℤ (nrd a b '' (I : Set ℍ[ℚ,(a : ℚ),(b : ℚ)]))

/-- The Brandt matrix `T(n)` for class representatives `I₁, …, I_h`: `T(n)_{ij}` counts the
invertible right `O`-ideals `J ⊆ I_j` with `nrd J = n·nrd I_j` in the class of `I_i`. -/
def brandtMatrix (O : QuatOrder a b ℤ) {h : ℕ} (reps : Fin h → RightIdeal O) (n : ℕ) :
    Matrix (Fin h) (Fin h) ℕ := fun i j =>
  Nat.card {J : RightIdeal O // J.toSubmodule ≤ (reps j).toSubmodule ∧
    idealNorm J.toSubmodule = Submodule.span ℤ {(n : ℚ)} * idealNorm (reps j).toSubmodule ∧
      ClassRel O (reps i) J}

/-- Multiplicativity of Brandt matrices for coprime indices ([V, 41.3.1(b)]). -/
theorem brandtMatrix_mul (O : QuatOrder a b ℤ) (hdef : IsDefinite a b) {h : ℕ}
    (reps : Fin h → RightIdeal O)
    (hreps : Function.Bijective (fun i => (Quot.mk (ClassRel O) (reps i) : ClassSet O)))
    {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (hmn : m.Coprime n) :
    brandtMatrix O reps (m * n) = brandtMatrix O reps m * brandtMatrix O reps n := sorry

/-- Column sums: for `n` coprime to `discrd O`, every column of `T(n)` sums to `σ(n)`
([V, 41.3.1(a)]). -/
theorem sum_brandtMatrix_col (O : QuatOrder a b ℤ) (hdef : IsDefinite a b)
    {h : ℕ} (reps : Fin h → RightIdeal O)
    (hreps : Function.Bijective (fun i => (Quot.mk (ClassRel O) (reps i) : ClassSet O)))
    {n : ℕ} (hn : 0 < n) (hcop : n.Coprime (discrdNat O)) (j : Fin h) :
    ∑ i, brandtMatrix O reps n i j = ArithmeticFunction.sigma 1 n := sorry

end Brandt
```

Then:
- Name `brandtMatrix`, `brandtMatrix_mul` and `sum_brandtMatrix_col` in §§7.1–7.2.
- Have the docstring list as not statable only the trace formula and the theta comparison, each with the carrier it lacks. The trace formula needs `h(d)` for every negative discriminant `d`, that is, quadratic orders over a varying field.
- Either state the §5.3 Eichler-order formula, or name what it lacks: the discriminant and level ideals over `𝓞 F`.

Values at `D = 11`, classes ordered by `w = 2, 3`: `T(2) = [[1,3],[2,0]]` has column sums `3 = σ(2)`, and `T(2)T(3) = [[8,6],[4,6]] = T(6)` has column sums `12 = σ(6)`.

## R03 (P3) — §§8.5, 9.3 and 9.8 (seeded sample) and §§8.7, 9.2, 9.4, 9.5 state theorems with no source locator

**Location:** Each of these subsections asks for a proof and cites nothing:
- §8.5, lines 2013–2016: "Prove `w_m` normalizes `Γ¹(O)`, acts on `X_0(D;N)` with square the identity…";
- §8.7, lines 2066–2070;
- §9.2, lines 2167–2182, the cyclic orders, the twisting index and the twisting criterion;
- §9.3, lines 2208–2210: "Prove the twisting criterion in the form used for all of these";
- §9.4, lines 2224–2232;
- §9.5, lines 2252–2257;
- §9.8, lines 2357–2363: "Prove that θ has finite image, that `k_end` is the smallest extension…".

The docstrings of `card_autPmMu` and `card_autPmMu_general` cite only the README.

**Witness:** None of these subsections names Voight, Rotger, Ogg or a knowl. The sampled §§8.5, 9.3 and 9.8 therefore have no locator to check.

**Repair:** Cite at the claims:
- **§8.5:** `[V, 28.9.17]`, p. 486 (`voight line 20829`) for `N/(ℚ^×O^×) ≅ AL(O)`; `[V, 43.2.15]`, p. 789 (`voight line 33518`) for `w₂, w₃, w₆` at `D = 6`; and Ogg 1983, which is already in References.
- **§§9.2–9.3:** Rotger, *Modular Shimura varieties and forgetful maps*, §4, for twists and the twisting criterion (`rotger lines 360–368`, pp. 9–10), with `[V, 43.6.5]`, p. 802. The finite cyclic orders follow from the injection `[x] ↦ x/x̄` of the torsion of `ℚ(μ)^×/ℚ^×` into the roots of unity of `ℚ(μ)`; name it as the route.
- **§§9.4–9.5:** the knowls `shimcurve.enhanced_group`, `.level`, `.index` and `.is_coarse` for the definitions.
- **§9.8:** a source for the endomorphism-field comparison, or say it is proved here from §9.7 and name the descent statement it uses.
- **§9.3 worked values:** say they are evaluations of the §9.2 criterion, as line 2591 already does for the table.

## R04 (P3) — The Tau Ceti order carriers cited "at the pin" are not at this head's pin

This is the previous review's R03, partly repaired.

**Location:** `README.md:254–260`, in the bullet *From Tau Ceti at the pin*: "Orders, maximal orders and left orders are Tau Ceti's `TauCeti.IntegralOrder.IsOrder` … `TauCeti.IntegralOrder.IsMaximalOrder` … and `Submodule.leftOrder` (`RingTheory/IntegralOrder/{Basic,Maximal,LeftOrder}.lean`)". Line 608 repeats it.

**Claim:**
- This head pins Tau Ceti `358314d4a`; its merge base is 351 commits behind main. At that pin none of these declarations exists.
- They exist at main's pin `2fd255d99`. After the merge, `QuatOrder`, `IsMax` maximality and `leftOrderSubalgebra` in `Suggested.lean` restate them. The README now says so openly (lines 257–260), but it does not resolve it.

**Witness:**
- `grep -rln IntegralOrder` over this head's pinned Tau Ceti tree prints nothing.
- At `2fd255d99`: `TauCeti/RingTheory/IntegralOrder/Basic.lean:75` `def IsOrder`, `Maximal.lean:67` `def IsMaximalOrder`, `LeftOrder.lean:61` `def leftOrder`.

**Repair:** Rebase onto main; this changes no file outside the folder. Then:
- state the headlines on `{O : Subalgebra R B // TauCeti.IntegralOrder.IsOrder F O}`;
- use `IsMaximalOrder` in place of `IsMax`, and `Submodule.leftOrder` in place of `leftOrderSubalgebra`;
- keep `rightOrderSubalgebra`.

Until the rebase, lines 254–260 and 608 should say "at Tau Ceti `2fd255d99` (main's pin)", not "at the pin".

## R05 (P3) — ArithmeticFuchsianGroups still cites this roadmap's pre-renumbering §§1.7 and 1.12, and no old → new numbering is given

This is the previous review's R04, not repaired.

**Location:** `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md:1403–1407`, at the head of its open pull request #2026: "… the finiteness of maximal-order types (§1.4), for its §§1.2, 1.7, 1.12, 3.5, 3.6 and 8.2". This README lists its consuming sections as 0.3, 1.2, 1.6, 1.11, 3.5, 3.6, 4.6, 8.1 and 8.2 (lines 361–362).

**Witness:** In this README:
- §1.7 (line 750) is the maximality criterion and §1.12 (line 883) is products of lattices; neither uses ArithmeticFuchsianGroups.
- The local structure is §1.6 (line 725) and the tree adapter §1.11 (line 845).
- No old → new line exists.

**Repair:** Either add one line per moved id (1.7 → 1.6, 1.8 → 1.7, 1.9 → 1.8, 1.10 → 1.9, 1.11 → 1.10, 1.12 → 1.11, 1.13 → 1.12, 1.14 → 1.13), or have ArithmeticFuchsianGroups cite §§0.3, 1.2, 1.6, 1.11, 3.5, 3.6, 4.6, 8.1 and 8.2 before either merges.

## R06 (P3) — "The LMFDB code" and "the `GL₄(ℤ/N)` embedding of the code" refer to an implementation

**Location:**
- `README.md:184`: "the LMFDB code multiplies pairs `(w,x)` by …";
- line 2229: "used by the LMFDB code";
- line 2313: "( the `GL₄(ℤ/N)` embedding of the code)".

**Claim:** The README states mathematics, not implementations, and "the code" is defined nowhere. The pair order is a convention of the enhanced group, `Aut_{±μ}(O) ⋉ Ô^×`, in the knowl (`lmfdb_shimcurve_enhanced_group lines 98–100`). The parenthetical at line 2313 names an undefined embedding and starts with a stray space.

**Witness:** `grep -n 'the code\|LMFDB code'` finds the three lines and no definition.

**Repair:**
- At lines 184 and 2229, write "the pair order `(w, x)` of the knowl `shimcurve.enhanced_group`".
- At line 2313, delete the parenthetical, or define the embedding by a `ℤ`-basis of `O` (§1.10): `O/NO ≅ (ℤ/N)⁴`.

## Previous findings

Each finding of the review at 5b4cda9, checked at this head:

- **R01 (two owners with HilbertModularVarietiesAndShimuraCurves): repaired.** Lines 107–125 now read "Eichler orders, their right ideal classes and the neighbour Brandt matrices are Hilbert modular varieties and Shimura curves §§R18.5.16a–R18.5.16c". The contract at lines 291–310 cites items 1, 2, 3–4, 6, 7 and 8, §R18.5.16b and §R18.5.16c items 1–4.
  - The sections now consume these: §1.8 ("The local form is … §R18.5.16a item 1, consumed", line 773), §1.9 (lines 801–806), §1.11 (lines 854–856), §3.4 (lines 1213–1214), §3.9 (lines 1305–1307), §5.1 (lines 1465–1466) and §§7.1–7.3 (lines 1727–1732, 1755–1756, 1772–1774).
  - The convention `T(𝔭) = B(v)ᵗ` is recorded at line 125, with a Check at lines 1748–1750.
  - I read all of these against the HMV head; the result is under *Cross-roadmap citations*.
- **R02 (area and elliptic headlines): repaired.** `Suggested.lean:523–572` adds `gammaOne`, `covolume_gammaOne`, `ellipticCount`, `ellipticCount_gammaOne_two`, `ellipticCount_gammaOne_three` and the genus formula in Euler-characteristic form, `eulerChar_compactifiedQuotient_gammaOne`. The docstring (lines 28–33) explains the two instance hypotheses that the carriers require.
- **R03 (Tau Ceti `IntegralOrder`): partly repaired.** The names and the correspondence are now written at lines 254–260, but there was no rebase. See R04.
- **R04 (stale §§1.7 and 1.12 in ArithmeticFuchsianGroups): not repaired.** See R05.
- **R05 (§2.6 restated a definition): repaired.** Lines 1084–1095 list the classification with `[V, 24.3.5]`, `[V, 24.3.6]`, `[V, 24.5.4]`, `[V, 24.5.5]` and `[V, 23.3.18]`, and "Gorenstein" is dropped. There are four Checks (lines 1101–1110); the `ℤ₂[ω] + 2M₂(ℤ₂)` Check is recomputed below.
- **R06 (locators): repaired.**
  - Line 612 reads "`[V, 16.6.7]`, p. 261", and line 613 "`[V, Exercise 10.14(b)]`, p. 158".
  - Line 453 reads "p. 236", and line 640 "`[V, Exercise 10.15]`, p. 158".
  - §8.2 cites "FuchsianOrbifolds Layer 2 item 1 (covolume); Tau Ceti `MeasureTheory.covolume_eq_card_mul_covolume`" (lines 1945–1946).
  - Line 415 reads "Listed under *From Tau Ceti at the pin* above".
- **R07 (LMFDB coverage and `nrdmu`): repaired.** §10.3 (lines 2481–2490) now assigns a worked value to each row and says that the generators of `H` have none. §9.9 gives `X^*(6;1)` with `(1, 0, 1, 1)`, signature `(0; 2, 4, 6)` and area `π/6`. Lines 2125–2128 read "`μ² = −12` and `12/6 = 2`".
- **R08 (`instIsLatticeRightIdeal`): repaired.** The name is absent from both files.

## Verified sound

**Gate, dependencies, build.**
- **Worker's gate.** At 4a6edeb every check is 0 and the result is OK, including `outside-folder=0` and `stray-files=0`.
- **My rerun.** It differs only in `depcheck: NOT IN ORDER: QuaternionArithmetic (insert it after its last supplier)`. The project's merge order does not list this roadmap yet, so this is not a finding.
- **Dependency check.** The brief's check against the candidate order, with `--movable`, prints `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. In the candidate order:

  | Roadmap | Line |
  | --- | --- |
  | QuaternionArithmetic | 285 |
  | ArithmeticFuchsianGroups | 284 |
  | HilbertModularVarietiesAndShimuraCurves | 160 |
  | GL2AutomorphicRepresentationsAndTransfer | 100 |
  | AutomorphicFormsOnReductiveGroups | 60 |
  | AdelicAlgebraicGroups | 52 |
  | FuchsianOrbifolds | 49 |
  | AbelianSchemesAndArithmeticModuli | 41 |

  ClassicalArithmeticCompletion, ReductiveGroupsPartII, ThetaSeries, QuadraticFormInvariants, GlobalQuadraticForms and ClassFieldTheory are on main.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/QuaternionArithmetic/Suggested.lean` exits 0 in 21 s with exactly 22 `declaration uses sorry` warnings, one per theorem, and no other message.

**Signatures.** I wrote `#check @name` for all 69 declarations in one scratch file and elaborated it once (exit 0), then compared each type with the README.
- The general-`R` theorems carry `CharZero F`, `IsDedekindDomain R` and `IsFractionRing R F`. `existsUnique_gorenstein_saturation` and `IsEichler.isBass` get them through `include charZeroF`; `finite_classSet` gets `[CharZero F] [NumberField F]` on `𝓞 F`.
- Every rational theorem carries the definite, indefinite, Eichler, maximal or `1 < discNat` hypothesis its README statement has.
- The worker's 24 "dropped binder" leads are definitions (`IsGorenstein`, `RightIdeal`, `ClassSet`, `normalizer`, …) whose bodies need none of those classes. No change.

**Padding probe.** I replaced each `sorry` by `first | rfl | decide | infer_instance | simp | norm_num | trivial`. All 22 fail, at lines 254, 271, 292, 299, 350, 384, 397, 404, 409, 422, 431, 482, 488, 495, 509, 536, 551, 558, 572, 593, 664 and 671. None restates a definition or computes a small value.

**Seeded sample** (Voight author edition v0.9.28; printed pages from the running heads):

| Target | Locators opened | Result |
| --- | --- | --- |
| 0.1 | Ex. 15.2.10, `voight line 10511`, p. 236 | Gram `diag(2,2a,2b,−2ab)`, char ≠ 2: matches |
| 0.6 | Prop. 14.6.7, `voight line 9981`, p. 224 | (iii) ⇔ (v): `K ↪ B` iff no `v ∈ Ram B` splits in `K`, for separable quadratic `K/F` of global fields: matches |
| 0.7 | QuadraticFormInvariants 6C items 9, 10, 12 (its README lines 2065, 2083, 2112, main) | odd closed formula, `ℚ₂` closed formula, `8 × 8` table: the cited items exist and give the values |
| 2.6 | 24.3.1–24.3.2 (`voight lines 16744–16760`, p. 388); 24.3.5 and Lemma 24.3.6 (`16808–16819`, p. 389); Prop. 24.5.4 (`17070`, p. 394); 24.5.5 (`17079`, p. 395); Lemma 23.3.18 (`15930`) | "local" means a complete DVR with arbitrary residue field (`voight line 15719`), which is the README's generality: matches |
| 4.4 | Thm 28.6.1 (`20389`, p. 476); Cor. 28.6.4 (`20421`); Prop. 28.6.10 (`20475`, p. 477) | integral `α` with `nrd α = n` for `S`-indefinite `B`; `nrd(O^×) = R^×_{>Ω0}` for Eichler `O` when `Cl_Ω R = 1`; unit of norm `−1` for locally norm-maximal `O` over `ℚ`: matches |
| 4.5 | Prop. 28.9.17 (`20829`, p. 486) | "(non-canonically) split exact" for `S`-indefinite `B`: matches |
| 5.1 | Lemma 26.5.1 (`18537`); Lemma 17.7.13 (`12292`) | `O^×/R^×` finite; `O^× = O¹` over `ℚ`: matches |
| 5.2 | Thms 25.1.1 (`17355`), 25.3.18 (`17730`), Main Thm 25.3.19 (`17756`) | `φ(D)/12`, `φ(D)ψ(M)/12`, the general λ form: matches |
| 6.6 | Thm 30.1.5 (`22961`, p. 531); Lemma 30.8.2 (`23866`); Prop. 30.8.5 (`23880`); Main Thm 30.8.6 (`23915`, p. 550) | `ε₂`, `ε₃` vanish at `4 ∣ N`, `9 ∣ N`; `h(S) = #Pic S`; the key lemma: matches |
| 6.7 | Thm 30.1.5 | values recomputed below: match |
| 7.4 | Main Thm 41.5.2 (`32386`, p. 759); Ex. 41.5.8, (41.5.9)–(41.5.10) (`32435–32450`) | `w_S = [S^× : R^×]`; mass term iff `𝔫 = c²R`: matches |
| 8.4 | Thm 39.4.20 (`30965`); FuchsianOrbifolds (main) Layer 4 item 5, Layer 5 items 1, 3, 6 | `2g − 2 = φ(D)ψ(M)/6 − m₂/2 − 2m₃/3` for `D > 1`; FO's genus is `χ = 2 − 2g` (Layer 5 item 1): matches |
| 8.5 | none given | R03 |
| 9.3 | none given; `rotger lines 360–368` (twists) | criterion consistent with Rotger's twist; R03 |
| 9.8 | none given | R03 |

Also opened: Voight 43.6.4–43.6.7 (`voight lines 34051–34077`, p. 802), which support `exists_principal_polarization` and `μ ∈ D·O^♯`; Prop. 41.3.1 (`32152`, p. 754), the source for R02; Prop. 24.2.15 (`16649`); and Dembélé–Voight Theorem 3.9 and Remark 3.10 (`dembele_voight lines 583, 600`, pp. 11–12), the source for §7.5.

**Library declarations opened at the pins** (Mathlib `f6090c709`, Tau Ceti `358314d4a`):
- **Mathlib.**
  - `MeasureTheory.covolume` (MeasureTheory/Group/FundamentalDomain.lean:679): the measure of a fundamental domain, and 0 if none exists.
  - The `MeasureSpace ℍ` instance (Analysis/Complex/UpperHalfPlane/Measure.lean:40–42): `volume.comap coe` with density `(1/im)²`. This is the hyperbolic measure that `covolume_gammaOne` assumes, so `PSL₂(ℤ)` has covolume `π/3`.
- **Tau Ceti.**
  - `TauCeti.FiniteCWType` (Topology/CWComplex/Classical/FiniteCWType.lean:73) is a `Prop`-valued class, so the hypothesis carries no data.
  - `TauCeti.eulerChar` (AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:92).
  - The topology on `Subgroup.CompactifiedQuotient` is declared under `variable [DiscreteTopology Γ]` (Analysis/Complex/Fuchsian/Compactification/Basic.lean:187–192), which confirms the docstring's reason for that instance hypothesis.
  - `UpperHalfPlane.instMulActionPSL2` (Analysis/Complex/UpperHalfPlane/PSL/Action.lean:132).
  - `MeasureTheory.covolume_eq_card_mul_covolume` (MeasureTheory/Group/FundamentalDomain.lean:322).
  - `NumberFieldOrder.discr`, the signed `Algebra.discr ℤ` of a basis (NumberTheory/NumberField/Global/Orders/Discriminant.lean:77), so the `−p`, `−4p` hypotheses of `typeNumber_prime` have the right sign.
  - `Pic`, which is `ClassGroup` of the order (Orders/Picard.lean:34).
- **Tau Ceti `2fd255d99` (main's pin):** the three `IntegralOrder` declarations of R04.

**Cross-roadmap citations resolved this round.** Line numbers are README lines at the heads given.

| Roadmap | Resolved |
| --- | --- |
| HilbertModularVarietiesAndShimuraCurves (#1005) | §R18.5.16a items 1–8 (2360–2394); §R18.5.16b (2396–2424); §R18.5.16c items 1–4 (2426–2448), including `w_j B(v)_{ij} = w_i B(v)_{j,s_v(i)}` and the transpose remark; R18.5.17a (2468); consumer line (4436); scope (10) |
| ArithmeticFuchsianGroups (#2026) | `Suggested.lean` 50 `RealSplitting`, 67 `normOneImage`, 84 `isCofinite_normOneImage`, 92 `cocompact_normOneImage_iff_anisotropic`, 101 `finiteRamification`, 110 `covolume_normOneImage` (same `covolume … UpperHalfPlane`); README §1.2 (parity, positive normalizer and `ν`, finite-index scaling, tree adapter), §1.4 (836); consumer line (1403, R05) |
| GL2AutomorphicRepresentationsAndTransfer (#931) | `existsQuaternionRamification_iff` (`Suggested.lean` 157), `nonempty_quaternionAlgEquiv_of_localSplitting` (173), R17.1.5 (README 1523) |
| AdelicAlgebraicGroups (#792) | §4.4 "Nested-level map on double cosets" (4805), "Finite-index bound for level changes" (4829), AA.4.2 *quaternion-norm-one-strong-approximation* (4265) |
| FuchsianOrbifolds (main) | Layer 2 item 1, Layer 4 item 5, Layer 5 items 1, 3, 6 (235–343) |
| QuadraticFormInvariants (main) | 6C items 9, 10, 12 |

The resolver's nine leads are knowl identifiers, `IsEichler.isBass` (declared here) and AdelicAlgebraicGroups' `Reduction.finite_classes`. None is a defect.

**Ownership.**
- **HMV.** HilbertModularVarietiesAndShimuraCurves is consumed, not restated (previous R01). What stays here (composite `𝔫`, `𝔫` meeting the level, non-Eichler orders, the normalizer of `O₀(𝔭^e)`) goes beyond its items 1–8 and §R18.5.16c.
- **AFG.** ArithmeticFuchsianGroups' `normOneImage` is the same object as `gammaOne` at `k = ℚ`. `Suggested.lean` cannot import another roadmap, and the names differ.
- **Other open roadmaps.** HilbertModularForms (#1724, line 189) defers quaternion orders and Brandt matrices. `roadmaps grep` for the mass formula, Brandt matrices and Deuring finds no other owner.
- **Names.** No `Suggested.lean` name here equals a fully qualified name in a readable roadmap.
- **Pull requests without checkouts** were searched only through `roadmaps grep`.

**Adversarial table.** All values were recomputed this round. Class numbers come from reduced forms, and genera, Kronecker products and masses from a script.

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| 0.1 Gram (sample) | (3,−1), (−1,−1), (1,1); norms at (3,−1) | (2,6,−2,6) det −144 = −16·9; (2,−2,−2,−2) −16; (2,2,2,−2) −16; `nrd i·nrd j = (−3)(1) = −3 = ab = nrd k` | holds |
| 0.6 (sample) | Hamilton with `ℚ(i)`, `ℚ(√−2)`, `ℚ(√−7)` | 2 ramified, ramified, split (`−7 ≡ 1 mod 8`): embeds, embeds, does not | holds |
| 0.7 (sample) | the eleven symbols | D = 2, 3, 5, 7, 11, 2, 6, 10, 15, 1, 1; e.g. `(−2,5)₂ = (2,5)₂(−1,5)₂ = (−1)(1)`, `(−3,5)₃ = (2|3) = −1`, `(−1,−13)₂ = (−1)^{(−1)(−7)} = −1` | holds |
| `discNat`, `ramificationBound` | (1,7); (3,−1) | bound 14, D = 1; bound 6, D = 6 | holds |
| 1.3–1.5 | L, 2L, `L ⊂ H` | trace dets −16, −4096; δ 4, 64 = 2·32; `[H:L] = 2`, 4 = 2·2 | holds |
| `isMax_iff_discrdNat_eq` | L, H, O₆, ℤ+2O₆, M₂(ℤ) | 4 ≠ 2; 2 = 2; 6 = 6; 48 ≠ 6; 1 = 1 | holds |
| `relindex_normOne_eq_psi` | Γ₀(2), Γ₀(4); `O₀(p²) ⊂ End(ℤ⊕pℤ)`; definite level 7 | 3 = ψ(2), 6 = ψ(4); conjugate by `diag(1,p)`: `[SL₂(ℤ) : Γ₀(p)∩Γ⁰(p)] = p(p+1) = ψ(p²)`; 24/6 = 4 ≠ 8, excluded by `hind` | holds |
| 1.13 | units; `(1+i)/2`; mod 3 | 24 = #SL₂(𝔽₃); distance ½ to 0, 1, i, 1+i; `j ↦ [[1,1],[1,−1]]`: `j² = 2I ≡ −I`, `ij = [[−1,1],[1,1]] = −ji` | holds |
| 2.4 | q = 2, 3 | 6, 4, 12, 8; 48, 36, 72, 54; `λ = (1−q⁻²)/(1−(O|𝔭)q⁻¹)`: 3/2, 1/2, 3/4; 4/3, 2/3, 8/9 | holds |
| 2.6 (sample) | M₂(ℤ₂); O₀(4); `ℤ₂[ω]+2M₂(ℤ₂)`; L₂; `ℤ₂+2O` | ∗; 1; `ω²+ω+1 = 0`, quotient 𝔽₄, index 16/4 = 4, symbol −1, not Eichler; 0 (`L/2L` local, residue 𝔽₂); 0, conductor 2 | holds |
| `existsUnique_gorenstein_saturation` | O₆; ℤ+2O₆ | (⊤, O₆); ((2), O₆), `𝔣 = discrd·nrd(O^♯) = 2` | holds |
| `IsEichler.isBass` | O₀(4); `ℤ₂[ω]+2M₂(ℤ₂)` | superorders O₀(2), M₂(ℤ₂) Eichler hence Gorenstein; second is Bass, not Eichler (converse not claimed) | holds |
| 3.1–3.3 | 2M₂(ℤ) over O₀(2); D = 11, 37 | index 8 ≠ 4²; (h,t) = (2,2), (3,2) | holds |
| 3.6–3.7 | O₀(4); L with `h = (1+i+j+k)/2` | `det w = −4`, `w² = 4I`; `h² = h−1`, `h³ = −1`, `Lh` of order 3 | holds |
| `card_atkinLehnerGroup` | O₆, M₂(ℤ), O₀(4), O₀(6) | 4 = 2², 1, 2, 4 | holds |
| 3.9 | Hurwitz ⊃ level 7 | A₄ on ℙ¹(𝔽₇): orbits 4 + 4, 2 classes = h(2,7) = 2 from 6.6 | holds |
| 3.10 | Hurwitz, norms 3, 5, 9, 15; 2, 4 | 4, 6, 13, 24; 1, 1 | holds |
| 4.3 headlines | O₆, M₂(ℤ) | h = t = 1 | holds |
| 4.4 (sample), `exists_unit_nrd_eq_neg_one` | O₆; O₀(N) | `nrd(1+i+j) = 1 − 3 + 1 = −1`; `diag(1,−1)` | holds |
| 4.5 (sample), 4.6 | O₆ | `{1, w₂, w₃, w₆}`, `(Cl ℤ)[2] = 1`; `im ν = {1,2,3,6}`, `−1 ∈ O¹` | holds |
| 5.1 (sample) | Hurwitz; D = 11, 13, 37 | 1/12 ≤ 1; 5/6 < 2; 1 = 1; 3 = 3 | holds |
| 5.2 (sample), `eichler_mass_formula` | D = 2, 3, 11, 37; (2,3), (2,7) | 2/24 = 1/12; 2/12 = 1/6; 2/4+2/6 = 5/6; 3·2/2 = 3; 2/6 = 4/12; 2·(2/6) = 8/12 | holds |
| 5.3 | `ℚ(√5)` | `ζ_F(2) = (π²/6)(4π²/(25√5)) = 2π⁴/(75√5)`, mass `1/60 = 1/#A₅` | holds |
| `classNumber_eq_one_iff` | D = 2, 3, 5, 7, 13 vs 11, 17, 19, 23, 37 | 1, 1, 1, 1, 1 vs 2, 2, 2, 3, 3 | holds |
| 6.3 | ℤ₂[i] at e = 1, 2 | 1 + 0, 0 + 0 | holds |
| `embeddingNumber_gaussian/eisenstein` | (6,1), (15,4), (6,5), (1,1) | (2,2), (0,0), (4,0), (1,1) | holds |
| 6.6 (sample), `classNumber_eq_mass_add` | D = 2, 11, 37; (2,3), (2,7), (2,5) | 1/12+1/4+2/3 = 1; 5/6+1/2+2/3 = 2; 3; 1/3+0+2/3 = 1; 2/3+0+4/3 = 2; 1/2+1/2+0 = 1 | holds |
| 30.8.5 (6.6 key lemma) | Hurwitz | `1 − 1/12 = ½(½·1 + ⅔·2) = 11/12` | holds |
| 6.7 (sample) | the four values | as in 6.6 | holds |
| `typeNumber_prime` | p = 5, 11, 13, 17, 23, 37 | ½+2/4 = 1; 1+¼+¾ = 2; ½+2/4 = 1; 1+4/4 = 2; 3/2+3/4+3/4 = 3; 3/2+2/4 = 2 | holds |
| 7.1, 7.6 | D = 11 T(2), T(3), T(5); D = 37 T(2) | column sums 3, 4, 6; traces 1, 3, 7 = (p+1) + a_p(11a) with a_p = −2, −1, 1; `w₁T₁₂ = 2·3 = w₂T₂₁`; D = 37 trace 1 = 3 − 2 + 0 | holds |
| 7.2 (R02) | D = 11 | `T(2)T(3) = T(3)T(2) = [[8,6],[4,6]]`, column sums 12 = σ(6) | holds; R02 |
| 7.4 (sample) | Hurwitz n = 3, 9; shorthand | 1/3+2+1+2/3 = 4; 5/4+4+1+8/3+2+2+1/12 = 13; shorthand 13 − 3 = 10 | holds |
| 7.7 | Hurwitz `r(2)`, `r(6)` | 24/24 = 1, 96/24 = 4, constant 1/24 | holds |
| `covolume_gammaOne` | (6,1), (6,5), (1,1), (1,2) | 2π/3; (π/3)·2·6 = 4π; π/3; π | holds |
| `ellipticCount_gammaOne_two/three` | (6,1), (10,1), (6,5), (1,1) | (2,2), (0,4), (4,0), (1,1); `m(ℤ[i],O;O¹) = 2m(ℤ[i],O;O^×)` via a unit of norm −1 | holds |
| 8.4 (sample), `eulerChar_compactifiedQuotient_gammaOne` | (6,1), (6,5), (6,11), (15,4); (14,1), (26,1), (35,1); (1,1) | χ = −1/3+1+4/3 = 2; 0; −4; −8; g = 1, 2, 3; formula 1 ≠ χ(X(1)) = 2, excluded by `hD` | holds |
| 8.5 (sample) | D = 6 | `W ≅ (ℤ/2)²`; `X^*(6;1)` area `2π(−2+½+¾+⅚) = π/6 = (2π/3)/4` | holds; R03 |
| 8.6 | X₀(6;1); (6,101) | Fix(w₂, w₃, w₆) = 1·2, 2·1, h(−24) = 2; `−2 = 4(2g*−2)+6` gives g* = 0; 32 = 8·0 + 32 | holds |
| `exists_principal_polarization` | O₆; M₂(ℤ) | `(i+3j)² = 3 − 9 = −6`; `[[0,−1],[1,0]]² = −I` | holds |
| 9.1 | trace pairings of `i+3j`; D = 21 δ = 21; D = 6 δ = 1 | (0, 6, −6, 0); 4·1/4 = 1 orbit; 2·2/4 = 1 orbit | holds |
| 9.2, `card_autPmMu(_general)` | O₆ deg 1; `μ = i+4j`; M₂(ℤ), `μ = [[1,−6],[4,−1]]` | `{1, μ, k, μk}` with `kμ = −μk`, `nrd k = −3`: 4; `μ² = −13`, pairings (0,6,−8,−1); anticommutant `[[3r−2q, q],[r, 2q−3r]]`, `det = ∓1` iff `(8q−11r)² + 23r² = ±16`, unsolvable: 1 | holds; R03 |
| 9.3 (sample) | D = 6 deg 1, 2, 6; admissible degrees for D = 10, 14, 26, 35 | 4; `ℚ(√−12) = ℚ(√−3)`: D₆; `ℚ(i)`: D₄; {1,2,5}, {1,7,14}, {1,2,13}, {1,5} by 0.6 | consistent; R03 |
| 9.4 | `(x,w) ↦ (w, w⁻¹xw)`; `2+i` | image of product = `(w₁w₂, w₂⁻¹w₁⁻¹x₁w₁x₂w₂)` = product of images; `(2−i)(i+3j)(2+i) = i + 21j − 12k` | holds |
| 9.5 `X(D;N)` (R01) | `D = 6`, `N = 5` | `H = GL₂(𝔽₅) ⋊ 1`: index 4, level 1, prefix `6.1.1.4.0` = X(6;1) | **fails**: R01 |
| 9.6 | X(6;1); X^*(6;1); (6,101) | `1 + 4·¼·2/12 − ½(1 + 4/3) = 0`; `1 + 1/24 − 25/24 = 0`; g = 17, `X₀/W` genus 1 | holds |
| 9.7 | `O₀(2)/2O₀(2)`; right action | fixed module span(E₁₂, 2E₂₁), order 4; `y·((x₁,w₁)(x₂,w₂)) = (y·(x₁,w₁))·(x₂,w₂)` | holds |
| 9.8 (sample) | D = 6, full group | norm classes 1, 6, −3, −18 ≡ −2 | holds; R03 |
| N = 1 table | D = 10, …, 39 | script: (ν₂, ν₃, g) as tabled; `c = (h(−4D) + [D ≡ 3 (4)]h(−D))/2^{ω(D)−1}` = 1, 2, 2, 2, 1, 3, 2, 2, 4, 3, 4 (`h(−140) = 6`, `h(−156) = h(−39) = 4`) | holds |

## Not verifiable

- **LMFDB knowls `shimcurve.label` and `shimcurve.eichler`.** The cached texts are a browser-check page (`lmfdb_shimcurve_label lines 5–9`), though `sources.toml` records them as `certified`.
- **`shimcurve.xdn` and `shimcurve.xdn_star`.** These are needed for R01's `X^*(D;N)`. They are not in `sources.toml` and not cached. Only their identifiers appear, at `lmfdb_shimcurve lines 184–186`.
- **`eichler1955`.** It is cached as the EuDML landing page, not the paper, but recorded as `certified`.
- **`pizer1976`.** It is an image-only scan, and this worker has no OCR. It is listed in `needs-references.toml`.
- **Uncertified works.** `vigneras1980`, `pizer1980`, `ogg1983`, `shimizu1965` and `alsina_bayer2004` are settled as uncertified; no sampled locator needs them.
- **Elaboration at main's Tau Ceti pin `2fd255d99` (R04)** was not run: it is not a command this review may run.

## Source issues

- none
