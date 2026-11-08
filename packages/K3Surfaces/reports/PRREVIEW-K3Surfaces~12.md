# Review of K3Surfaces (pull request #1285 at 5108929)
**Verdict:** needs changes

This is a full review of head `5108929`. The folder has not changed since the previous review read this same head. Two things changed underneath it:

- **IntegralLattices was revised on main.** The revision merged on 2026-11-08 removed the milestones that §7.3 relies on (R01).
- **The module docstring was misdescribed last round.** The previous review said the `Suggested.lean` docstring names (U) and sub-target (i) as not statable. It does not, and both can be stated at the pins (R02).

The previous R01 is not repaired and is carried here as R03.

## R01 (P1) — §7.3's discriminant surjectivity has no supplier since the IntegralLattices revision on main

**Location:** `TauCetiRoadmap/K3Surfaces/README.md`:
- `:965–966`: "Their restrictions to T form O⁺(T), by the gluing criterion and surjectivity O(S)→O(q_S)".
- `:982`: "IntegralLattices §5J for the discriminant surjectivity".
- `:120`: "IntegralLattices 0G, 1B–1F, 5E–5J, 6A".

**Claim:** §7.3 identifies the group of permitted marking changes with O⁺(T). That identification rests on the surjectivity of O(S)→O(q_S) for S=U(2)⊕E₈(−2), and the README cites IntegralLattices for it.
- On main, IntegralLattices no longer provides this. The revision merged as commit 47fc6a3c (2026-11-08) deleted 5C, 5D, 5E and 5H. Old 5E was Nikulin's Theorem 1.14.2.
- Every surjectivity theorem of Nikulin §§1.13–1.14 and 3.6.3 is now assigned to `IntegralLatticesPartII`. No such roadmap exists on main, in an open pull request or in the merge order. IntegralLattices places it after OrthogonalTamagawaAndLatticeMass, which is at merge-order line 148, later than K3Surfaces at line 134. So it could not supply this roadmap even once written.
- The prerequisite is therefore unowned, and the range "5E–5J" at `:120` names a milestone that no longer exists.

**Witness:** main, `TauCetiRoadmap/IntegralLattices/README.md:1779–1780`: "Every uniqueness, stabilization, splitting and surjectivity theorem of Nikulin's §§1.13–1.14 and 3.6.3 is `IntegralLatticesPartII`'s". `:35`: "IntegralLattices, then OTM, then `IntegralLatticesPartII`". Layer 5 labels on main are 5A, 5B, 5F, 5G, 5I and 5J only.

**Exact repair:**
1. **Move the statement down into §7.3** as a target, since its owner would come later in the order. Let M=U⊕E₈(−1), S=M(2) and T=U⊕S. Prove that O(S)→O(q_S) is surjective, and that O(T)→O(q_T) is too, through O(S) acting on the second summand. Cite Gritsenko–Hulek v2, §2, p.3, where the surjectivity is quoted as Nikulin's Theorem 3.6.3 (`gritsenko-hulek-enriques-moduli` lines 113–114).
   - Route: A_S≅M/2M with q_S(x/2)=x²/4 mod ℤ. This is a nondegenerate 10-dimensional quadratic space over 𝔽₂ of plus type.
   - Every class with q_S=1/2 contains a (−2)-vector of M. Representatives are e−f, e+f+y with y²=−4, and y, e+y, f+y with y a root of E₈(−1).
   - So root reflections induce all orthogonal transvections, and these generate O(q_S).
   - Replace the §7.3 *Needs:* item with this target.
2. **Fix the supplier table at `:120`:** replace "5E–5J" by "5F, 5G, 5I, 5J".
3. **Fix §7.2 (`:924`, `:949`).** 5J on main supplies the genus but not the isometry class. For the "precisely" direction, cite IntegralLattices 6A instead: (r,a,δ)=(10,10,0) makes S(1/2) even unimodular of signature (1,9), hence U⊕E₈(−1).
4. **Fix §6.2 *Needs:* at `:781`.** Primitive embeddings are 5F–5G on main, not 1B–1F.

**Tested on the instance:**
- 𝔽₂-classes with q=1/2 in M/2M: 1·136 classes with q_U=1 plus 3·120 with q_U=0, giving 496=2⁹−2⁴. That is all of them.
- Each listed representative has square −2: (e−f)²=−2; (e+f+y)²=2−4; (e+y)²=0−2.
- Control showing surjectivity is not automatic: for ⟨12⟩, O={±1} while O(q)={1,5,7,11}.

