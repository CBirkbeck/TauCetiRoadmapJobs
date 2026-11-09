# Review of EtaleCohomologyFoundations (pull request #1891 at 6217eb9)

**Verdict:** needs changes

This is a full review at `6217eb9`, the head the previous review read; the folder has not changed since. The previous review's single finding (the pull request description) is not repaired and is carried as R02. The full pass found five more defects. The headline `arithmeticExactSequence` is false as stated, because it omits quasi-separatedness (R01, P1). `MonoidalCategory.IsInvertible` has a second owner in an open revision of EnhancedDerivedSheaves (R03, P2). The remaining three are P3: a new class that restates Mathlib, a smooth base change hypothesis narrower than its source, and two interfaces missing from the supplier contracts.

## R01 (P1) — `arithmeticExactSequence` is false without quasi-separatedness

**Location.** `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` lines 120–122, whose only hypothesis on `X` besides geometric connectedness is `[CompactSpace X]`. The same scope appears in the docstring at line 115 ("Let `X` be a quasi-compact scheme over a field `k` that is geometrically connected"), in the module docstring at line 19, and in `README.md` lines 600–601 ("Let `X` be a quasi-compact scheme over a field `k` (`p : X ⟶ Spec k`, `[CompactSpace X]`)").

**Claim.** Injectivity of `π₁(X_k̄) → π₁(X)` needs every finite étale cover of `X_k̄` to come, up to domination, from a cover over a finite extension of `k`. That descent along `X_k̄ = lim X_{k'}` holds for quasi-compact and quasi-separated `X` (Stacks Lemma 58.14.1, tag 0BTV, `stacks-0BMY` lines 1753–1756). For a quasi-compact but non-quasi-separated `X` it fails. Stacks states the sequence for qcqs `X` (Lemma 58.14.3, tag 0BTX, `stacks-0BMY` lines 1768–1772). SGA 1 IX 6.1 assumes only quasi-compactness and leaves this step to the reader (`sga1` lines 7764–7769); see Source issues. The README's own proof route ("descend along limits of qcqs schemes", §F.0.2) also needs `X` quasi-separated.

**Witness.** Take `k = 𝔽_p` and `A = k ⊕ ⨁ₙ t𝔽_{pⁿ}[t]`. Let `X` be `Spec A` doubled along `W = ⨆ₙ Spec 𝔽_{pⁿ}[t^{±1}]`. Flipping one geometric component of each `Wₙ` gives a connected double cover of `X_k̄` that no open subgroup of `Gal(k̄/k)` fixes, so the map is not injective. The full computation is in the adversarial table.

**Repair.**
- In `Suggested.lean` line 122, write `[CompactSpace X] [QuasiSeparatedSpace X]`.
- In the docstrings (lines 19 and 115) and in README line 601, write "quasi-compact quasi-separated scheme" and add `[QuasiSeparatedSpace X]` to the README's list of hypotheses.
- Add the locator "Stacks, Lemma 58.14.3 (tag 0BTX)" before the SGA 1 locator at README line 620.
- Add the doubled wedge above as a negative-control Check: it is quasi-compact and geometrically connected, but not quasi-separated, and injectivity fails there.

Tested: the repaired signature elaborates on a scratch copy (`#check` shows `[CompactSpace ↥X] [QuasiSeparatedSpace ↥X]`). On the witness, `W = U₁ ∩ U₂` is not quasi-compact, so the repaired statement excludes it. For qcqs `X`, the statement is 0BTX.

## R02 (P2) — The point count over finite extensions still has three owners

Carried from the previous review's R01; not repaired.

**Location.**
- `README.md` line 13: "the count of points over the degree-`r` extension of a finite field from which a zeta series is formed is Scheme.Hom.pointCount of §F.10.1".
- The definition at lines 1342–1345 and the consumer bullet at line 2216.
- The pull request description, last paragraph: "roadmaps citing EtaleCohomologyFoundations labels are unaffected, since no label changes".

**Claim.** This revision introduces Scheme.Hom.pointCount and makes this roadmap its owner; §F.10.1 on main has no count over extensions. Two open roadmaps each define the same count, and the description tells reviewers that the consumers are unaffected.

