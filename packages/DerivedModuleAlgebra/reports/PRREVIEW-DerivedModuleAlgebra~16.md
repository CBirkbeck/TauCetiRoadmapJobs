# Review of DerivedModuleAlgebra (pull request #1701 at 62d4e4e)

**Verdict:** needs changes

This is a full review of the folder at this head, not an incremental one. Below, "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`.

The folder itself has no remaining defect. The previous R01 (P2) and R02 (P3) are repaired. One P3 finding remains: the previous R03, the pull-request description, which is not repaired. Its repair is an edit to the description on GitHub, not to the folder.

Checks run on this head:
- The gate passes.
- The dependency check reports 0 problems.
- Lean elaborates with 29 `sorry` warnings and nothing else.
- Every locator of the fifteen seeded targets was read in its source.
- None of the four new theorems closes with one tactic.

## R01 (P3) — The pull-request description still describes a README-only amendment

This is the previous review's R03 (and R02 before that), not repaired.

**Location.** The pull-request description (data):
- "README only; `Suggested.lean` is unchanged";
- "Polynomial laws with Roby representability (`PD.robyRepresentability`)";
- "Thirteen roadmaps consume it".

**Claim.** The description summarises what a human approves. Three of its statements are false at this head.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `491 1230` for Lean.
- `robyRepresentability` occurs 0 times in the folder.
- README:2684–2689 lists eighteen downstream consumers.

**Repair.** Edit the description on GitHub:
1. Replace the last sentence of **Summary** with: "The head also replaces main's `Suggested.lean` with the roadmap's headline theorems and the few definitions they need, including the §1.5 ordinary-quotient comparisons on K-flat models."
2. Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv` (README:114, 267).
3. Replace "Thirteen" with "Eighteen".

**Test.** Re-read the edited description against `git diff --stat origin/main...HEAD` and README:2684–2689. All three statements then hold.

## Previous findings

- **R01 (P2), repaired.** The §1.5 comparison is now stated at the pins.
  - Lean:327–337 declares `ordinaryQuotientCompletion` exactly as the repair proposed: Noetherian `A`, a K-flat `P`, `L := Rlim` of `(reductionFunctor I).mapHomologicalComplex` applied to `P`, and `∃ η, derivedCompleteness A I L ∧ ∀ N, … → Bijective (η ≫ ·)`.
  - Lean:346 adds `_of_boundedTorsion` (hypothesis `hA`, ideal `Ideal.span {f}`).
  - The head goes further than the repair:
    - Lean:368 adds `_of_isWeaklyRegular`, for Stacks Tag 062F with Tag 0920;
    - Lean:389 adds `nonempty_ordinaryQuotientCompletionHomologyIso`, for Tag 0A06.
  - The import of `Tower.Reduction` is added (Lean:7).
  - The docstring's §1.4 bullet keeps only the Koszul tower (Lean:74–79), and §1.5 joins the model-form list (Lean:54–57).
  - The README follows: :2062–2076 for the text, :2081–2088 for the *Needs:* line, :112 for the supplier row, :70 for the cited-names row.
- **R02 (P3), repaired.** Lean:86–92 now reads "their statements concern the strict tower of `A`-complexes obtained by restricting the semilinear chain maps … and the derived category `D(Mod(ℕ,(A_n)))` …, both constructions of §1.E.0". It makes no claim about morphisms.
- **R03 (P3), not repaired.** This is R01 above.

## Verified sound

### Gate, dependency check, worktree

- **Worktree.** At `62d4e4ee`, clean.
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
  - `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's files, unchanged by the pull request.
- **Gate (my run).** Every text counter is 0, then `OK`, exit 0. The worker's record for this head also has `build=0`.
- **Dependency check.** Output:

```text
depcheck: 239 roadmaps, 2367 edges, 0 problem(s)
```