## R02 (P2) — (U) and the rank-22 theorem are statable at the pins but neither stated nor named in `Suggested.lean`

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:24–28`: "K0.A owns the vector-field unirationality reduction … every positive characteristic, 2 included, and the Picard-number theorem ρ(X)=22 … both binders are wider than that of its vanishing theorem, and the Part II roadmap consumes both". `Suggested.lean:8–30` mentions neither.

**Claim:** Both are deep theorems this roadmap owns and exports with their own binders:
- (U) is Rudakov–Šafarevič, Theorem 5 and Corollary 1.
- (i) is Shioda's theorem, Huybrechts Proposition 17.2.7.

Both elaborate at the pinned Mathlib and Tau Ceti on native carriers. Mathlib has rational maps `X ⤏ Y` with `RationalMap.IsOver` and `RationalMap.IsDominant`, and affine space `𝔸(n; S)`. Tau Ceti has the Picard group `TauCeti.AlgebraicGeometry.LineBundleClass`. For a K3, Pic=NS=Num (Huybrechts Proposition 1.2.4, p.12), so its ℤ-rank is ρ. The docstring names neither theorem as not statable. The previous review's statement that it did was wrong.

**Witness:** the scratch file below, importing only Mathlib and four Tau Ceti modules (the three used plus `TauCeti.AlgebraicGeometry.LineBundle.Class`), elaborates with exactly two `declaration uses sorry` warnings at Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`. The definitions at the pin: `Mathlib/AlgebraicGeometry/Birational/Dominant.lean:73`, `Birational/RationalMap.lean:392`, `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`.

**Exact repair:** Add the two theorems to `Suggested.lean` under Layer 0, with docstrings and the import `TauCeti.AlgebraicGeometry.LineBundle.Class`. Name them in backticks in §0.2 and in "How to read the build". In the README, say that ρ is the ℤ-rank of Pic for a K3 (Huybrechts Proposition 1.2.4, p.12). The tested form:

```lean
theorem unirational_of_nontrivial_vectorField
    (k : Type u) [Field k] [IsAlgClosed k] (p : ℕ) [Fact p.Prime] [CharP k p]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] (hX : IsAlgebraicK3 k X)
    (hD : Nontrivial (X.relativeDifferentials k ⟶ SheafOfModules.unit X.ringCatSheaf)) :
    ∃ f : 𝔸(ULift.{u} (Fin 2); Spec (.of k)) ⤏ X, f.IsOver (Spec (.of k)) ∧ f.IsDominant := by
  sorry

theorem finrank_lineBundleClass_eq_twentyTwo_of_unirational
    (k : Type u) [Field k] [IsAlgClosed k]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] (hX : IsAlgebraicK3 k X)
    (f : 𝔸(ULift.{u} (Fin 2); Spec (.of k)) ⤏ X) [f.IsOver (Spec (.of k))] [f.IsDominant] :
    Module.finrank ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) = 22 := by
  sorry
```

Both keep the README's binders: every prime p for (U), and no characteristic hypothesis for (i). Neither name is declared by K3SurfacesAndSymplecticBoundedness, which has its own namespace.

## R03 (P3) — The characteristic-2 reduction is still owned twice at the two open heads, and the description still records no order

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:1026–1030`: "its §2.1a consumes §0.2's vanishing theorem and its unirationality reduction (U) at p=2 … without restating the reduction". The same division of work appears at `:281–283`.

**Claim:** This README's side is the one the merge order supports: K3Surfaces is at line 134, K3SurfacesAndSymplecticBoundedness at line 313. But K3SurfacesAndSymplecticBoundedness is still at head c1d6da0 and still owns and re-proves the p=2 case. So "without restating the reduction" is false of that head, and the description at 5108929 still says nothing about the order.

**Witness:** K3SurfacesAndSymplecticBoundedness at c1d6da0:
- `README.md:9`: "Section 2.1a owns only the infinite-height kernel statement and the characteristic-2 case of the reduction".
- `:406`: "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1".

**Exact repair:** Nothing in the folder. The description's merge-order paragraph should say that K3SurfacesAndSymplecticBoundedness consumes §0.2 (U) at p=2 and is rebased after this pull request. On that rebase it drops its own p=2 proof (`:9`, `:406`, `:414`) and cites "K3Surfaces §0.2 (U)" instead.

This is carried as previous R01 at the same severity: the duplicated object is already settled in this folder's favour, and only the other head and the unrecorded order remain. The author's earlier reply did not mark it "not actionable in this package".

## R04 (P3) — §4.1's locator range stops before the remark it cites

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:599–601`: "Ω_Λ has dimension 20 and is connected; Ω_h has dimension 19 and two components (Huybrechts draft §6.1.1–§6.1.5, pp.99–101)."

