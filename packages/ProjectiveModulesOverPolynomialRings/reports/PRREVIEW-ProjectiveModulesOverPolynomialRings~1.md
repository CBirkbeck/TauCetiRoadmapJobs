# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at ced2754)

**Verdict:** needs changes

## R01 (P1) — Check of 3.1 localises at the wrong prime

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md` lines 339–341: "`IsExtendedAfter ℤ (Localization.AtPrime (Ideal.span {3})) M` fails: the base change is `𝔽₂` with `X` acting by `0`".

**Claim:** For `M = ℤ[X] ⧸ (2, X)` the predicate fails at the prime `(3)`.

**Witness:** In `ℤ_(3)` the element `2` is a unit, so `ℤ_(3)[X] ⧸ (2, X) = 0` and the predicate holds. The Checks of 3.2 (`I = 2ℤ`) and 3.3 ("at the other maximal ideals `(p)` it becomes `0`") say so.

**Repair:** Replace `Ideal.span {3}` by `Ideal.span {2}`. Then the base change is `ℤ_(2)[X] ⧸ (2, X) = 𝔽₂` with `X` acting by `0`, `M(0) = 𝔽₂`, and `ℤ_(2)[X] ⊗ 𝔽₂ = 𝔽₂[X] ≠ 𝔽₂`: the predicate fails, as the Check intends.

## R02 (P1) — Local Horrocks is used by 4.2 and 4.3 and is no target

**Location:** `README.md` lines 437–440 (4.2): "Theorem 2 of Quillen 1976 (local Horrocks plus 3.3) makes it extended"; lines 460–462 (4.3): "hence free by 4.2".

**Claim:** The routes of 4.2 and 4.3 have all their inputs among the targets.

**Witness:** 4.3 uses 4.2 over local `A_m`; 4.2's route assumes that local case and bundles on `ℙ¹_A` (Quillen1976 lines 117–122 quote Horrocks). No layer, supplier or pinned declaration states either. Quillen1976 line 131 glues off the zeros of `T·f`, not `X = 0`.

**Repair:** Make local Horrocks the first theorem of Layer 4 after 4.1 and reorder, so that no `ℙ¹` is needed:

- "**Local Horrocks.** For a local ring `A`, a finitely generated projective `A[X]`-module `P` with `A⟨X⟩ ⊗[A[X]] P` free is free (Lombardi–Quitté, Theorem XVI.4.3, p. 912; Horrocks 1964, Theorem 1, for Noetherian `A`). Route: the monic polynomials and `1 + m[X]` are comaximal (Lombardi–Quitté, Lemma XVI.4.4); split off free summands of rank one by induction on the rank, and treat rank one through stable isomorphism (Lemma XVI.4.6). *Needs:* 4.1."
- Affine Horrocks (now 4.3) cites local Horrocks, 3.3 and the descent of R04; 4.4 is unchanged.
- Quillen's form (now last): "By affine Horrocks `P ≅ A[X] ⊗[A] P(0)`; then `A⟨X⟩ ⊗[A] P(0) ≅ A⟨X⟩ ⊗[A] Aʳ`, and 4.4 gives `P(0) ≅ Aʳ`. *Needs:* affine Horrocks, 4.4."

Update the Dependencies paragraph of Layer 4 and the 4.2 references in 4.1, 5.2 and "How to read the build" accordingly.

## R03 (P2) — Layers 1.1–1.2 and 2.1–2.3 have a second owner in an open pull request

**Location:** `README.md` lines 43–48: "finds no other owner. PadicDifferentialEquationsAndRigidCohomology §RD.3.27 states a rigid-analytic Quillen–Suslin theorem … and stays there"; lines 593–597: "does not cite this roadmap".

**Claim:** No other roadmap owns finite free resolutions, the completion property of unimodular vectors, or their equivalence with freeness of stably free modules.

**Witness:** PadicDifferentialEquationsAndRigidCohomology (open, earlier in the merge order) at its head, `README.md` lines 169–175: "This roadmap owns the algebra …"; §RD.0.55 states `HasFiniteFreeResolution`, two out of three, `HasFiniteFreeResolution.isStablyFree`, `hasFiniteFreeResolution_polynomial`; §RD.0.56 states `HasUnimodularExtension`, `hasUnimodularExtension_iff` (its `Suggested.lean` lines 127, 207, 221).

**Repair:** Cite, do not restate. Delete 2.1–2.3 and the definitions and theorem of 1.1–1.2; add under `## Exact supplier contracts` "**From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.** §RD.0.55 (finite free resolutions, (a), (b), (d)) and §RD.0.56 (b) (unimodular extension property and stably free modules)"; point the `*Needs:*` lines of 2.4, 5.1 and 5.4 at them; rewrite the Scope sentence and the Downstream paragraph to say so. In `Suggested.lean` delete `IsCompletable`, `IsHermiteRing`, `isHermiteRing_iff`, `HasFiniteFreeResolution` and its five theorems, and state 5.4 unfolded (`Module.IsUnimodular` implies the existence of `g : GL` with first column `v`). Keep 5.1 and say in one clause how it differs from §RD.0.56 (a): any commutative ring and a unit head ideal, instead of a domain and a monic entry.