- **Supplier citations.**
  - The only roadmap supplier is AlgebraicTopology Stage 6, item 0, *Countable inverse-system algebra*. It is on main at its README:954.
  - The new *Needs:* items are all pinned declarations, opened at the pin:
    - Tau Ceti `TauCeti.ModuleTower.reductionFunctor` (`Tower/Reduction.lean`:377). Its object is `reduction I M`, with `obj n = M ⧸ I^(n+1) • ⊤` (line 86) and the quotient maps as transitions.
    - Tau Ceti `TauCeti.ModuleTower.derivedLimit` (`Tower/DerivedLimit.lean`:310), with both `HasDerivedCategory` instances as section variables (line 305).
    - Tau Ceti `CochainComplex.IsKFlat` (`KFlat/Basic.lean`:89): `tensorObj K A` is acyclic for acyclic `A`, so the K-flat factor is the left one, as in `P ⊗ A/I^(n+1)`.
    - Tau Ceti `exists_quasiIso_isKFlat_moduleCat` (`ModuleCat/KFlat.lean`:39) and `TauCeti.ArtinRees.exists_controlled_lift` (`RingTheory/Ideal/ArtinRees.lean`:85).
    - Mathlib `Ideal.ofList` (`RegularSequence.lean`:42, `span {r | r ∈ rs}`) and `RingTheory.Sequence.IsWeaklyRegular` (line 136: each `rs[i]` is regular on `M ⧸ ofList (rs.take i) • ⊤`, which allows `A/I = 0`).
- **Gaps.** None are declared and none are needed.

### Elaboration, signatures, padding

- **Elaboration.** `lake env lean` on Lean exits 0 with exactly 29 "declaration uses `sorry`" warnings: r15's 25 plus the four new theorems at 327, 346, 368 and 389. Nothing else is printed.
- **Signatures.** I elaborated `#check @name` for all 39 declarations (the local instance aside) in one scratch file. Each matches its README statement.
  - The two Noetherian theorems keep `[IsNoetherianRing A]`.
  - `_of_boundedTorsion` keeps `hA`, `_of_isWeaklyRegular` keeps `hreg`, and all four keep `[P.IsKFlat]`.
  - The 0A06 theorem keeps `hfin` for every degree.
  - No declaration lost a binder.
- **Padding probe.** I replaced each new `sorry` with `first | rfl | (simp; done) | infer_instance | exact?`. All four fail with "`exact?` could not close the goal", so none is padding.

### Seeded sample: every locator read in its text

The texts not in the package manifest were fetched through the sources service into a scratch copy of the manifest; the real manifest is untouched. They are Prisms (arXiv v4), SAG (author page), DM, Bhatt12, BL22 (arXiv), and StacksAlg, StacksDefos and StacksSimp (Stacks PDFs).