**Claim:** Chapter 6, §1 of the draft has subsections 1.1–1.3 only. Item 1.5 is Proposition 6.1.5, the Grassmannian diffeomorphism. The two cited facts (connected for n₊>2, two components for n₊=2) are Remark 6.1.6, which lies outside the stated range.

**Witness:** `huybrechts-k3` line 3705 is Proposition 1.5 (the diffeomorphisms). Lines 3718–3720 are Remark 1.6, stating connectedness for n₊>2 and two components for n₊=2. Both are on p.101.

**Exact repair:** Use "(Huybrechts draft §§6.1.1–6.1.2, Proposition 6.1.5 and Remark 6.1.6, pp.99–101)". Checked against lines 3649–3720.

## Previous findings

- **Previous R01 — not repaired.** K3SurfacesAndSymplecticBoundedness is still at c1d6da0, and its `:406` still reads "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1". The description is unchanged. Carried as R03.
- **Previous R02** was repaired at this head, as the previous review recorded. The passage at `:285` names `AlgebraicGeometry.exists_isFinite_morphismRestrict_of_finite_preimage_singleton`. Rechecked in the `#check` run: `[IsProper f] (y : ↥Y) ((⇑f ⁻¹' {y}).Finite) → ∃ V, y ∈ V ∧ IsFinite (f ∣_ V)`.

## Verified sound

This is an independent AI review of `TauCetiRoadmap/K3Surfaces/` at `5108929c768d03bc5bcacb0694712607e349646d`. It is a full review; the folder diff against the previous head is empty.

**Folder, gate and dependency check**
- `git diff --stat origin/main...HEAD` outside the folder prints nothing. The folder holds `README.md` (1084 lines), `Suggested.lean` (90 lines) and `metadata.toml`.
- Gate rerun with `--base origin/main`: every scanner prints 0, and it ends "OK" with exit 0.
- Dependency check:

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line. Suppliers that are in the merge order sit above line 134:
  - JacobianChallenge 1, IndexTheory 10, SmoothBundlesConnections 12, TangentialBordism 14;
  - AlgebraicModuliForArithmeticGeometry 34, ComplexComparisonPartII 39, EtaleCohomologyFoundations 42;
  - NeronModelsAndSemistableAbelianVarieties 65, NeronModelsAndSemistableAbelianVarietiesPartII 66, FourManifolds 133.
- PCurvature is a new roadmap folder in another author's open pull request (#1747), which the description lists.
- No forbidden supplier is cited, and no process words or pull-request numbers appear.

**Elaboration and signatures**
- `lake env lean` on `Suggested.lean` exits 0 with exactly two `declaration uses sorry` warnings (`:51`, `:74`).
- A scratch copy with `#check @` of all four declarations shows every binder kept, matching the README:
  - `IsAlgebraicK3`: `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`;
  - the vanishing theorem: `[CharP k p]`, `2 < p`, `IsAlgebraicK3 k X`;
  - `discriminantGraph`: S, T, γ;
  - `gluing_isometry_extension_iff`: both `IsNondegenerate`, both `IsEven`, the anti-isometry, `form` and `carrier` equations.
- **One-tactic probe:** each `sorry` was replaced by `first | simp | rfl | infer_instance | (constructor <;> infer_instance) | sorry`. Both theorems still use `sorry`, so there is no padding.

**Headlines**
- Stated: the vanishing theorem and the gluing criterion.
- Named as not statable: Kählerness, Hodge diamond, projectivity, the Picard segment, Ricci-flat existence and uniqueness, simple connectivity, the cup lattice, deformation theorems, local and global Torelli, twistor lines, surjectivity of the period map, monodromy, cone and polarized images, free involutions, fixed loci and the free and nodal period loci. In each case the analytic carriers are missing at the pins.
- Statable but absent: (U) and (i) (R02).
- The finite-order fixed-locus formula of §7.2 and H²(T_X)=0 are supporting results, not headlines.