## R04 (P2) — 4.3's route treats the module `N` of the hypothesis as finitely generated projective

**Location:** `README.md` lines 460–462: "the module over `A_m[X]` becomes free over `A_m⟨X⟩` (finitely generated projective modules over the local ring `A_m` are free)".

**Claim:** The hypothesis `IsExtendedFrom A A⟨X⟩ (A⟨X⟩ ⊗[A[X]] P)` gives a free module over `A_m⟨X⟩`.

**Witness:** `IsExtendedFrom` (`Suggested.lean` line 136) gives `A⟨X⟩ ⊗[A] N` for an arbitrary `A`-module `N`. That `N` is finitely generated projective needs descent along `A → A⟨X⟩`; no target states that this map is faithfully flat, and no such descent lemma was found under `Mathlib/RingTheory/Flat/FaithfullyFlat/` at the pin.

**Repair:** Add to 4.1, as API: "`A → A⟨X⟩` is faithfully flat: `A[X]` is free over `A`, monic polynomials are nonzerodivisors, and for a maximal ideal `m` of `A` the ideal `m[X]` contains no monic polynomial, so `m · A⟨X⟩ ≠ A⟨X⟩`." Add to 3.1, as API: "if `R` is faithfully flat over `A` and `R ⊗[A] N` is finitely generated projective over `R`, then `N` is finitely generated projective over `A`." Insert in 4.3's route, before the localisation: "`N` is finitely generated projective by 3.1 and 4.1", and add both to its `*Needs:*`.

## R05 (P3) — 5.1 uses patching that its `*Needs:*` and the layer's Dependencies omit

**Location:** `README.md` lines 510–513: "then patching of left equivalence over comaximal localisations (Lombardi–Quitté, local-global principle XVI.3.6 (2), p. 909). *Needs:* 1.1; Mathlib …"; line 588: "5.1 uses Layer 1 only".

**Claim:** 5.1 depends on Layer 1 only.

**Witness:** Layer 3 states patching for modules only (3.2–3.4); the patching of `GL`-equivalence of vectors is cited to LombardiQuitte2015 line 43060 and is no target.

**Repair:** Derive it from 3.3 and say so: "the local equivalences make `A[X]ⁿ ⧸ A[X] f` extended at every maximal ideal, hence by 3.3 isomorphic to `A[X] ⊗[A] (Aⁿ ⧸ A f(0))`; both are quotients of `A[X]ⁿ` by a free rank-one direct summand, so the isomorphism lifts to some `g : GL (Fin n) A[X]` with `g f = f(0)`." Change the `*Needs:*` to "1.1, 3.3; Mathlib …" and line 588 to "5.1 uses Layer 1 and 3.3" (Layer 5 Dependencies already lists Layer 3).

## R06 (P3) — The second locator of 3.2 is for a different ideal