| Target | Locator in README | Found at | Result |
| --- | --- | --- | --- |
| 0.1 | StacksCt Def. 3.1 (08PM) p.2; Remark 5.5 (08QI) p.9; Lemmas 4.1–4.3, 5.6–5.7, pp.4–10 | StacksCt line 81 (p.2), 360 (p.9), 144/169/193 (pp.4–5), 382/395 (pp.9–10) | Correct. Remark 5.5 gives the three equivalent resolution conditions and `Lπ_!F = F(P•)` |
| 0.3 | DoldPuppe 1.15 p.209; Satz 3.31 p.225; 4.1–4.7 pp.227–229; SAG 25.2.1.2–3 pp.1698–1699 | DoldPuppe lines 301 (p.209), 856 (p.225), 917–961 (pp.227–228); SAG lines 62226, 62247 | Correct. 1.15 says functors preserve homotopies; 3.31 that N and K preserve homotopies; 4.4 that projective resolutions are homotopy equivalent; 4.7 that additive F gives the classical derived functor |
| 0.7 | StacksCt Lemma 13.3 (09CG) p.26; 11.2–11.3 (08RA, 08RB) p.21 | lines 1146, 916, 933 | Correct. `τ≥−2 L` is the Lichtenbaum–Schlessinger complex; `τ≥−1 L` is the naive complex |
| 0.13 | StacksCt 14.2 (08SJ), 14.4 (08SL), pp.29–31 | lines 1290, 1303 (both p.29) | Correct. 14.2 is for a Koszul-regular kernel; 14.4's polynomial presentation argument runs verbatim for smooth `P` |
| 0.14 | SAG Constr. 25.2.2.2 p.1700, 25.2.3.1–25.2.3.4 pp.1700–1704; BL22 B.1, B.5 pp.225–226 | SAG lines 62288 (p.1700), 62365, 62398, 62405, 62412 (pp.1702–1703); BL22 lines 10001 (p.225), 10042 (p.226) | Correct. SAG's signed-coinvariant definition is wrong at 2, as the README warns: see Source issues |
| 0.17 | DM Lemma 3.3 pp.21–22; SAG Prop. 25.2.4.2 pp.1704–1707; Bhatt12 Prop. 3.22, Remark 3.43 pp.11–12, 18 | DM line 863 (p.21); SAG line 62450 (p.1704), proof to p.1707; Bhatt12 lines 523 (p.11), 893 (p.18) | Correct |
| 0.25 | StacksCt 16.1 (08SP) p.31, 21.1 (08UZ) p.37; StacksAlg 10.99.8 (051C) pp.233–234; StacksDefos 2.1 (08S5) p.2; GR 2.5.32 p.35, (3.2.7)–3.2.11 pp.41–42 | StacksCt lines 1408, 1676; StacksAlg line 11014; StacksDefos line 56; GR lines 1685, 1986–2016 | Correct |
| 1.1 | StacksMA 15.89.1, 15.89.3–4, Remark 15.89.10, 15.89.11–12, pp.238–242 | lines 10946, 10971 (p.238), 10983 (p.239), 11108 (p.241), 11124, 11133 (p.242) | Correct |
| 1.3 | StacksMA 15.93.10, .18, .20, .21; pp.264, 267–268 | lines 12163 (p.264), 12293 (p.267), 12344, 12374 (p.268) | Correct. 15.93.10 gives `K^∧ = RHom(extended Čech complex, K)` |
| 1.4 | StacksMA 15.93.18 (0920), pp.266–267 | line 12293, p.267 | Correct statement. The range also covers Lemma 15.93.17 on pp.266–267, which the lemma's first proof uses. Not raised, as in r15 |
| 1.5 | StacksMA 062F, 062G pp.76–77; 0920 p.267; 091L p.242; 0921, 0922 pp.275–276; 091X, 0923 pp.271–272; 0A06; 0BKH; Prisms fn. 5 pp.10–11 | lines 3571, 3591 (p.76, proof on p.77), 12293, 11133, 12717 (p.275), 12739 (p.276), 12496, 12520 (p.271), 12756 (p.276), 12704 (p.275); Prisms line 399 (fn. 5, p.10) | Correct. 062F's hypothesis is exactly Mathlib's weak regularity. 0923 is an "iff" for bounded torsion. 0A06 assumes all `Hⁿ` finite, with no boundedness |
| 1.6 | StacksCt 08PM, 08QI; Prisms §1.2, fn. 6, pp.10–12 | Prisms footnote 6, p.11 (`A_n = Kos(A; fⁿ)` as simplicial rings, `Â = lim A_n`) | Correct |
| 1.7 | Prisms §1.2 p.11; BMS19 Def. 4.1 p.220, Lemmas 4.4–4.7, Cor. 4.8 pp.220–223 | Prisms p.11 (complete flatness, Tor amplitude); BMS19 lines 850, 872 (p.220), 888–908 (p.221), 958 (p.223) | Correct |
| 1.8 | BMS19 Lemmas 4.6–4.7, Cor. 4.8 pp.221–223 | lines 895, 908 (p.221; 4.7(2) p.222), 958 | Correct. 4.7(1) gives `M ⊗ A[pⁿ] → M[pⁿ]` an isomorphism, as in Lean:443–449 |
| 1.9 | BMS19 Thm 3.1, proof assertion (1), Remark 3.2 pp.217–218; 4.4, 4.5(2) pp.220–221; 4.8(3), Remark 4.9 p.223 | lines 751 (p.217), 784 (p.218), 888, 958, 973 | Correct. Remark 3.2 is the hyperdescent caveat the README repeats |

The README flags no locator as unverified.

### Adversarial table