**Library declarations opened at the pins (16)**
- Mathlib:
  - `ZariskisMainTheorem.lean:405` (02UP lemma);
  - `Birational/Dominant.lean:73` (`RationalMap.IsDominant`);
  - `Birational/RationalMap.lean:392` (`RationalMap.IsOver`);
  - `AffineSpace.lean:49`, `:65` (`𝔸(n; S)` and its `CanonicallyOver` instance);
  - `Birational/Birational.lean:231` (`IsRationalOver`).
- Tau Ceti:
  - `AlgebraicGeometry/Cohomology/Basic.lean:61` (`Scheme.Modules.Cohomology`, sheaf cohomology on the small Zariski site);
  - `LinearAlgebra/IntegralLattice/Basic.lean:63` (full lattice: `isLattice`, symmetric form, `le_dual`) and `:143` (`IsNondegenerate`);
  - `Even.lean:67`;
  - `Isometry/Basic.lean:74` (`map_carrier` onto, so bijectivity is built in);
  - `Overlattice/Naturality.lean:190`;
  - `Overlattice/Isotropic.lean:379`;
  - `AlgebraicGeometry/Modules/Differentials/Basic.lean:72` (compatible families of R-derivations) and `:101`;
  - `LineBundle/Class.lean:50`;
  - `CartierDivisor/ClassGroup.lean:123`.
- Duplication by object: no K3 predicate, discriminant graph or isometry-extension criterion exists at either pin.

**Sources: the seeded sample of 13 targets (§§0.1–7.3)**

Every locator was opened in the cached text. Printed pages equal PDF pages for the Huybrechts draft (p.7 at line 157) and for Huybrechts v1 (1040–xx headers).

| Target | Locators opened (source line) and result |
| --- | --- |
| 0.1 | Def 1.1, Rem 1.2 p.7 (135, 147); Ex 1.1.3(iv) pp.8–9 (226–235: π_*O=O⊕O(−3), six lines give 15 rational double points); Rem 1.2.5 p.12 (349); §1.2.4 p.13 (373–375: c₂=24). All match. |
| 0.2 | Martin Thm D p.3 (126–133), Cor 1.1 p.4 (140), proof p.40 (1713–1718), Ex 5.12 pp.36–37 (1544–1586; c₂−3=3^{2k}); RS76 Lemma 1 and Corollary pp.1206–1207 (75–90), Thm 5 p.1216 (440), Cors 1–2 p.1217 (481–491); Huybrechts Prop 9.4.6 pp.180–181 (6797–6845), Prop 17.2.7 pp.367–368 (14076–14090), Prop 11.1.3 p.208 (7879), Rem 8.2.13 p.151 (5646–5656), Prop 2.3.10 p.32 (1103); Liedtke Thm 4.2 and §4.3 p.20 (718, 726), Thms 4.4 and 4.6 p.21 (755, 770), Thm 6.1 p.25 (934); Gounelas–Liedtke Prop 2.2(2) p.6 (253–258, all p>0); Stacks 02UP (6305). All match. |
| 1.1 | Stacks 09NU (217); Huybrechts Prop 1.3.2 p.14 (420); Ex 1.3.3 pp.14–15 (432); §1.3.2 p.15 (452–464, eq. (3.1), b₁=0); §1.3.3 p.16 (498, eq. (3.2); footnote 9 at 515). All match. |
| 2.1 | Thm 7.3.6 pp.131–132 (4903–4910); Thm 9.4.11 p.183 (6904); Prop 1.3.5 and Rem 1.3.6 p.17 (525–547). All match. |
| 3.1 | Cor 6.2.7 p.107 (3955); §6.2.4 p.108 (3980–3999: hypersurface S_ℓ, line-bundle extension). All match. |
| 4.1 | pp.99–101 (3649–3720); Prop 6.2.8 p.107 (3960); §6.2.5 pp.108–109 (4001–4028); Rem 7.3.8 and Prop 7.3.9 p.133 (4954–4987). Range off by one item (R04). |
| 5.1 | Prop 7.3.7 p.132 (4940). Matches. |
| 5.2 | Huybrechts v1 Prop 3.10 p.10 (375), Lem 3.11 p.11 (417); draft Prop 7.3.4 and Lem 7.3.5 p.131 (4884–4889); generic twistor line W⊥∩Λ=0 (4826). All match. |
| 6.1 | §7.2 pp.128–129 (4742–4811); Prop 7.2.2 (4780); Cor 7.5.1 p.135 (5049); Thm 7.5.3 pp.135–136 (5066–5069); Prop 7.5.5 (5139); v1 Prop 4.7 p.14 (527–548). All match. |
| 6.2 | Thm 8.5.2 p.163 (6152); §8.2 pp.146–151 (Cor 8.2.9 at 5618); Rem 6.3.7 p.114 (4232); §6.4 p.115 (4258). All match. |
| 7.1 | §14.0.3(vii) p.284 (10894–10900); GH §2 pp.3–4 (83–133). All match. |
| 7.2 | Shen §2.1, Assumption 2.1, Def 2.2, (2.7)–(2.8) pp.256–257 (442–468); AST Thm 3.1 p.10 (497–503); Huybrechts §15.4.3(ii) p.330 (12702). All match. |
| 7.3 | GH §2 pp.3–5, Thm 2.1, Rem 2.2 (113–114, 157–188); §3 p.8, eq. (8), Namikawa Prop 6.2 (259–287); Dolgachev §5 pp.15–17 (607–676). All match. |