**Location:** `README.md` lines 348–349: "Lombardi–Quitté, proof of the local-global principle XVI.3.6, p. 909, for its matrix form".

**Claim:** That proof contains the ideal of the `a` with `IsExtendedAfter A (Localization.Away a) M`.

**Witness:** LombardiQuitte2015 lines 43063–43064: the ideal there consists of the `s` for which `G(X + sY)` and `G(X)` are equivalent over `A[X, Y]`; no localisation `A_s` occurs.

**Repair:** "(Quillen 1976, proof of Theorem 1, p. 168; a different ideal with the same role, the `s` with `G(X + sY)` equivalent to `G(X)` over `A[X, Y]`, is in Lombardi–Quitté, proof of XVI.3.6, p. 909)".

## R07 (P3) — Wrong Murthy paper in Research context and References

**Location:** `README.md` lines 614–615: "(Quillen 1976, p. 170, citing Horrocks 1964 and Murthy 1965)"; lines 659–660: "M. P. Murthy, « Projective modules over a class of polynomial rings », *Math. Z.* 88 (1965)".

**Claim:** Quillen cites that paper for `dim A ≤ 2`.

**Witness:** Quillen1976 lines 188 and 216: the reference is Murthy, "Projective A[x]-modules", J. London Math. Soc. 41 (1966), 453–456.

**Repair:** Write "citing Horrocks 1964 and Murthy 1966" and replace the reference by "M. P. Murthy, « Projective A[x]-modules », *J. London Math. Soc.* 41 (1966), 453–456."

## R08 (P3) — The pull request description says no roadmap owns the material

**Location:** Pull request description, **Ownership**: "None of them owns this material. PadicDifferentialEquationsAndRigidCohomology §RD.3.27 states a rigid-analytic Quillen–Suslin theorem …; that is a different ring and stays there."

**Claim:** As R03.

**Witness:** As R03: §RD.0.55 and §RD.0.56 of PadicDifferentialEquationsAndRigidCohomology at its open head.