Values in rows marked **(r16)** were computed this round. The other rows were recomputed from their stated instances this round, where noted; they agree with r13–r15.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| `ordinaryQuotientCompletion` (Lean:327) **(r16)** | `ℤ`, `(p)`, `P = ℤ[0]`; `I = 0`; `I = A`; `A = 0`; `ℤ_p ⋉ ℚ_p/ℤ_p` | **`ℤ`:** tower `ℤ/p^(n+1)`, `L = ℤ_p[0]`, `η` the completion unit. **`I = 0`:** constant tower, `L = P`, `η = id`, every `N` complete. **`I = A`:** tower 0, `L = 0`; complete `N` are 0, so both Hom sets are singletons. **`A = 0`:** `D(0)` is trivial. **`ℤ_p ⋉ ℚ_p/ℤ_p`:** naive `ℤ_p[0]`, but `H^−1(Λ A) = T_p = ℤ_p`; not Noetherian, so excluded | True | none |
| `_of_boundedTorsion` (Lean:346) **(r16)** | `f = 0`; `f = 1`; `k[ε]/ε²`, `f = ε`; `ℤ[x_i]/(p x_i)`, `f = p` | **`f = 0`:** `hA` holds with `c = 1`, `I = 0`, `L = P`. **`f = 1`:** `I = A`, `L = 0`. **`ε`:** `c = 2`; tower `P/εP, P, P, …`, so `L = P`; `I` nilpotent, so every object is complete, `A[1/ε] = 0`. **`p`:** torsion is `(x_i)`, killed by `p`, so `c = 1`. Tag 0923: pro-iso `{[A --fⁿ→ A]} ≅ {A/fⁿ}`, since `A[f^(n+c)] → A[fⁿ]` by `f^c` is 0 | True | none |
| `_of_isWeaklyRegular` (Lean:368) **(r16)** | `[]`; `[p, 1]` over `ℤ`; `[x₁, x₂]` in `ℤ[x_i]`; `[f]` with `f` regular | **`[]`:** `I = ⊥`, `L = P`. **`[p, 1]`:** weakly regular, `I = ℤ`, `L = 0 = Λ`. **`[x₁, x₂]`:** powers Koszul-regular by 062G applied twice with symmetry. `(x₁ⁿ, x₂ⁿ) ⊂ Iⁿ` and `I^(2n−1) ⊂ (x₁ⁿ, x₂ⁿ)`, so pro-iso. **`[f]`:** agrees with the bounded-torsion row with `c = 0` | True | none |
| `nonempty_…HomologyIso` (Lean:389) **(r16)** | `ℤ`, `(p)`, `ℤ[0]`; `F_p[0]` via `[ℤ --p→ ℤ]`; `⊕_n ℤ[n]`; `ℚ_p/ℤ_p` over `ℤ_p` | **`ℤ`:** `H⁰ = ℤ_p = ℤ^`. **`F_p`:** `H^−1` levels `pⁿℤ/p^(n+1)` with zero transitions, so `lim = lim¹ = 0`; `H⁰ = F_p`. **`⊕_n ℤ[n]`:** unbounded, degreewise `ℤ_p`, as 0A06 allows. **`ℚ_p/ℤ_p`:** `[ℤ/p^(n+1) → 0]` gives `H^−1 = ℤ_p`, but `(H^−1)^ = 0`: `hfin` fails, so needed | True | none |
| §1.5 Check "each hypothesis covers…" (README:2093–2099) **(r16)** | `ℤ[x_i]/(p x_i)`; `ℤ[x₁, x₂, …]`; `k[x,y]/(xy)` | **First:** torsion `= ⊕_(m≠1) F_p·m`, so `c = 1`; `p·x₁ = 0`, not weakly regular; not Noetherian. **Second:** `(x₁, x₂)` is not principal. **Third:** a nonzerodivisor `f₁ ∈ (x, y)` leaves `(A/f₁)_m` Artinian, whose maximal ideal is all zero divisors, so no weakly regular list generates `(x, y)`; `m/m²` has dimension 2, so not principal | True | none |
| §1.5 Checks `A/I = 0`, `F_p[0]`, `ℚ_p/ℤ_p`, `k[x,y]/(xy)` (README:2100–2112) **(r16)** | as stated | `ℤ/I^(n+1) = 0` and `Λ = 0`; the `F_p` and `ℚ_p/ℤ_p` values as in the 0A06 row; `Λ_I A = k[[x,y]]/(xy)` (finite module over a Noetherian ring) | True | none |
| §1.5 Check `R ⋉ T` nonsplit (README:2113–2128) **(r16)** | `C = Λ_(p)(A[0])` | Koszul tower: `H^−1 = T[pⁿ]` with `×p` (onto), `H⁰ = R/pⁿ`, so `H^−1(C) = H⁰(C) = R`, with `T` acting by 0. `R[1]` is complete (telescope bijective), so `Hom_(D(A))(C, R[1]) = H⁰(R[1]) = 0`. A splitting would give a nonzero projection. Stacks Tag 0BKH says `≅ ℤ_p[1] ⊕ ℤ_p[0]`: true only after restriction (see Source issues) | True | none |
| Docstring §1.4 bullet (Lean:74–79) **(r16)** | pin grep | `TauCeti.koszulComplex` is one `ℕ`-indexed chain complex with `map` between two complexes. Assembling `n ↦ K(fⁿ)` into `CochainComplex (ModuleTower A) ℤ` tensored with `P` is a several-step construction, not a short definition | Holds | none |
| Docstring §1.9 bullet (Lean:82–85) **(r16)** | pin grep | Mathlib `cechConerve` (`AlgebraicTopology/CechNerve.lean`:234) is the uncompleted conerve. No product totalization of a double complex at either pin: grep for `totalProd`/`productTotal` finds only a topology file | Holds | none |
| Docstring §1.E bullet (Lean:86–92) **(r16)** | README §1.E.0 | Every object named has a "Construct" sentence: README:2414, 2440–2442, 2454–2457 | Holds | none |
| §0.1 Check (README:781–784) | constant `A[t]` over `A[t]/(t²)`, `A ≠ 0` | Complex `A[t] ←0− A[t] ←id− …`, `H₀ = A[t]`; `H₀ → B` has kernel `t²A[t] ≠ 0` | True | none |
| `quasiIso_whiskering_of_projective` (Lean:174) | `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `F = V ⊗ V`; `F = id`; constant `F` | Source `H₁ = Tor₁(ℤ/2, ℤ/2) = ℤ/2`, target `H₁ = 0`: the target is not projective, so excluded. `F = id` is the hypothesis. Constant `F` gives `R′` in degree 0 on both sides | True | none |
| §0.7 Check (README:1325) **(r16)** | `k[x,y]/(x,y)²` | `Rel = ⟨r₁ = (y,−x,0), r₂ = (0,y,−x)⟩`, `TrivRel = ⟨x r₁, y r₂, y r₁ + x r₂⟩`. `Rel/TrivRel` has basis `r₁, r₂, y r₁`; `y r₁ ↦ y²e₁ − xy e₂ = 0`; `H^−2 = k` | True | none |
| §0.13 Checks (README:1510–1512) | `(p) ⊂ ℤ`; `k[X]/X²`; char 2; empty | `(p)/(p²)[1] = F_p[1]`; `X² ↦ 2X dX`; zero map in char 2; empty sequence gives 0 | True | none |
| §0.14 Check (README:1544–1545) | `Be` over `F₂`, `ℤ` | `∧²(Be) = 0`; signed coinvariants `Be⊗Be/(2e⊗e)` give `F₂`, resp. `ℤ/2` | True | none |
| `exteriorPower_decalage` (Lean:197) | `n = 0, 1, 2`; `N = R`; `F₂`; `N = ℤ/2` | `R`, `N`, then `R` in degree 2 `= Γ²(R)`; over `F₂`, `γ₂(1) ≠ 0`. For `ℤ/2`: `F₂` against `Γ²_ℤ(ℤ/2) = ℤ/4` (`2γ₂(1) = γ₁(1)² ≠ 0`, `4γ₂(1) = γ₂(2) = 0`), so flatness is needed | True | none |
| `symmetricPower_decalage` (Lean:215) | `N = R`, `n = 2`; signed model | `R → R` with unit differential, acyclic `= ∧²R = 0`. Signed coinvariants over `F₂` would predict `F₂`, which is excluded | True | none |
| `simplicialTensorComparison` (Lean:134) **(r16)** | bidegree (1,1) | `d∇(x⊗y) = s₀d₀x⊗y + x⊗s₀d₁y − x⊗s₀d₀y − s₀d₁x⊗y = ∇d(x⊗y)` with `∇ = s₁⊗s₀ − s₀⊗s₁`. The opposite sign fails unless `2 = 0` | True | none |
| §0.25 Checks (README:1697–1711, 1740–1744) | `k[x]/x³ → k[x]/x² → k`; `ℤ/4 → F₂`, `c = 0`; `A′ = A = B = ℤ`, `c = 0` | `H^−1(L_(A/A′) ⊗ k) = k·x²` maps to 0 in `(x)/(x²)`, so the connecting map is onto `k`. `B′ = F₂[ε]` has `JB′ = 0`, `B′/JB′ ≠ B`, `Tor₁^(ℤ/4)(F₂, B′) = B′ ≠ 0`. `ℤ[ε]/ε²` has nonzero kernel | True | none |
| `derivedLimit_isTriangulated` and §1.1 Checks | `ℤ` with `×p`; `[ℤ → ℤ/p^(n+1)]`; `Σ9^m` | `lim = 0`, `lim¹ = ℤ_p/ℤ`. `H⁰ = p^(n+1)ℤ` is not Mittag-Leffler, so `H¹(Rlim) = ℤ_p/ℤ`. `Σ9^m = −1/8 ∉ ℤ` | True | none |
| §1.2 laws (Lean:268–294) | `I = A`; `I = 0`; `ℚ_p` over `ℤ` | `Hom(A[n], M) = H^(−n)(M)`, so `M = 0`; at `I = 0` every object; `ℤ[1/p] → ℚ_p` is a nonzero class | True | none |
| `derivedCompleteness_isRightAdjoint`, §1.3 Checks | `ℤ`; `ℤ[1/p]`; `ℤ/p^m`; `ℤ[−1]` | `ℤ_p`; `0`; fixed; `ℤ[−1]` detected only at `n = −1` | True | none |
| `completeNakayama` (Lean:310) | `ℤ[1/p]`; `m ⊂ O_ℂp` | `h` holds and `hc` fails; `m = m²` with `hc` and `h` holding but `m ≠ 0`, so `hI` is needed | True | none |
| §1.4 Checks (README:2038–2040) **(r16)** | `(p)`; `(0)` | `pⁿ·p = p^(n+1)`, so `(×p, id)` is a chain map. `M ⊕ M[1]` with zero transitions on `M[1]` is Mittag-Leffler, so `Rlim = M` | True | none |
| §1.6 Check (README:2233–2239) | `P• → 0` | `P₀ = A[t]`; `Hom_(S_A)(0, P•) = ∅`, `Hom(A, P•) = {*}`; in `H_A` both are singletons | True | none |
| §1.7 Checks | `ℤ`; `F_p` | `ℤ` is flat with `Ext¹(ℤ[1/p], ℤ) = ℤ_p/ℤ ≠ 0`, so not complete; `F_p ⊗^L F_p` has `H^−1 = F_p` | True | none |
| `cohomologicalAmplitude_of_completeTorAmplitude` (Lean:418) | `ℤ[1/p][−1]`; `Λ(A[0])` for `R ⋉ T` | Every amplitude holds but `H¹ ≠ 0`, so `hc` is needed. `H^−1 = ℤ_p` with reduction `[0, 0]`, so `hA` is needed | True | none |
| Lean:437, 456 (BMS19 4.7) | `ℤ/4`, `M = ℤ/2`; `M = ℤ/4` | `M/4M = ℤ/2` is not flat (`Tor₁ = ℤ/2`); for `ℤ/4`, `1 ⊗ 2 ↦ 2`, an isomorphism `ℤ/2 ≅ 2ℤ/4` | True | none |
| §1.9 Checks | `ℤ_p → ℤ_p × ℤ_p`; `ℤ_p → F_p` | A section splits the Čech nerve; `Tor₁^(ℤ_p)(F_p, F_p) = F_p` | True | none |
| `isPerfect_*`, `isPerfect_baseChange` (Lean:493–526) | `eA ⊂ k × k`; `[ℤ --2→ ℤ] → F₂`; bi-infinite `ℤ/4` | Euler ranks `(1, 0)`; `[F₂ --0→ F₂]`; `F₂` in every degree when the bound is dropped | True | none |
| `ringTowerLimit_jacobson`, `pseudoCoherent_residueCriterion` (Lean:537, 550) **(r16)** | `k[t]/(t^(n+1))`; `R = 0`; `a > b` | `1 + t` is a unit, `t` is not. At `R = 0`, `hfib` is vacuous and `E = 0`. With `a > b`, all fibres are acyclic, so `P ≃ 0` | True | none |
| `biduality_of_finite/artinian` (Lean:574, 587) | `ℤ_p`; `ℤ_(p)` | `End(ℚ_p/ℤ_p) = ℤ_p ≠ ℤ_(p)`, so completeness is needed | True | none |

### Headline theorems

- **Stated in Lean:**
  - S.1 second page;
  - §0.2.2 Eilenberg–Zilber, both forms;
  - §0.3 resolution independence;
  - §0.17 both décalages;
  - §1.1 exactness;
  - the §1.2 laws;
  - the §1.3 reflector and Nakayama;
  - the §1.5 comparisons and the 0A06 computation;
  - §1.8, three theorems;
  - §1.E.0 perfection, base change, unit reflection and the residue criterion;
  - §1.M Matlis duality.
- **Named in the docstring with the missing carrier:**
  - `⊗^L` and derived scalar extension;
  - the S.1 edge maps and exact sequences;
  - the cotangent complex;
  - `LF`, `L∧ⁿ`, `LSymⁿ`, `LΓⁿ`;
  - the §1.1.1 adjunction;
  - the §1.4 Koszul tower;
  - §1.6;
  - §1.9;
  - §1.E effectivity.
- **§1.7.** The completion laws (README:2267–2269) are no longer listed as unstatable. They are one-step consequences of BMS19 Lemmas 4.4–4.5, each with a one-line proof (BMS19 lines 883, 892), so they are lemma-level rather than headlines. Their absence from Lean is not a finding.

### Duplication, ownership, overlaps

- **The new names.** `roadmaps grep` finds them only in this folder. The roadmaps that cite §1.5 by its title "When ordinary quotient towers compute completion" all consume it and none owns it:
  - CrystallineCohomology #857, README:2436, 5087;
  - DerivedDeRhamCohomology #868, README:546, 2833, 3608;
  - ArithmeticGaloisDuality #858, README:4841, 4850;
  - DeformationAndDerivedPatchingAlgebra #1034, README:1514.
- **Citations of `ordinaryQuotientCompletion`.** It is cited by PerfectoidSpaces on main (README:10971) and HabiroRings #1425 (README:61). README:70 maps it to all three variants.
- **EnhancedDerivedSheaves.** Main README:476–478 consumes the module reflector, `DerivedDeRham.completionUnit` and the ordinary-quotient comparison from here; its README:540 extends completion to replete topoi. The supply runs in one direction.
- **`overlaps.md`.**
  - No other open pull request changes this roadmap.
  - No cited id is dropped or defined only by a revision.
  - The dropped §1.T.1 ids and the `#1t1-towers-lim-and-lim¹` anchor are mapped at README:34–36.