**Cross-roadmap citations resolved**
- **On main at b3d628f:**
  - IntegralLattices 0G and 1B–1F are native-row labels (`:438`, `:441–443`, glossed at `:455`); 5F, 5G, 5I and 5J are at `:1899–1974`; 6A is at `:2019`. 5E and 5H are gone (R01).
  - The overlap leads saying "only #1797 defines §0G/§1B/§1E/§5J/§6A" are false positives: all five resolve on main.
  - ModularCurves §2B (`:1243`, norm functor with base-change, tensor and tower laws, after its own revision merged on 2026-11-08) resolves.
  - HopfRinow Layer 1 (`Completed/HopfRinow/README.md:264`) resolves.
  - The other main suppliers have no commits since 2026-11-05: SchemeAndStackFoundations, EtaleCohomologyFoundations, JacobianChallenge, StableReduction, AlgebraicCurves, ComplexKahlerGeometry, CharacteristicClasses, SmoothBundlesConnections, DifferentialGeometry, AlgebraicTopology, MorseNovikov, GeometricTopology and GlobalQuadraticForms. The earlier reviews' resolutions of them stand.
- **At open heads:**
  - PCurvature §§0.1–0.3 (13eb63f; Jacobson Λ_p, `RestrictedLieAlgebra`, `pPow_smul`, `ad_pPow`, `pPow_add`, localization);
  - NeronModelsAndSemistableAbelianVarieties §5.3e (4c22d44; Ogg in every residue characteristic, including 2 and 3);
  - NeronModelsAndSemistableAbelianVarietiesPartII §6.1 (9027cc3; Castelnuovo–Zariski proved inside);
  - ComplexComparisonPartII C5.4 (9cd29e4);
  - AlgebraicModuliForArithmeticGeometry §§1.1–1.3, 7.3, 7.8, 8.1–8.3 (4f0ad34);
  - IndexTheory I6, I7.1–I7.3, I8 (6a51fc7);
  - FourManifolds F7 (46ee76a; §7.2 builds an elliptic quartic K3 and the E(2) comparison; the Fermat quartic itself is TangentialBordism B1.7's, at merge-order line 14);
  - EnriquesSurfaces (959683b) consumes K0–K7 and states that K3Surfaces makes no Enriques comparison;
  - K3SurfacesAndSymplecticBoundedness (c1d6da0): R03.

**Ownership against open pull requests.** `roadmaps grep` for global Torelli, twistor lines, Rudakov, unirational K3, fixed-point-free involutions, Kuranishi, Calabi–Yau/Monge–Ampère, Buchdahl/Lamari and clean fixed loci finds no second owner except K3SurfacesAndSymplecticBoundedness (R03). ShimuraVarieties owns Kähler–Einstein metrics for ample canonical bundle, a different theorem.

**Adversarial table**

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `IsAlgebraicK3` | Fermat quartic in char 3; abelian surface; empty scheme; double plane over six lines | ∂ᵢ=4xᵢ³=xᵢ³ (4=1 in char 3), so smooth, with ω=O(4−4)=O and h¹(O)=0: passes. Abelian surface: h¹(O)=2, fails the last conjunct. Empty scheme: `IsIntegral` needs `Nonempty`, fails. Six lines: C(6,2)=15 nodes, fails smoothness. | Sound |
| §0.1 numerics and contraction | K3 against a torus; ι(dx∧dy); 2σ in char 2 and 3 | χ=1−0+1=2 and c₂=12·2−0=24, against torus χ=0, c₂=0. ι_∂x=dy, ι_∂y=−dx. Char 3: 2·2=1. Char 2: 2σ=0, and 2·2⁻¹ is 0. | Sound |
| `algebraicK3_differential_vanishing` | binder check; p=2; char 0 | CharP k p with 2<p forces an odd prime. p=2 is excluded although the statement is true there (G–L Prop 2.2(2)). Char 0 comes via Hodge, h¹⁰=0. The conjunct order matches the README's "respectively". | Sound; not closable in one tactic |
| Restricted structure on vector fields | ∂_x and x∂_x on 𝔸¹; t²∂_t on ℙ¹; D=t∂_t+c·u∂_u; nilpotent φ: e₁↦e₂↦0 | (x∂)^p(xⁿ)=nᵖxⁿ=nxⁿ. Hochschild correction (x∂)^{p−1}(x)·∂=x∂. (t²∂)^p(tⁿ)=n(n+1)⋯(n+p−1)t^{n+p}≡0. (c^pD−cD^[p])/(c^p−c)=t∂_t. φ has kernel e₂ (additive type), and the étale algebra has dimension pⁿ with Jacobian −N. | Sound |
| (U), case (b) | one A₁ point; cycle of m (−2)-curves; tree of n curves; abelian surface; p=2 | e(Ỹ)=24−1+2=25, above Noether's 24. (ΣEᵢ)²=−2m+2m=0. Tree: e=2n−(n−1)=n+1. Abelian surface: c₂=0, so no contradiction (control). p=2: exponent p−1=1, sections lie in O(−nΔ). | Sound |
| (U) and (i) as headlines | elaboration at the pins; Fermat quartic in char 3; char 0 | Scratch probe: 2 `sorry` warnings, exit 0. Fermat quartic: ρ=22 (p.367). b₂=24−1−1=22. In char 0, (i) is vacuous: σ would pull back nonzero, but p_g(Bl ℙ²)=0. | Statable, absent: R02 |
| Steps (ii)–(iii) | rank 22, signature (1,21); reflection degree | Indefinite of rank ≥5, so isotropic. (s_C L·H)=(L·H)+(L·C)(C·H)<(L·H) when (L·C)<0. | Sound |
| Step 3 (Theorem D) | k=1, 2 | c₂ takes the values 0; 12; 3^{2k}+3 (12, 84); 3^{2k−1}+9 (12, 36). Reaching 24 needs 3^{2k}=21 or 3^{2k−1}=15, impossible. | Sound |
| §1.1 exact segment | logarithms ¼, ¼, ½ against ¼, ¼, −½; ℙ¹; E=ℂ/(ℤ+iℤ) | ¼−½+¼=0 and ¼+½+¼=1, with units i, i, −1. O(1)⊗O(−1) has c₁=0. On E the class ½ has c₁=0. | Sound |
| §1.1 positive cone | diag(1,−1), κ=(1,0); L⊗L | (−κ,κ)=−1; (1,1)²=0. 2d becomes 8d. | Sound |
| §2.1 | normalization c; σ=ω_J+iω_K; Λ; signature | V↦2V gives c=½, and adding t shifts the normalization by t∫ω²≠0. σ²=2−2=0 and (σ,σ̄)=4; iσ↦(−ω_K, ω_J) has det 1. det Λ=(−1)³=−1, rank 22. Signature (0−48)/3=−16=3−19. | Sound |
| §3.1 | ε²=0; quartic polarization; 2h | Tangent dimension 20; with a polarization 20−1=19; (2h)²=8 for h²=2. | Sound |
| §4.1 domain | B=±I₂, z=(1,i); c=3+4i; conjugation; ranks 0 and 1 | B=I₂ gives 0 and 2; B=−I₂ gives −2. \|c\|²=25, giving 50. Conjugation has det −1. Ranks 0 and 1 give empty sets. | Sound; locator: R04 |
| §5.1 | κ²=2 | κ and 2κ have squares 2 and 8; −κ pairs to −2 with κ. | Sound |
| §5.2 | conic; (I+J)/√2; a line meeting the conic | z=a+ib gives z²=0 and B(z,z̄)=2. ((I+J)/√2)²=(−2+0)/2=−1. A line meets the conic in at most 2 points. | Sound |
| §6.1 | φ against −φ; −κ; two disks glued away from 0; direction of Torelli | Orientations differ by (−1)³=−1. (κ,−κ)=−κ²<0. Two points become one. f:H²(Y)→H²(X) is g* for g:X→Y, matching the source's ψ=f*. | Sound |
| §6.2 | s_δ with (x,δ)=1, x²=2; Riemann–Roch at δ | s(x)²=2+2−2=2, whereas the minus-sign formula gives −2. χ(O(δ))=2−1=1. | Sound |
| §7.1 model | ranks, discriminants, sample pairings | S has rank 10 and signature (1,9); T has rank 12 and signature (2,10). \|A\|=2¹⁰ each; 2²⁰/2²⁰=1. (e,e)·(f,−f)=0 and (e,e)·(f,f)=2. Huybrechts and GH involutions give the same invariant lattice. | Sound |
| `gluing_isometry_extension_iff` | ⟨2⟩⊕⟨−2⟩ with g=−id; ⟨4⟩⊕⟨−4⟩; ⟨2⟩⊕⟨2⟩; rank 0 | First case: ḡ=1 mod 2, and F((e+f)/2)=(e+f)/2−e lies in L, so both sides hold. Second: 3≠1, and (−e+f)/4 has class (3,1), outside the graph, so both sides fail. Third: q=½, so there is no even L. Rank 0: both sides trivially true. | Sound; not closable in one tactic |
| §7.2 fixed-locus formula | id on S²; reflection; antipodal map; double plane | L(id)=2=χ(S²). Reflection: 1−1=0=χ(S¹). Antipodal: 0 with no fixed points. Double plane: 2+(1−21)=−18=2−20. Normal factors 2, 4 and 3. | Sound |
| §7.2 AST loci | (1,1,1), (10,10,0), (10,8,0) | (1,1,1): g=10, k=0, χ=−18=2+2−22. (10,10,0): empty, where the genus formula would give 1. (10,8,0): χ=0. Uniqueness for (10,10,0) follows from 6A after halving the form. | Sound; cite 6A (R01 item 3) |
| §7.3 marking group | M(2) mod 2; control ⟨12⟩ | 136+360=496 classes, each containing a root. Control: O={±1}⊊O(q)={1,5,7,11}. Main's 5J excludes the surjectivity. | Unowned: R01 |
| §7.3 period loci | e−f, e′−f′, e−2f; C−jC | Squares and divisibilities: −2/1, −4/2, −4/1. (C−jC)²=−4. These match GH's l_odd=u₁−2v₁ and l_ev=u₂−v₂. | Sound |
| Downstream consumers paragraph | K3SurfacesAndSymplecticBoundedness head | `:406` re-proves (U) at p=2. | R03 |

## Not verifiable

- **Rudakov–Shafarevich 1983, p.1502** (the pencil with at least two singular fibres, used in sub-target (iv)): paywalled. It is recorded as uncertified, and Martin's proof on p.40 quotes it.
- **Nikulin 1983, Theorem 4.2.2:** recorded as uncertified. The statement is certified through Artebani–Sarti–Taki, Theorem 3.1.
- **Gap registration:** the board package has no `design/plan.json`, so I could not check that `gap:integral-topology` and `gap:enriques-ruledness` are registered where the intake reads them.

## Source issues

- **Error** in rudakov-shafarevich-inseparable at §1, proof of Lemma 1, p.1206: the source says the p-th power map on the abelian p-subalgebra can be diagonalized; it should say only that a nonzero eigenvector exists (a kernel vector, or a fixed vector when bijective), since e₁↦e₂↦0 is not diagonalizable; affects the proof.
- **Gap** in huybrechts-k3 at Proposition 9.4.6, proof, p.181: the source infers that ω_Y is trivial on the smooth locus from the triviality of its pullback; it should conclude only that its p-th tensor power is trivial, via the norm along the degree-p map, which suffices; affects the proof.
- **Misprint** in gritsenko-hulek-enriques-moduli at §2, p.5: the source credits reference [Nam], Theorem 7.2, to "Nakamura"; it should say Namikawa, the author of [Nam]; affects nothing.