**Repair:** After R03: "Finite free resolutions (two out of three, stable freeness, passage to `B[X]`) and the equivalence of the unimodular completion property with freeness of stably free modules are consumed from PadicDifferentialEquationsAndRigidCohomology §RD.0.55 and §RD.0.56; this roadmap states neither." List the declarations removed from `Suggested.lean` and the new supplier.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Convention 1; 1.1 `IsCompletable`, `IsHermiteRing` | `(2,3)` over `ℤ`; `n = 0`, `a = −1`; zero ring | `det !![2,1;3,2] = 4 − 3 = 1`, first column `(2,3)`; `(−1) ∈ GL₁(ℤ)`, `∉ SL₁`; zero ring: every vector completable | holds | R03 (owner) |
| 1.2 `isHermiteRing_iff` | zero ring; local ring; source | both sides true; both true; LombardiQuitte2015 line 13142 (V.4.6, `m = 0`) is the same iff | holds | R03 |
| 1.3 `exists_specialLinearGroup_row_pow` | `r = 1`; some `m i = 0`; `r = 0` | `det !![b₀,b₁;−c₁,c₀] = b₀c₀ + b₁c₁ = 1`; entry `1` is `SL`-completable for `r ≥ 1`, so positivity is not needed for truth; `SL₁ = {1}` excludes `r = 0` | holds | none |
| 2.1 `HasFiniteFreeResolution.isStablyFree` | `ℤ/2` over `ℤ/4`; `3ℤ/6` over `ℤ/6` | `ℓ(ℤ/2) = 1`, resolution forces even length; ranks `1` at `(2)`, `0` at `(3)` | holds | R03 |
| 2.2 two out of three | kernel case over any ring; `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` over `ℤ/4` | Schanuel plus cokernel case gives the kernel case without Noetherian hypothesis; one of three resolved, no conclusion | holds | R03 |
| 2.3 `hasFiniteFreeResolution_polynomial` | Koszul for `ℤ[X] ⧸ (2, X)`; `B = ℤ/4` | `2(−Xc) + X(2c) = 0`; hypothesis fails for `ℤ/2`, nothing claimed | holds | R03 |
| 2.4 `isStablyFree_mvPolynomial` | `n = 0`; `ℤ/6` in place of `k` | `k`-modules free; `ℤ/2` projective, rank not constant | holds | none |
| 3.1 `isExtendedFrom_iff_evalZero` | `A[X] ⧸ (X − 1)`; universe of `N`; `A`-action on `A ⊗[A[X]] M` | `M(0) = 0`, `M ≅ A`, both sides false for `A ≠ 0`; `N = M ⧸ XM` lies in `Type v`; the instance is `TensorProduct.leftModule` by `rfl` | holds | none |
| 3.1 Check at `(3)` | `ℤ_(3)[X] ⧸ (2, X)` | `2` a unit: quotient `0`, predicate holds; README says `𝔽₂`, fails | false | R01 |
| 3.2 `exists_ideal_isExtendedAfter_away` | `a = 0`; `a = 1`; `ℤ[X] ⧸ (2, X)` | zero ring, in `I`; `1 ∈ I` iff `M` extended; `I = 2ℤ`; Quillen1976 lines 86–95 | holds | R06 |
| 3.3 `isExtendedFrom_of_forall_isMaximal` | zero ring; local `A` | no maximal ideal and `M = 0`; hypothesis is the conclusion; Quillen1976 lines 84–85 | holds | none |
| 3.4 several variables | `n = 0`; `n = 1` | `N = M`; is 3.3; Quillen1976 lines 153–154 | holds | none |
| 4.1 `monicSubmonoid`, Lemma 2 | `ℤ`; a field; `k[Y]` | `2p = s` monic impossible, `X` a unit; nonzero `f = c ·` monic; `Y` not a unit; Quillen1976 line 140 | holds | R04 (API) |
| 4.2 `free_of_free_monicLocalization` | route inputs; sphere ring | local Horrocks and `ℙ¹` bundles: no owner; `R[X] ⊗ K` not free, value `K` at `0`; statement is Quillen1976 lines 127–128 | statement holds, route unowned | R02 |
| 4.3 affine Horrocks | `N` arbitrary in the hypothesis | route needs `N_m` free; requires descent along `A → A⟨X⟩`; statement is LombardiQuitte2015 line 43263 | statement holds, route incomplete | R04 |
| 4.4 Bass | a retraction `A⟨X⟩ → A` | `X ↦ c` a unit, then `X − c ↦ 0` a unit: none for `A ≠ 0`; LombardiQuitte2015 line 43275 | holds | none |
| 5.1 `exists_mulVec_eq_eval_zero` | `n = 0`; `n = 1`; `f = (X², 1 + X)`; `d i > natDegree` | `span ∅ = ⊤` forces the zero ring; `g = C(f₀(0)) f₀⁻¹`; matrix sends `f` to `(X² + (1 − X)(1 + X), 0) = (1, 0)`, `det = 1`; extra `d i` contribute `0`, so hypothesis is comaximal leading coefficients | holds | R05 |
| 5.2 `free_mvPolynomial` | `n = 0`; `ℤ[√−5]` | free over a principal ideal domain; `𝔞[X]` extended, not free; Quillen1976 lines 145–146 | holds | none |
| 5.3 `isExtendedFrom_mvPolynomial` | `B` a field (allowed by `IsDedekindDomain`); `k[t², t³]` | extended equals free, 5.2; not normal, `Pic` grows; Quillen1976 lines 177–178 | holds | none |
| 5.4 `isHermiteRing_mvPolynomial` | 5.2 with 1.2 | one term from the two headlines (probe elaborates), not from the library | holds | R03 (restate unfolded) |
| Layer 5 Example `(1 + XY, X², Y²)` | unimodularity | `(1 − XY)(1 + XY) + Y² · X² = 1` | holds | none |