- **`citations.md`.** All 97 leads are names in the left column of the cited-names table (README:41–76), resolved by its right column, or the four §1.5 names, resolved by `#check`.

## Not verifiable

All of these lie outside the seeded sample.

- **NSW printed and PDF pages** (README:960–962). The cache entry for NSW holds only the authors' landing page, not the PDF.
- **IllusieCC, Chapter II, 1.2.6.2** (README:1423). Springer LNM 239 is paywalled; I found no open copy.
- **StacksSites Remark 21.39.11** (README:1035). Not re-read this round.

## Source issues

- **Error** in StacksMA at §15.96 opening paragraph, Tag 0BKH, p.275: the source says the derived completion of `A[0]`, `A = ℤ_p ⊕ ℚ_p/ℤ_p`, is `ℤ_p[1] ⊕ ℤ_p[0]`; it should say this only after restriction to `D(ℤ_p)`, since `Hom_(D(A))(K^∧, ℤ_p[1]) = 0`; affects nothing.
- **Misprint** in StacksMA at Lemma 15.93.21, Tag 0AAJ, proof of (2), p.268 (line 12394): the source says `H^i(C^∧) = 0` for `i < r`; it should say for `i < −r`; affects nothing.
- **Error** in SAG at Construction 25.2.2.2, p.1700 (also Proposition 25.2.3.4(2), p.1703): the source defines `∧ⁿ` as signed coinvariants of `M^⊗n` and claims a free basis of rank `(m choose n)`; it should use the quotient by tensors with two equal factors (`∧²ℤ` would otherwise be `ℤ/2`); affects a stated result.
- **Misprint** in SAG at §25.2.4, p.1705 (line 62476): the source heads the second proof "Proof of Proposition 25.2.4.1"; it should say "Proof of Proposition 25.2.4.2" (Illusie's décalage); affects nothing.