**Witness.**
- WeilConjectures (#1208, `029d8c2`): `Suggested.lean` line 54 defines `extensionPointCount`, and `README.md` line 115 cites `VanishingCycles.numberOfRationalPoints`, which this head retires.
- DeligneWeightsAndPurity (#929, `5930b27`): `Suggested.lean` line 64 defines `finiteFieldPointCount`, the same `Nat.card` as Tau Ceti's `Scheme.Hom.numberOfRationalPoints`.

**Repair.** No README change. In the description, replace the sentence above with: "No label changes. Two consumers change with it: WeilConjectures replaces `extensionPointCount p X r` by Scheme.Hom.pointCount of §F.10.1, and its citation of `VanishingCycles.numberOfRationalPoints` by Tau Ceti's `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints`; DeligneWeightsAndPurity replaces `finiteFieldPointCount f E` by Tau Ceti's `Scheme.Hom.numberOfRationalPoints` and forms its zeta series from Scheme.Hom.pointCount."

Tested: for `X = Spec 𝔽_{q²}` over `𝔽_q`, all three definitions give `0` at `r = 1` and `2` at `r = 2`, so the replacement changes no value.

## R03 (P2) — `MonoidalCategory.IsInvertible` has two owners

**Location.** `README.md` lines 1878–1880: "An object `T` of a monoidal category is invertible when tensoring with it is an equivalence (the predicate MonoidalCategory.IsInvertible, built here)".

**Claim.** The open revision of EnhancedDerivedSheaves builds the same predicate in its §0.3. It declares itself the single owner and names this roadmap's §F.5 as the consumer. The object therefore has two owners. EnhancedDerivedSheaves comes earlier in the order as a supplier, so it is the owner.

**Witness.** EnhancedDerivedSheaves revision (#1630, `dc57fee`, draft):
- `README.md` line 592 defines `MonoidalCategory.IsInvertible` as "`T ⊗ −` … is an equivalence".
- `README.md` line 3068: "Section 0.3 is the single owner of invertible objects of a monoidal category … for the invertible dualizing objects of étale duality, §F.5): `EtaleCohomologyFoundations`".
- `Suggested.lean` line 178: `class MonoidalCategory.IsInvertible`.

**Repair.**
- At line 1879, replace "(the predicate MonoidalCategory.IsInvertible, built here)" with "(EnhancedDerivedSheaves §0.3's `MonoidalCategory.IsInvertible`)".
- Add "§0.3 `MonoidalCategory.IsInvertible`" to the EnhancedDerivedSheaves row of the supplier table (line 67) and to the *Needs:* line of that paragraph (line 1889).
- Because only that revision defines the predicate, name it in the description's merge-order paragraph: this pull request merges after it.
- If that revision is not to merge first, the alternative is that it drops its §0.3 predicate and its line-3068 claim, and this README keeps "built here".

Tested: after the repair the predicate has one owner. The Check at lines 1896–1897 is unchanged: `Λ(1)` is invertible and `Λ ⊕ Λ` is not.

## R04 (P3) — `IsWeakSerreClass` restates five Mathlib classes

**Location.** `README.md` lines 242–244: "Define the class IsWeakSerreClass of an `ObjectProperty` of an abelian category: it contains zero and is closed under isomorphisms, kernels, cokernels and extensions (Stacks 02MO)."

**Claim.** Each clause is already a Mathlib class on `ObjectProperty` at the pin, with the same meaning. The new class restates their conjunction without citing them.

**Witness.** Mathlib `1b1ccf4b`:
- `ObjectProperty.ContainsZero`: `CategoryTheory/ObjectProperty/ContainsZero.lean` line 38.
- `ObjectProperty.IsClosedUnderIsomorphisms`: `ClosedUnderIsomorphisms.lean` line 30.
- `ObjectProperty.IsClosedUnderKernels` and `ObjectProperty.IsClosedUnderCokernels`: `Kernels.lean` lines 76 and 123.
- `ObjectProperty.IsClosedUnderExtensions`: `Extensions.lean` line 42.

**Repair.**
- Define IsWeakSerreClass as the conjunction of these five Mathlib classes, naming each one.
- Alternatively, state the §F.1 triangulatedness theorem (line 802) with the five instances as hypotheses and drop the new name.
- In either case, list the five classes in the Mathlib supplier row (line 64).

Tested on the Check at lines 252–253: multiplication by `ℓ` on the constant sheaf `ℤ/ℓ²` has kernel and cokernel the constant `ℤ/ℓ`, which uses exactly the kernel and cokernel classes.

## R05 (P3) — The smooth base change hypothesis is narrower than its source

**Location.** `README.md` line 865: "For every torsion abelian sheaf `F` on `T` whose every section is killed by some integer invertible on `S`".

**Claim.** Stacks Theorem 59.89.2 (tag 0EYU) asks only that the stalks at geometric points be torsion of orders invertible on `S` (`stacks-0F1P` lines 8197–8200). Requiring every section over every étale `U` to be killed by a single integer excludes sheaves the theorem covers. §F.3.0 and the Lean headlines already use the correct form: sections over quasi-compact `U`.

**Witness.** Take `S = T = ⨆_{n≥1} Spec ℚ`, `f = g = id`, and `F = ℤ/n` on the `n`-th copy. Every stalk is finite, but the global section `(1)_n` is killed by no integer. So 0EYU applies and the README's statement does not.

**Repair.** Replace the clause with: "whose stalks at geometric points are torsion of orders invertible on `S` (equivalently, every section over a quasi-compact étale `U → T` is killed by an integer invertible on `S`)". Make the matching change to the `D⁺` clause on line 866.

Tested: the witness satisfies the new wording.

## R06 (P3) — The supplier contracts omit two consumed interfaces

**Location.**
- `README.md` line 920 uses Tau Ceti's `TauCeti.Compactification.precomp`. The Tau Ceti row (line 65) lists only `TauCeti.Compactification.sourceIsoEquivalence` from `SourceIso.lean`.
- Lines 83, 2070 and 2115 consume DerivedModuleAlgebra §1.E.0. The DerivedModuleAlgebra row (line 68) lists §0.I.1, §0.2, §1.1, §§1.2–1.5 and §1.T.1 only.

**Witness.** `TauCeti.Compactification.precomp` is at `TauCeti/AlgebraicGeometry/Compactification/SourceIso.lean` line 51 at the pin. DerivedModuleAlgebra on main has §1.E.0 at `README.md` line 2049, which defines `DerivedDeRham.IsPerfect` with the alias `PerfectComplex.IsPerfect` (line 2054).

**Repair.**
- Add `TauCeti.Compactification.precomp` to the `SourceIso.lean` names of the Tau Ceti row.
- Add "§1.E.0 `DerivedDeRham.IsPerfect` and its alias `PerfectComplex.IsPerfect` (perfect module complexes)" to the DerivedModuleAlgebra row.

## Previous findings

- Previous R01 — not repaired. The description still reads "roadmaps citing EtaleCohomologyFoundations labels are unaffected, since no label changes", and the folder has 0 changed lines since the previous review. It is carried as R02, with its witness re-read at both heads: #1208 `Suggested.lean` line 54 and #929 `Suggested.lean` line 64.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.**
  - The worker's run at `6217eb9`: all checks `0`, `build=0`, OK.
  - My re-run of the gate with `--base origin/main` printed `set_option=0 … outside-folder=0 source-material=0 OK`, exit 0.
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check** (`--movable`): `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` exits 0. Its only output is `declaration uses sorry`, at lines 76, 120, 138, 153, 166 and 180.
- **Signatures.** I ran `#check @name` for all eight declarations in one scratch file.
  - Every elaborated type carries the binders its README statement needs.
  - `nagataCompactification` has `[CompactSpace S] [QuasiSeparatedSpace S] [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f]`.
  - The three dimension and finiteness theorems keep `[IsSepClosed k]` and `[LocallyOfFiniteType f] [QuasiCompact f]`.
  - `affineArtinVanishing` keeps `[IsAffine X]`.
  - `EtaleFundamentalGroup` is `Type (u+1)`.
  - No binder was lost. The only mismatch with the mathematics is R01.
- **Padding probe.** I replaced each of the six `sorry`s with `first | simp | rfl | infer_instance | trivial | exact Subsingleton.intro (fun _ _ => rfl)`. All six fail ("Type mismatch" at the last alternative), so none is padding. `EtaleFundamentalGroup` and `EtaleFundamentalGroup.map` are the definitions `arithmeticExactSequence` needs. They have real bodies, and `map_one'` and `map_mul'` are proved.
- **Headline coverage.**
  - Stated: Nagata, the arithmetic exact sequence (R01), the étale dimension bound, affine Artin vanishing, finiteness for constant coefficients, and the vanishing of `ℓ`-adic cohomology.
  - Named in the module docstring as not statable, each with its missing carrier: proper and smooth base change, local acyclicity, the six operations, Künneth, `f^!`, duality, purity, Gysin and blow-up, constructibility and perverse `t`-structures, the monodromy equivalence, the tame character, `ℓ`-adic finite generation and Frobenius modules, and Gauss–Bonnet.
  - Spot-checked docstring claims:
    - `Scheme.EllAdicCohomology` carries only an `AddCommGroup` instance (`Sites/ElladicCohomology.lean` line 79).
    - `TauCeti.inertiaTameCharacter` is for nonarchimedean local fields (`NumberTheory/LocalField/Tame/Character.lean` line 39).
    - Tau Ceti's `TauCeti.Place.tameCharacter` is a finite-level character of a place of a function-field extension, not the profinite character of a trait.
  - The point-count interface of §F.10.1 is definitional and one step from Tau Ceti's `AlgEquiv.numberOfRationalPoints_fixedField_eq_natCard`; it is not a headline.

### Seeded sample: locators checked against the text

- **Carrier and universes.** Mathlib at the pin:
  - `isGrothendieckAbelian_sheaf_smallEtaleTopology` is at `Sites/AffineEtale.lean` lines 149–152, via `AffineEtale.sheafEquiv`.
  - `IsGrothendieckAbelian.{u+1} (Sheaf (ProEt.topology X) Ab.{u+1})` is at `Sites/ElladicCohomology.lean` line 54.
  - `ellAdicSheaf` is `Ab.{u}`-valued (line 64). `EllAdicCohomology` is the `Sheaf.H` of its lift along `AddCommGrpCat.uliftFunctor.{u+1}` (lines 76–77). It is `Subsingleton` on an empty scheme (line 84).
  - EnhancedDerivedSheaves §0.1 on main (`README.md` line 429) identifies the homotopy category of its enhancement with Mathlib's `DerivedCategory`.
- **Invertibility.** This target has no source locator; it is checked by computation in the table.
- **Locally constant sheaves and constructible stratifications.**
  - Stacks 093Q is Modules on Sites, Definition 18.43.1 (read in the cached Stacks chapter; not a manifest entry).
  - 03RW is Definition 59.71.1 (3): Noetherian `Λ`, affine-local, finite type and locally constant (`stacks-0F1P` lines 5397–5410).
  - 095E is Lemma 59.71.2 (qcqs, global partition, `Λ`-modules for Noetherian `Λ`; lines 5422–5429). 09YR is Lemma 59.71.3 (lines 5441–5444). 03RZ (3) is the weak Serre statement (lines 5469–5475).
- **Decomposition and inertia groups of a cover.**
  - 09EA, 09EB, 09EC and 09ED are Lemmas 15.114.1–15.114.2, Definition 15.114.3 and Lemma 15.114.4 (`stacks-09ED` lines 15520–15546). 09ED (4) requires a separable residue extension.
  - The count `|D| = ef = |I|·|Aut(κ(m)/κ)|` is in the proof of 09EE (line 15571).
  - SGA 1 V §2 is cited for the orbit description.
- **Finite-coefficient cohomology and coherent actions.**
  - SGA 4 V–VII is uncertified.
  - Bhatt–Scholze §§3, 5–6 are the sections on repleteness and derived limits (Lemma 3.5.7 at `bhatt-scholze-proetale` line 1210) and on the pro-étale comparison and constructibility.
  - The cited statements are checked by computation.
- **Smooth base change in the rotated square.** 0EYU (`stacks-0F1P` lines 8188–8200) has the same square and the same conclusion `f⁻¹Rᵠg_*F = Rᵠh_*e⁻¹F`. The hypothesis differs; see R05. 0F09 (lines 8526–8540) is the limit corollary.
- **The tame character.** In `stacks-09ED`:
  - 09EE (Lemma 15.114.5, lines 15552–15566): `θ : I_t ≅ μ_e(κ(m))`, `|I_t|` the prime-to-`p` part of `e`.
  - 0BU4 (Definition 15.114.7, line 15626) and 0BU5 (Lemma 15.114.8, lines 15631–15634, `θ(τστ⁻¹) = τ(θ(σ))`).
  - 0BU7 (Lemma 15.114.11, lines 15719–15740, the tower compatibility `θ'^{e'/e} = θ`) and 0BU8 (Remark 15.114.12, lines 15756–15764, `θ_can = qθ`).
  - The Kummer description has the same direction as Tau Ceti's `σ(π^{1/m})/π^{1/m}` (`Tame/Character.lean` line 39).
- **Matrix form of the stable-lattice theorem.**
  - DDT §2.1, p. 54: `ddt-flt` lines 2022–2025, after Proposition 2.6 at line 2006.
  - BHKT Theorem 4.8 (ii), p. 16: `bhkt` lines 739–743.
  - Both are special cases (`G_ℚ` over finite `K/ℚ_ℓ`; profinite `Γ` over `ℚ̄_ℓ`). The general statement is Tau Ceti's `TauCeti.ContinuousRep.exists_stable_lattice` (`StableLattice.lean` line 115) followed by a choice of basis.
- **Saturation and dual lattices.** There is no literature locator, only "elementary arguments". Every assertion is recomputed in the table.
- **Basis-free representations and their sheaf-level counterparts.** `TauCeti.ContinuousRep` takes `Γ A M : Type*` in independent universes (`ContinuousRep.lean` line 82), so `ContinuousRep (EtaleFundamentalGroup x̄) E V` typechecks with `π₁` in `u+1`.
- **Pro-étale coefficient ring objects.** In `bhatt-scholze-proetale`:
  - Definitions 5.5.1–5.5.3 are at lines 1885–1900 and Proposition 5.5.4 at lines 1902–1914. Its condition-(B) half uses Lemma 3.5.7 and Proposition 5.2.6 (lines 1909–1913).
  - Lemma 3.5.7 (4) is the `D⁻` equivalence (line 1215). Proposition 5.2.6 (1) and (3) are at lines 1735–1738.
  - Definition 6.5.1 is at line 2300, Lemmas 6.5.3–6.5.4 at lines 2308–2313, and Proposition 6.6.11 (topologically noetherian `X`) at lines 2529–2531.
  - Lemma 6.8.2 (2), `O_{E,X} = colim_F O_{F,X}` by compactness (lines 2767–2775), is the README's "locally in a finite extension".
  - In `stacks-09BT`: 09C1 is Definition 61.29.1 (line 2661) and 09BT is Definition 61.28.1 (line 2516).
- **Rationalization, lattices and the representation dictionary.** In `bhatt-scholze-proetale`:
  - Proposition 6.8.14 (1) and (2) are at lines 2908–2918.
  - The topologically noetherian restriction starts before Definition 6.8.6 (lines 2840–2845).
  - Proposition 6.8.4 (1) is at lines 2787–2789.
  - Lemma 7.4.3 is at line 3273 (the profinite completion is `π₁^ét`), Lemma 7.4.5 at line 3289 and Lemma 7.4.7 at line 3312.
- **Scheme/descent Frobenius comparison through realization.**
  - Weil I §1 (`deligne-weil-i` lines 23, 79–251) covers the Frobenius `F`, its action and (1.15) geometric Frobenius as the inverse of arithmetic Frobenius. §2 is Poincaré duality.
  - Stacks 03SV is Theorem 64.3.9 (`stacks-03SW` lines 173–174). SGA 4½ [Rapport] is uncertified.
- **Algebraic curve duality and effacement.** In `lrz-relative-poincare`:
  - §6.4 starts on p. 81 (line 5124).
  - Theorem 6.4.1 (smooth proper `f`, dualizable `E`) and Construction 6.4.2 are on p. 82 (lines 5137–5146), as the README says.
  - Theorem 6.1.1 is on p. 66 (line 4217). Proposition 3.2.5 is on p. 24 (line 1277), Definition 3.3.2 on p. 25 (line 1314), and Lemma 3.4.1 on pp. 27–28 (line 1493).
- **The six-operation output structure.** In `stacks-0F7H`:
  - 0F7I is Lemma 63.9.1 (line 1663), 0F7J is 63.9.2 (line 1698), 0F7K is 63.9.3 (line 1894) and 0F7L is 63.9.4 (lines 1951–1964, qcqs square).
  - 0GL5 is Lemma 63.10.7 (lines 2079–2083, torsion `Λ`, unbounded).
  - 0G2C is Lemma 63.11.1 (line 2136), 0GLD is 63.11.6 (line 2189) and 0GLE is 63.11.7 (lines 2201–2212).
  - In `stacks-0FFP`: 0FFP is Definition 4.43.8 (line 4748) and 0FFQ is Lemma 4.43.9 (line 4771).
- **Other locators read in passing.**
  - 0ATT (no density required; `stacks-0F41` lines 4322–4324), 0ATU (line 4342), 0F41 (lines 4714–4715) and Lemmas 38.33.1–38.33.7 (lines 4481–4619).
  - 0F0V (`stacks-0F1P` lines 9332–9333) and 0F1P (lines 9935–9938). §59.96 gives only the finiteness of the cohomological dimension (line 9464), as the README says.
  - In `stacks-03SW`: 03SQ (line 124), 03SW (line 183), 03UG and 03UH (lines 894–897), 03TV (line 523), 03UC (line 809), and §64.16 = 03UF (line 893, Steps 4–7 at lines 962–974).
  - SGA 1 XIII 2.12 is on p. 290 (`sga1` line 11447). It gives the tame `π₁` of a punctured proper curve; with `g = 0` and `n = 2` this supports the `𝔾_m` statement in characteristic 0.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `arithmeticExactSequence` (F.0.A2) | `X = Spec k`; `Spec 𝔽_{p²}` over `𝔽_p`; `𝔾_{m,ℚ}`; the doubled wedge `X = Spec A ∪_W Spec A`, `A = 𝔽_p ⊕ ⨁ₙ t𝔽_{pⁿ}[t]` | `1 → 1 → Γ_k ≅ Γ_k`. For `Spec 𝔽_{p²}`, `X_k̄` has 2 points, so it is excluded. For `𝔾_{m,ℚ}`, the section `s_1` splits `Ẑ(1) → π₁ → Γ_ℚ`. Wedge: `Spec A = {o} ⊔ ⨆ₙ Wₙ`, `Wₙ = D(tₙ) = Spec 𝔽_{pⁿ}[t^{±1}]`; the only idempotents of `A` and `A_k̄` are `0, 1`, so `X` is quasi-compact and `X_k̄` connected. `W_{n,k̄}` has `n` components, cyclically permuted by Frobenius `φ`. Mayer–Vietoris embeds `∏ₙ(ℤ/2)ⁿ/constants` in `H¹(X_k̄, ℤ/2)`. Let `e` be `1` on one component of each block. `φᵐe − e` is nonzero in block `m+1` and zero in block `1`, so it is not constant for any `m ≥ 1`. The double cover `Y_e` therefore has no open stabilizer. Domination by a component of some `Y'_k̄` would give one, because `Gal(k̄/k)` permutes the finitely many components of `Y'_k̄` and the finitely many connected covers a component dominates. Hence injectivity fails. | false without quasi-separated | R01 |
| `nagataCompactification` (G.2) | `𝔸¹_k → Spec k`; the line with doubled origin; `⨆_ℕ Spec k → Spec k` | `ℙ¹_k` works (`Compactification/AffineLine.lean` line 45). The doubled line is not separated, so it is excluded; no compactification exists, since an open immersion followed by a proper map is separated. The disjoint union is not quasi-compact, so it is excluded. 0F41 has the same hypotheses. | true | none |
| `VanishingCycles.etaleCohomologicalDimension` (F.3.0) | `ℙ¹_k̄` with `ℤ/ℓ`; `∅`; `Spec 𝔽_q`; `𝔸¹` in characteristic `p` with `ℤ/p` | `H² = ℤ/ℓ(−1)` at `q = 2 = 2·dim`, allowed, and `H³ = 0`. For `∅`, `2·⊥ = ⊥ < 0` and `H⁰(∅) = 0`. `Spec 𝔽_q` has `H¹ = ℤ/ℓ` and is excluded by `IsSepClosed`. For `𝔸¹` with `ℤ/p`, `hF` fails since `(p : k) = 0`. `hF` quantifies over quasi-compact `U`, which is the stalkwise condition. | true | none |
| `VanishingCycles.affineArtinVanishing` (F.3) | `𝔸¹` in characteristic `p`, `ℤ/p`; `ℙ¹`; `Spec ℝ`, `ℤ/2` | `H¹ = k[t]/(g^p − g) ∋ [t] ≠ 0` at `q = 1 = dim`, allowed, and `H² = 0`. `ℙ¹` is not affine, with `H² ≠ 0`. `Spec ℝ` has `Hⁱ = ℤ/2` for all `i`, excluded by `IsSepClosed`. 0F0V gives `cd(X) ≤ dim X + 0`. | true | none |
| `VanishingCycles.finite_H_constantSheaf` (F.3) | `𝔾_m/k̄`, `M = ℤ/ℓ`; `𝔸¹` in characteristic `p`, `M = ℤ/p`; `Spec ℚ`, `ℤ/2`; `M = 0` | For `𝔾_m`, `H⁰ = H¹ = ℤ/ℓ`. For `𝔸¹` with `ℤ/p`, `H¹` is infinite, excluded by `(Nat.card M : k) = 0`. `ℚ^×/ℚ^{×2}` is infinite, excluded by `IsSepClosed`. For `M = 0`, `Nat.card = 1` and all groups vanish. | true | none |
| `VanishingCycles.subsingleton_ellAdicCohomology` (F.4.4) | `ℙ¹/k̄` at `q = 2, 3`; `Spec 𝔽_p`; `∅` | At `q = 2`, `H² = lim ℤ/ℓⁿ = ℤ_ℓ`, which is not covered since `2·1 < 2` fails. At `q = 3`, `lim H³ = 0` and `lim¹ ℤ/ℓⁿ = 0`, so `H³ = 0`. `Spec 𝔽_p` has `H¹ = ℤ_ℓ`, excluded. For `∅`, Mathlib's `Subsingleton` instance applies (line 84). BS 5.6.2 needs surjective transitions (line 1924), which hold here. | true | none |
| `EtaleFundamentalGroup`, `.map` (F.0.2) | `Spec K^sep → Spec K`; `Spec 𝔽_{p²} → Spec 𝔽_p`; paths defined as field isomorphisms | `Aut(fiber) ≃ Gal(K^sep/K)` by `galContinuousMulEquivAutFiber` (`Galois/FundamentalGroup.lean` line 219). For `𝔽_{p²}`, the map is injective with image of index 2. Paths as field isomorphisms give `Aut(𝔽̄_p)` but are empty between `𝔽̄_p` and `\overline{𝔽_p(t)}`, while the fibre functors there are isomorphic; the Check rules this model out. | true | none |
| Carrier and universes (Conventions) | `Spec 𝔽̄_p`; `∅`; the unlifted `ellAdicSheaf` | `#check` gives `EllAdicCohomology : … → ℕ → Type (u+1)` and `ellAdicSheaf : Sheaf (ProEt.topology X) Ab`. The Grothendieck abelian instance is in `u+1` (line 54); the unlifted sheaf lies outside it. For `∅`, the `Subsingleton` instance applies. | true | none |
| Invertibility (Conventions) | `ℓ = p` on `Spec 𝔽_p`; `ℓ = 2` on `Spec 𝔽_3`; `X = ∅`; `ℓ = 2` on `Spec ℤ` | `p` is not a unit in `𝔽_p`, and `(p : 𝔽_p) = 0`: both false. `2` is a unit in `𝔽_3`, and `(2 : 𝔽_3) ≠ 0`: both true. On `∅` the class holds vacuously while `(p : 𝔽_p) ≠ 0` fails, so "nonempty" is needed. On `Spec ℤ`, `2` is not a unit at `(2)`. | true | none |
| Locally constant sheaves and stratifications (F.0.1) | the skyscraper at the origin of `𝔸¹`; `⊕` of skyscrapers at all `k`-points; `Spec k[x₁,x₂,…]` with the skyscraper at `𝔪` | The origin skyscraper is constructible via `{0} ⊔ 𝔾_m`. The infinite sum is nonzero at infinitely many closed points of every dense open, so it is not constructible. The complement of `{𝔪}`, `⋃ D(xᵢ)`, is not quasi-compact, so `{𝔪}` is not constructible and neither form holds. | true | none |
| Decomposition and inertia groups (F.0.A1) | `z ↦ zⁿ` in characteristic 0; `A = 𝔽₂(u)[[t]]`, `α² − tα − u` | For `zⁿ`, `I_0 = μ_n` with `|I| = n = e`, and `I = 1` over `1`. For `A`: `e = 1`, `f = 2` purely inseparable, and `|D| = ef = 2 = |I|·1` (09EE proof), so `|I| = 2 ≠ e`. The separability hypothesis is needed. | true | none |
| Finite-coefficient cohomology and coherent actions (F.1) | the cone of `ℓ` on `ℤ/ℓ²`; a constant module on a separably closed point; `⊕ₙ ℤ/ℓ` on a point; `C₂` acting on `ℤ/2` | The cone has `H⁻¹ = H⁰ = ℤ/ℓ`. On the separably closed point, `H^{>0} = 0`. `⊕ₙ ℤ/ℓ` is not finitely generated, so not constructible, and its stalks commute with the sum. The equivariant connecting map is defined with `|G| = 2 = 0` in `Λ`. | true | none |
| Smooth base change (F.2.2) | `S = T = ⨆_{n≥1} Spec ℚ`, `f = g = id`, `F = ℤ/n` on the `n`-th copy | 0EYU: the stalks are finite of invertible order, so the theorem applies. README: the section `(1)_n` is killed by no integer, so the README excludes `F`. | narrower than its source | R05 |
| The tame character (F.3a) | `R' = R[π^{1/2}]`, `p ≠ 2`, `ℓ = 3`; `k[t]^h` in characteristic 0; `𝔽̄_p[t]^h` | `σ(π^{1/3ⁿ})/π^{1/3ⁿ} = (σ(π'^{1/3ⁿ})/π'^{1/3ⁿ})²`, so `t_3|_{I'} = 2t'_3 = e·t'_3`. In characteristic 0, `I ≅ Ẑ(1)` through `t^{1/n}`. For `𝔽̄_p[t]^h`, `P ≠ 1` (Artin–Schreier) and `t_ℓ(P) = 0`. The direction matches Tau Ceti's character. | true | none |
| Matrix form of the stable-lattice theorem (F.4.0) | `dim V = 0`; `⟨ℓ⟩ ⊂ GL_1(ℚ_ℓ)`; `E = 𝔽_q((t))` | In dimension 0 the map is to `GL_0 = 1`. `ℓ·ℓᵃℤ_ℓ = ℓ^{a+1}ℤ_ℓ ≠ ℓᵃℤ_ℓ`, so no lattice is stabilized. `Stab(𝔽_q[[t]]ⁿ) = GL_n(𝔽_q[[t]])`. | true | none |
| Saturation and dual lattices (F.4.0) | `ℤ_ℓ` acting on `ℚ_ℓ²` by `[[1,a],[0,1]]`; `Λ₂ = ℤ_ℓe₁ ⊕ ℓℤ_ℓe₂`; `c = ℓ` | `W ∩ ℤ_ℓ² = ℤ_ℓe₁`, and the quotient `ℤ_ℓ` is torsion-free. `Λ₂ ↦ (x + aℓy)e₁ + ℓye₂ ∈ Λ₂`. `Λ₂^∨ = ℤ_ℓe₁^∨ ⊕ ℓ⁻¹ℤ_ℓe₂^∨` is stable under `[[1,0],[−a,1]]`. `(ℓΛ)^∨ = ℓ⁻¹Λ^∨`. With `a = ℓ⁻¹`, `e₂ ↦ ℓ⁻¹e₁ + e₂ ∉ ℤ_ℓ²`. | true | none |
| Basis-free representations (F.4.0) | the trivial representation on `E`; restriction along `.map` | The models are the fractional ideals `ϖᵏ𝒪_E` (a DVR has no others). Restriction is continuous by the §F.0.2 target. The universes typecheck (line 82). | true | none |
| Pro-étale coefficient ring objects (F.4.3) | `Spec 𝔽̄_p`; `∅`; `s : ℕ∪{∞} → PadicAlgCl ℓ`, `s(n) = ℓⁿζ_{ℓⁿ−1}`, `s(∞) = 0` | `Γ(ℤ_ℓ,X) = ULift ℤ_ℓ`. `ℤ_ℓ,∅ = 0`. `s` is continuous because `|s(n)| = ℓ^{−n} → 0`, but `[ℚ_ℓ(s(n)):ℚ_ℓ] = n` is unbounded, so `s` is not a section (BS 6.8.2 (2)). | true | none |
| Rationalization and representation dictionary (F.4.5) | `ℤ_ℓ/ℓ`; rank one on `Spec 𝔽_q` with Frobenius `1+√ℓ`; `E_X` | `ℤ_ℓ/ℓ ⊗ ℚ_ℓ = 0`. `N(1+√ℓ) = 1−ℓ ∈ ℤ_ℓ^×`, so the character is continuous, and `1+√ℓ ∉ ℚ_ℓ`, so it does not come from `ℚ_ℓ`. The lattices of `E_X` are `ϖᵏ𝒪_E,X`. | true | none |
| Frobenius comparison through realization (F.10.2b) | `q = 2`, `μ_5`; `H²_c(𝔸¹)` | Arithmetic `ζ ↦ ζ²`, geometric `ζ ↦ ζ³` (`2·3 ≡ 1 mod 5`). `H²_c = ℚ_ℓ(−1)` has geometric trace `q = #𝔸¹(𝔽_q)`, with `H⁰_c = H¹_c = 0`. | true | none |
| Algebraic curve duality (0.11) | `𝔸¹_k̄`, `Λ = ℤ/n`; a proper smooth genus-`g` curve | `Rℋom(Rf_!Λ, Λ) = Rℋom(Λ(−1)[−2], Λ) = Λ(1)[2] = Rf_*Λ(1)[2]`. For the proper curve, `H¹ × H¹(1) → Λ` is perfect, with `rank 2g` on both sides. | true | none |
| Six-operation output structure (F.5) | the identity; `ℙ¹_S → S = 𝔸¹_k̄`, `n = 3`, `g` a closed point; `n = 1` | All fields are identities for the identity map. `(R²f_*Λ)_s ≅ H²(ℙ¹, Λ) = Λ(−1)`, of order 3 ≠ 0, so a zero base-change field is excluded. For `n = 1` both sides vanish. 0F7L assumes a qcqs square. | true | none |
| Scheme.Hom.pointCount (F.10.1) | `Spec 𝔽_{q²}/𝔽_q` at `r = 1, 2`; `r = 0` | `0` and `2` under pointCount, under #1208's `extensionPointCount` and under #929's `finiteFieldPointCount`. At `r = 0` the splitting field of `X − X` is `k`, giving `#X(k)`. | true; three owners | R02 |
| Invertible objects (F.5) | `Λ(1)`, `n` invertible; `Λ ⊕ Λ` | `Λ(1) ⊗ Λ(−1) ≅ Λ`, so `Λ(1)` is invertible. `Λ ⊕ Λ` doubles ranks, so it is not. #1630's `tensorLeft T` definition is the same predicate. | true; two owners | R03 |
| Weak Serre class (F.0.1) | `ℓ` on `ℤ/ℓ²`; `0 → j_!Λ → Λ → i_*Λ → 0`; the zero sheaf | The kernel and cokernel `ℤ/ℓ` are constructible, all three terms are constructible, and so is `0`. These are exactly Mathlib's `IsClosedUnderKernels`, `IsClosedUnderCokernels`, `IsClosedUnderExtensions` and `ContainsZero`. | true; restates Mathlib | R04 |

### Library declarations opened at the pins

- **Mathlib** (`1b1ccf4b`):
  - `AlgebraicGeometry/Sites/ElladicCohomology.lean` lines 54, 64, 76–84.
  - `AlgebraicGeometry/Sites/AffineEtale.lean` lines 145–155.
  - `CategoryTheory/ObjectProperty/ContainsZero.lean` line 38, `ClosedUnderIsomorphisms.lean` line 30, `Kernels.lean` lines 76 and 123, `Extensions.lean` line 42.
  - `CategoryTheory/Abelian/SerreClass/MorphismProperty.lean` line 66 (`isoModSerre`).
  - The other Mathlib names the README backticks resolve under `#check` with `import Mathlib`, with no unknown identifier among them.
- **Tau Ceti** (`2fd255d9`):
  - `#check` passed for every cited name in the 40 built modules.
  - The rest were read in source: `Blowup/IdealSheaf.lean` line 120, `Blowup/Extension.lean` line 53, `Blowup/Restriction.lean` line 74, `Blowup/StrictTransform.lean` lines 76 and 115, and `CategoryTheory/Filtered/Comparison.lean` lines 62, 83, 89, 119 and 135.
  - In `Compactification/`: `BaseIso.lean` line 102, `DenseReplacement/DualNumber.lean` line 48, `SpecialFiber.lean` line 45, `FlatRefinement.lean` line 98, `Restrict.lean` line 78, `SourceIso.lean` line 51 (`precomp`) and `AffineLine.lean` line 45.
  - In `FiniteEtale/Galois/`: `FundamentalGroup.lean` lines 125, 199 and 219, and `Component.lean` lines 59, 70, 79, 101 and 112.
  - In `RingTheory/StrictHenselization/`: `Henselian.lean` line 45 and `MaximalIdeal.lean` line 80.
  - In `RepresentationTheory/Continuous/`: `StableLattice.lean` lines 100–135, `IntegralModel.lean` lines 72, 114, 211 and 242, and `ContinuousRep.lean` line 82.
  - `NumberTheory/LocalField/Tame/Character.lean` lines 24–79.

### Cross-roadmap citations resolved

All are on main (`3090489`).
- **SchemeAndStackFoundations:**
  - §0.3 (line 551), §0.8 (798), §0.9 (848), §§0.12–0.14 (969, 1032, 1068), §0.21 (1394), §0.23 (1475), §0.23a (1508) and §0.29 (1825), with the five `SchemeFrobenius.*` names at lines 432–433.
  - §1.1 (2071), §2.1 (3265, `Sheaf.H.pullback` at 3268), §2.2 (3309), §2.5 (3388), §2.7 (3482), §2.9 (3582), §2.11 (3656), §2.15 (3867), §2.16 (3896) and §2.17 (3924).
  - §4.11 (5528) and §§5.3–5.5 (6701, 6721, 6768).
- **EnhancedDerivedSheaves:** §§0.1–0.4 (lines 429, 441, 455, 492), the six `ClassicalDerived.*` names (line 30), E2 (2031) and E4 (2565).
- **DerivedModuleAlgebra:** §0.I.1 (555), §0.2 (626), §1.T.1 (1403), §§1.1–1.5 (1573, 1693, 1733, 1788, 1808) and §1.E.0 (2049).
- **Other suppliers:**
  - DGAInfinity Layer 5 (431); PadicMeasuresIwasawaAlgebras §5.1 (3172); StableReduction Layer 4 (529).
  - ModularCurves §4D (1882), with its four names at `Suggested.lean` lines 566, 577, 711 and 725.
  - AlgebraicCurves Layers 8 (870) and 12 (1468); BelyiMaps Layer 12 (3772), §12.5 (3920), §12.6 (3959) and Layer 13 (4289).
  - ProfiniteArithmetic (under `Completed/`); GrothendieckEulerForms Layers 2 (352) and 5 (728); PerfectoidSpaces P5.10–P5.12 (12308, 12368, 12394) and P7.15 (17059).
- **Downstream roadmaps** (LefschetzPencilsAndVanishingCycles, WeilConjectures, FourierDeligneTransform and the other consumers) appear only as deferrals. None is in a *Needs:* line.
- **Citations tool:** all twelve leads resolve. The four `VanishingCycles.*` names are this file's theorems; `ClassicalDerived.*`, `SchemeFrobenius.*` and `StrictHenselization.isDiscreteValuationRing_algebra` are where they are cited.
- **Overlaps tool:** no conflicting head, no dropped id in either direction, and no id that only an open revision defines.

### Ownership against open pull requests

I checked by object with `roadmaps grep`:
- `IsInvertibleOn`, `IsWeakSerreClass`, `Sheaf.IsLocallyConstant`, `ConstructibleStratification` and `EtaleFundamentalGroup`: no other owner.
- `GeometricPoint`: only `AdicSpace.GeometricPoint` (AdicEtaleGeometry on main; #875), which is a different object.
- `weilGroup`: only ClassFieldTheory's local `WeilGroup K`, a different object.
- `toProEt`: the SchemeAndStackFoundations revision #1656. This roadmap on main already owns `ν`, so that duplication is for #1656's review.
- `MonoidalCategory.IsInvertible`: #1630 (R03).
- The point counts: #1208 and #929 (R02).

## Not verifiable

- SGA 4, SGA 4½, SGA 5, Huber (1996), Fujiwara (2002) and Ribet (1976) are uncertified in the manifest and were not read. This affects:
  - the `2 dim X` bound of `etaleCohomologicalDimension` (SGA 4 X);
  - Th. finitude for `finite_H_constantSheaf`;
  - SGA 4 XVI for smooth base change (cross-checked against Stacks 0EYU);
  - SGA 4 XVIII §§1–3 and SGA 4½ [Cycle] §2 for curve duality;
  - SGA 4½ [Rapport] for the Frobenius comparisons;
  - SGA 4 V–VII for finite-coefficient cohomology.
- "Saturation and dual lattices" and "Basis-free representations" carry no literature locator. They were checked by computation only.

## Source issues

- **Error** in sga1 at Exposé IX, Théorème 6.1, p. 195: the source says `1 → π₁(X̄₀) → π₁(X) → π₁(S) → 1` is exact whenever `X₀` is quasi-compact and geometrically connected; it should also assume `X₀` quasi-separated (or Noetherian), as the descent of covers to finite level left to the reader requires; affects a stated result.