- Source locators checked against the text: 32 (LombardiQuitte2015: 17, pages as printed; Quillen1976: 10; Kedlaya2004: 5, giving Lang's XXI.2.1, 2.7, 2.8, 3.4, 3.6); 31 agree, one is R06; R07 is a reference.
- Library declarations opened at the pin: `Module.IsStablyFree` (`Mathlib/Algebra/Module/StablyFree/Basic.lean:34`, complement in `Type u`, finite free), `Module.IsUnimodular` (`Mathlib/LinearAlgebra/Unimodular.lean:46`), `Polynomial.algebra` (`Mathlib/RingTheory/PolynomialAlgebra.lean:207`), `MvPolynomial.algebraMvPolynomial` (`Mathlib/Algebra/MvPolynomial/Eval.lean:868`), `Module.free_of_flat_of_isLocalRing` (`Mathlib/RingTheory/LocalRing/Module.lean:299`), `Module.free_of_finite_type_torsion_free'` (`Mathlib/LinearAlgebra/FreeModule/PID.lean:361`). No Hermite ring, monic localisation, extended module or finite free resolution at the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: AlgebraicKTheory 0.3, 0.5, 1.1, 2.1, 4.1 (`HasStableRangeLE`), 4.2, Layer 6 on main; GeneralAlgebraicKTheory 9.16, 10.12a and PadicDifferentialEquationsAndRigidCohomology §RD.3.27 at their open heads.
- Gate: every check passed, build included. Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`.
- One-tactic probe on a scratch copy: 21 of 21 theorems stay open under `infer_instance`, `rfl`, `simp`; no padding. The 28 elaborated signatures were compared with the README statements: no binder lost, generality equal.
- Overlap check: read HomologicalStabilityOfGeneralLinearGroups, PadicDifferentialEquationsAndRigidCohomology, AlgebraicKTheory; finite free resolutions and the unimodular completion property are shared with PadicDifferentialEquationsAndRigidCohomology §RD.0.55–RD.0.56, owner PadicDifferentialEquationsAndRigidCohomology (R03); nothing shared with the other two.
- Source independence: 12 passages compared with 3 sources, none shared (longest common run 7 words, in the route of 5.2); largest share LombardiQuitte2015, 18 of 46 locators; contents compared with LombardiQuitte2015 Chapter XVI: independent (Layers 1–2 lie outside it, Layer 3 joins XVI.1 and XVI.3 with Quillen's ideal, and the order of Layers 3–5 is forced by the `*Needs:*` of 4.2, 4.3 and 5.2).

## Not verifiable

- Lang, *Algebra*, XXI.2–XXI.3: paywalled; the theorem numbers were confirmed only through Kedlaya2004 lines 545–578.
- Suslin 1977, Theorems 1 and 2 (p. 479 of the translation): the DOI is paywalled and the open Russian host timed out twice.
- Horrocks 1964, Theorem 1: paywalled; confirmed only as quoted at Quillen1976 lines 121–122.
- Swan 1962 and Swan–Towber 1975: the first is on a host the sources service does not classify, the second is paywalled.
- Research context beyond Quillen's comments (Bass 1973 §4.1, Lindel, Popescu, Lequain–Simis, Fasel–Rao–Swan, Asok–Hoyois–Wendt, Česnavičius §§2.1–2.2, Swan 1978 §2, Schäppi): not checked against the texts.
- Ownership against the maintainers' board packages: not checked; only main and the open pull requests were searched.

## Source issues

- none

## For the human reviewers

- **Ownership.** PadicDifferentialEquationsAndRigidCohomology (open, earlier in the merge order) owns §RD.0.55–RD.0.56, the same objects as 1.1–1.2 and 2.1–2.3 here. R03 follows the merge order; moving ownership to this roadmap instead needs a change to that pull request.
- **Licence.** `README.md` line 627 cites an unpublished preprint (Schäppi 2023, arXiv:2311.04104) for a claimed counterexample to the Hermite ring conjecture, in Research context only.
- **Licence.** Quillen 1976 was read from the GDZ scan, whose terms page restricts redistribution of the scan; only locators are used.
