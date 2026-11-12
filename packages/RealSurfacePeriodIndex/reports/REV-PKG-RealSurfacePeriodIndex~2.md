# Review of RealSurfacePeriodIndex (package, round 2)

**Verdict:** needs changes

Sixteen findings: three P1, nine P2 and four P3. The eight headline signatures elaborate, but that does not validate the false intermediate assertions below. No package source was changed. The three declared supplier gaps remain contracts, not findings.

## R01 (P2) — Ordered-field signatures already exist at the pin

**Location.** packages/RealSurfacePeriodIndex/README.md:231: “this is the argument of Mathlib's real classification, run over R”; also :43 and :225–245.

**Claim.** This roadmap must develop ordered-field inertia, isometry invariance, additivity and multiplicativity of signatures.

**Witness.** TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Signature.lean:52,66,81,120 already defines the signature over ordered fields and proves these laws; Witt/Signature.lean:133 proves real-closed Sylvester classification. Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:121,190,243 supplies inertia invariance and diagonal counts.

**Repair.** Import those objects and laws by exact name in the supplier contracts and scope; delete their reconstruction from §0.4. Keep the genuinely new adapter from an ordering P, independence of real closure, and local constancy on X_F. Replace the blanket absence claim with the precise missing Harrison-space interface. Test: the native signature gives 2 for ⟨1,1⟩, 0 for ⟨1,−1⟩ and −2 for ⟨−1,−1⟩ over every ordered real closed field; the proposed adapter has exactly these values.

## R02 (P2) — The Lean signature predicate admits infinite-dimensional forms

**Location.** packages/RealSurfacePeriodIndex/Suggested.lean:67–71: “2 * Module.finrank R W = Module.finrank K V”; contrast README.md:284, “on a finite-dimensional vector space”.

**Claim.** HasZeroTotalSignature implements that finite-dimensional predicate.

**Witness.** For V = ℕ →₀ ℝ, finrank ℝ V = 0. W = 0 satisfies 2·0 = 0 and q|W = 0 for every q, including the positive sum of squares.

**Repair.** Add an explicit [FiniteDimensional K V] binder to the definition, and say finite-dimensional in its docstring. This exact edit was elaborated on a scratch copy: exit 0, only the existing eight sorry warnings. A separate proved scratch example establishes that the original definition accepts every q whenever finrank K V = 0. The repair excludes the infinite positive-definite witness while retaining the hyperbolic plane and rejecting the positive plane. The eight theorem signatures already supply finite dimension.

## R03 (P1) — A transcendental extension does not preserve “real closure”

**Location.** packages/RealSurfacePeriodIndex/README.md:269: “a real closure of L at Q is one of F at the restricted ordering when composed with F → L”.

**Claim.** The composed embedding makes the same field a real closure of F.

**Witness.** F = ℝ, L = ℝ(t). Every real closure R_L of ordered L contains transcendental t; trdeg_ℝ R_L = 1, whereas a real closure of ℝ has transcendence degree 0.

**Repair.** Factor F → R_L through the relative algebraic closure R_F of F in R_L. R_F is the real closure at the restricted ordering; then use preservation of split versus quaternion classes under the real-closed extension R_F → R_L. Alternatively use the unchanged signs of the diagonal trace form directly. This yields the same inverse-image equality without claiming algebraicity. Add the ℝ(t)/ℝ negative control. §7.7 already uses the correct relative-closure argument.

## R04 (P1) — Springer's proof claims both residue forms must be isotropic

**Location.** packages/RealSurfacePeriodIndex/README.md:382: “cannot cancel unless both reductions have a nontrivial zero”.

**Claim.** A primitive isotropic vector of q forces both residue forms to be isotropic.

**Witness.** Over ℝ((t)), q = ⟨1,−1⟩ ⊥ t⟨1⟩ has primitive zero (1,1,0). The residue forms have isotropy values true and false respectively: 1−1 = 0, while z² = 0 forces z = 0.

**Repair.** Replace “both” by the valuation argument proving that at least one residue form is isotropic. If a unit-part coordinate is a unit, reduce modulo t; otherwise a π-part coordinate is a unit and division by π followed by reduction gives its zero. Keep the stated theorem: q is anisotropic iff both residues are anisotropic. Add the witness as a negative-control Check; the repaired implication gives true ∨ false = true.

## R05 (P1) — The Kummer-to-cycle-class assertion has the wrong degree

**Location.** packages/RealSurfacePeriodIndex/README.md:556: “the Kummer class of a line bundle has Bockstein its cycle class”.

**Claim.** The coefficient Bockstein of its degree-two Kummer class is its integral first Chern class.

**Witness.** On ℙ¹_ℂ, L = O(1), n = 2: κ(L) = 1 in H²(ℙ¹,ℤ/2), βκ(L) = 0 in H³(ℙ¹,ℤ), but c₁(L) = 1 in H²(ℙ¹,ℤ).

**Repair.** State κ(L) = c₁(L) mod n, so βκ(L) = 0, and derive the topological Brauer sequence by quotienting the coefficient sequence by the integral cycle-class image. Keep the distinct degree-one torsion-line-bundle boundary in §1.3. The repaired equation is 1 mod 2 = 1, with Bockstein 0 = 0. B19 line 260 gives the correct quotient sequence, not the asserted degree-changing identity.

## R06 (P2) — Projectivity of the base is missing from the incidence family

**Location.** packages/RealSurfacePeriodIndex/README.md:967: “gives a smooth projective threefold X”; :985 promises a smooth projective family. §3.1 at :935 assumes only a smooth surface.

**Claim.** The construction produces an absolutely projective X and projective family for every such S.

**Witness.** S = 𝔸²_ℝ, L = O, R = D = ∅, r = s = 1 satisfies §3.1. X = ℙ¹ × 𝔸² and T = 𝔸² ⊔ 𝔸² are not proper over ℝ.

**Repair.** Keep the general finite and incidence constructions, distinguishing projectivity over S from projectivity over the ground field. Add “S projective” to the absolute-projectivity and family assertions and carry it into their cohomological consumers. B19 §3.1 starts with a connected smooth projective surface (B19 line 533). Test: the affine example retains a projective morphism X → S but is excluded from the absolute assertion; replacing S by ℙ² gives projective X.

## R07 (P2) — The Green criterion is applied to a class outside the vanishing part

**Location.** packages/RealSurfacePeriodIndex/README.md:1775: “applied to H²_van with λ the class of C”.

**Claim.** The class of the lifted curve C is a class in the sub-variation ker(p_*).

**Witness.** p maps the lifted C isomorphically onto the divisor C ∈ |A^l| on S. Thus p_*cl_T(C) = l·cl_S(A) ≠ 0. For a conic on ℙ² this is 2h.

**Repair.** Apply §6.9 to λ_van = cl_T(C) − ½p*p_*cl_T(C). Its pushforward is zero because p_*p* = 2; its constant summand is of type (1,1), and the infinitesimal derivative is unchanged. Spell out these three facts and add the conic Check: p_*(λ−p*h) = 2h−2h = 0. This makes the argument in B19 lines 1244–1266 a correctly typed application to the sub-variation.

## R08 (P3) — Zero Brauer classes do not fix the chosen lifts

**Location.** packages/RealSurfacePeriodIndex/README.md:1757: “the normalisation is automatic”; :2130: “If α = 0 one can take η = ζ = 0”.

**Claim.** Empty ramification makes an arbitrary integral lift compatible, and a zero Brauer class makes an arbitrary fixed Kummer lift zero.

**Witness.** On ℙ¹ × ℙ¹, κ(O(1,0)) = (1,0) mod 2 ≠ 0 although its Brauer image is zero. Likewise β = c₁(O(1,0)) need not reduce to a prescribed zero lift.

**Repair.** In §6.12 retain the chosen-lift normalization even when R = ∅; only pair transport simplifies to ordinary transport. In §8.3 require α̃ = 0 as well as α = 0 for η = ζ = 0. For α̃ = κ(L), take η = c₁(L), ζ = 0 instead. Test with the degree-two product map on ℙ¹ × ℙ¹: R = ∅ for α = 0, but (1,0) mod 2 remains nonzero before normalization. Add both negative controls.

## R09 (P2) — Tsen–Lang has two owners at the open heads

**Location.** packages/RealSurfacePeriodIndex/README.md:316 and :2613: “whose transcendental C_i statements can import §0.7”.

**Claim.** This package owns the general C_i extension theorem and QuadraticFormInvariantsPartII is a downstream consumer.

**Witness.** PR #1834, TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:1619–1629, still owns IsCi.of_trdeg; :2026 says RealSurfacePeriodIndex consumes its §5.6. Its §§5.1,5.4,5.5 also own the same C_i predicate, systems theorem and algebraic-extension closure.

**Repair.** Record an explicit single-owner transfer, retaining the general C_i/Tsen–Lang interface here because this roadmap precedes that consumer. Coordinate #1834 to import §0.7 and remove the overlapping construction/proof targets, retaining its finite-field and Kronecker-dimension applications. Do not add an upward dependency here. Replace the false “No roadmap ... consumes this roadmap” assertion with the resolved ownership statement. Test both consumers with F = ℂ, t = 1 and t = 2: one imported theorem yields C₁ and C₂, with thresholds 2 and 4, and no reverse supply edge. A move recorded only in an earlier review has not removed the current duplicate owner.

## R10 (P2) — Internal build edges contradict the announced build order

**Location.** packages/RealSurfacePeriodIndex/README.md:350: “evaluation at x ∈ W uses the unramified locus of §1.1”; :1891 includes §7.7; :2062 uses the alternating cover before §8.2.

**Claim.** Layer 0 imports no higher layer, and targets are presented in their dependency order.

**Witness.** §0.9 → §1.1 contradicts :9. §7.5 → §7.7 is forward. §8.1 uses V and m_i from §8.2, whose Needs at :2114 explicitly includes §8.1: two directed edges form a cycle.

**Repair.** Supply the curve evaluation in §0.9 directly from the earlier scheme Brauer/localization contracts, without Layer 1. Place the real-closure-to-real-point argument before §7.5. Split §8.1 into the finite-flat open/avoidance construction and the later consequence Θ₀ ⊂ V; put the latter after the alternating-cover construction. Preserve old IDs through explicit old-to-new aliases if renumbering. Test the resulting graph: 0.9 has no edge to Layer 1; the order is pointwise specialization → 7.5 and finite-flat open → alternating cover → Θ₀ ⊂ V, with no return edge.

## R11 (P2) — Uniform evaluation is an explicitly route-specific restriction

**Location.** packages/RealSurfacePeriodIndex/README.md:24: “the induction only applies them when the evaluation is constant on Ψ”; §§4.4–4.5,4.8,6.13.

**Claim.** The constant-evaluation versions can replace the general input theory because they suffice for this induction.

**Witness.** On two components take a₀ = (0,1), a₁ = 0 and [e]₁ = (e₀,e₁). The corrected boundary formula gives (0,e₁); neither scalar t = 0 nor t = 1 gives that when both e_i are nonzero.

**Repair.** Keep §4.4's general formula [ζ]₁ = a₀[e]₁ for arbitrary locally constant a₀ under a₁ = 0. Retain the mixed-evaluation cases of Propositions 4.4,4.5,6.6 as explicit general targets and supply the corresponding global cycle-class correction, or a rigorously justified corrected general statement if the source's proposition fails. Do not treat the unproved mixed case as solved by choosing a constant t. In the two-component test the required correction restricts to (0,e₁); the uniform cases remain Checks giving 0 and (e₀,e₁). B19 line 858 exposes the source's missing evaluation factor. The mathematical gap warrants additional theory, not the route-specific narrowing prohibited by the brief.

## R12 (P2) — The independent middle layers retain the source's section order

**Location.** packages/RealSurfacePeriodIndex/README.md:1087,1262,1480: Layers 4,5,6.

**Claim.** Their linear ordering is the roadmap's dependency-driven organization.

**Witness.** Layer 4 Dependencies (:1260) uses Layers 0,1,3; Layer 5 Dependencies (:1478) uses Layers 2,3. Neither consumes the other, yet these layers retain B19 §§4,5 before the synthesis of §6.

**Repair.** Organize this independent pair by the construction needed for the final target: the cover's deformation/Noether–Lefschetz family and its Brauer obstruction calculation, followed by their synthesis. For example put the deformation family before the pullback obstruction calculation, with old-to-new ID aliases and updated Needs. Do not invent a dependency to force the source order. The dependency test remains valid after exchanging the independent pair: both receive from earlier layers and both supply the synthesis.

## R13 (P3) — Two u-invariant locators point to the wrong page

**Location.** packages/RealSurfacePeriodIndex/README.md:282: “EKM, §37, p. 165; BEC05, §2, p. 2”; Suggested.lean:66 also cites EKM §37.

**Claim.** Those locations define the Elman–Lam invariant.

**Witness.** EKM lines 8820–8833 define locally hyperbolic forms and u in §36, printed p.161. BEC05 lines 75–79 define the supremum on printed p.3, after the p.2 terminator at line 73.

**Repair.** Cite EKM §36, p.161, and BEC05 §2, p.3, including the Lean definition's locator and the existing manifest entries' locator metadata through the fix worker. Keep the source keys. Test against u(ℝ)=0 and u(ℂ)=1: these are the torsion/locally-hyperbolic definition, not the unrestricted real anisotropic supremum.

## R14 (P3) — The Check cleanup is incomplete, and two definitions lack their shape

**Location.** packages/RealSurfacePeriodIndex/README.md:537–542,611–617,794–799,1318–1323,1503–1507,1638–1642,1967–1971,2559–2563; also §0.5 and §0.7.

**Claim.** Each definition has its API and at least three discriminating Checks, without repeated tests.

**Witness.** :538 and :542 both compute the complement of the axes for (x,y); :611 and :615 both compute the constant Hamilton locus; :2559 and :2563 both give the same three components. §0.5 has only two Checks.

**Repair.** Consolidate the duplicate pairs listed above (also compatible-zero/class-shift in §2.4, graph intersection in §5.2, trivial real line in §6.1, empty sign constraint in §6.7, the same complex point in §7.9). Add an API list and a third independent Check for Z(β), e.g. Z(0)=∅ versus the Hamilton whole-space example. Give the C_i definition in §0.7 its API list; keep its four distinct positive/negative Checks. Count again after consolidation: every definition must retain three distinct tests. This is the surviving pattern from previous F07, not a re-raised settled finding.

## R15 (P3) — A process-dependent ownership sentence remains

**Location.** packages/RealSurfacePeriodIndex/README.md:2513: “not from an unaccepted K3 roadmap”.

**Claim.** The mathematical construction is specified by the acceptance state of other work.

**Witness.** “unaccepted” is a transient workflow status, not a mathematical hypothesis or a supplier locator.

**Repair.** Remove that clause. State the required double-sextic/ADE resolution argument and its mathematical inputs without an approval-status comparison. The equation, singularity computation and K3 conclusion are unchanged by this deletion.

## R16 (P2) — The normic-form proof misses algebraically closed C_i fields for i > 0

**Location.** packages/RealSurfacePeriodIndex/README.md:320: “For i = 0 ...; for d = 1 ... Otherwise compose a normic form”.

**Claim.** All remaining C_i inputs admit normic forms of arbitrarily large degree.

**Witness.** F = ℂ is C₁; set i = 1, d = 2, r = 2, N = 5. The first two branches do not apply, but no degree-e normic form in e variables exists over ℂ for e > 1.

**Repair.** Make the first branch “F algebraically closed, for any i”, using N > r d^i ≥ r and the projective dimension argument; then handle d = 1; use normic forms only when F is not algebraically closed. For the witness, height ≤ 2 < 5 gives a nonzero common zero, with no normic form. EKM lines 20229–20233 make the same implicit reduction and should be read with this additional branch; the current #1834 §5.4 already states that branch correctly.

## Verified sound

### Previous findings checked first

The earlier review and repair report were read before the new pass. Seven of eight findings are repaired; F07 is partly repaired. None was marked “not actionable in this package”.

| Previous finding | Current repaired passage | Verification and status |
|---|---|---|
| F01 | README :88, “§15.6 ... finite-group Ext-stalk comparison ... MotivesAndAlgebraicCycles §7.6a” | Repaired. AlgebraicTopologyPartII #1694 §15.6 at README :1487 consumes its declared Ext-stalk gap. A free stalk ℤ[C₂] has H^q=0 for q>0. |
| F02 | README :88, “§7.4 (twisted Bockstein)” and “§12.1 ... §12.2” | Repaired. These are the current Bockstein, surface Stiefel–Whitney, and transverse-loop sections. No stale prefixed citations remain. |
| F03 | README :124, “§1.1 ... §1.3 ... §1.4” | Repaired. EnriquesSurfaces #1286 README :123,181,205. The fix correctly rejected the old review's proposed placement of the H³ computation in §1.3; it is §1.4. The old E1 aliases also existed. |
| F04 | README :124, “WeilConjectures WC.7 (the Enriques condition...)” | Repaired. The current WC.7 prose supplies the condition, not the three invented declaration names. |
| F05 | README :70, “§5.1 ... §6.2 ... §7.8 ... exists_resolution” | Repaired. ResolutionOfSingularitiesCharacteristicZero is now on main; its README :791,893,1150 gives these statements. The named field theorem is exists_resolution. |
| F06 | References and manifest now use BF01235331, BF02566440, BF01231498 | Repaired as recorded: keys, work identities and corrected DOI strings agree with the prior verified replacements. Uncertified status is preserved; no inaccessible text was requested again. |
| F07 | §1.2 now has three distinct Checks; §1.7 supplies “MotivesAndAlgebraicCycles §7.6b” | Partly repaired. Named lists and formerly empty Needs were improved, but eight duplicate patterns remain (R14). |
| F08 | README :43–47 and :632 now cite the current pin and the real-component lemma | Repaired. Pinned declarations were reopened. The broader new duplication in signatures is R01, not a reversal of the repaired line-number correction. |

The changed supplier passages and their consumers were reread, and the old missing-name pattern was searched throughout the package. The old aliases/invented identifiers are not being relied on.

### Principles, shape and ownership

The package has ten mathematically titled layers, each ending in Examples and Dependencies. It has no sorry'd data, opaque stand-in, set_option, admitted example or executable algorithm. The one kept Lean definition has a real body. The mathematical statements inspected are paraphrases, with source locators; no copied source passage was identified. The bibliography has 23 distinct keys: ten available texts and thirteen settled uncertified works. metadata.toml contains the expected mathematical topic.

The independent native-signature object sweep found R01. The open-head sweep by objects (orderings, Harrison topology, signatures, u-invariant, Tsen–Lang, real closures, quaternion/Brauer index, Green criterion, double-cover cohomology) used roadmaps grep/show and the supplied board package index. No duplicate fully qualified Lean declaration among the nine package declarations was found. The closest heads were checked: #1834 QuadraticFormInvariantsPartII, #1694 AlgebraicTopologyPartII, #1313 MotivesAndAlgebraicCycles, #1017 HeightsRationalPointsAndObstructions and #873 LefschetzPencilsAndVanishingCycles. R09 records the actual conflicting ownership. The topology, cycle classes, residues and Lefschetz inputs are otherwise imported rather than rebuilt as generic carriers.

The supplied overlap report has no conflicting head of this roadmap, no dropped cited IDs, and no IDs defined only by an unnamed open revision. The board-package index was read before absence claims. Three main roadmaps were read for shape: QuadraticFormInvariants, Completed/RealAlgebraicGeometry and SchemeAndStackFoundations. R10–R12 and R14–R15 record the remaining build, organization, shape and process defects rather than treating source-shaped prose as automatically acceptable.

### Elaborated signatures, padding and headlines

Original Suggested.lean elaboration from the pinned content checkout returned exit 0 with exactly eight “declaration uses sorry” warnings, and no other warning or error. The import header contains Mathlib and only the three used TauCeti modules (CentralSimple.Index, BrauerGroup.Group, BrauerGroup.BaseChange); their object files were present. The module/public syntax is supported by this pin.

All nine declarations were checked with explicit @-signatures in one scratch file. No theorem lost a section binder. The definition's missing finite-dimensional restriction is R02. A corrected copy with that binder also elaborated successfully. No package Lean file was changed.

Every one of the eight sorried theorems was probed on a copy with one-tactic alternatives simp, rfl and infer_instance; all eight failed to close. The library near-match list was inspected against native carriers: no exact library lemma proved any of these eight general statements. Index-one results over an algebraically closed base or finite field do not prove index=period over its two-variable function field. Positive-definite anisotropy and the negated-anisotropy existential equivalence likewise do not prove any of the u-invariant headlines. No padding finding.

| README headline | Lean disposition |
|---|---|
| de Jong, §2.9 | index_eq_orderOf_of_isAlgClosed; arbitrary algebraically closed characteristic-zero base, finitely generated trdeg 2 |
| Real-closed norm bound, §2.10 | index_dvd_two_mul_orderOf_of_isRealClosed; arbitrary real closed base |
| Theorem 0.3, §7.4 | index_eq_orderOf_of_not_isSemireal |
| Theorem 0.4, §7.5 | index_eq_orderOf_of_forall_isRealClosed; equivalent birational form; scheme form named as unavailable |
| Theorem 0.5, §§7.6,8.10 | Named in module docstring; missing scheme Brauer/equivariant real components |
| Theorem 0.6, §9.10 | Named in docstring; missing real Enriques/halves/w₁/scheme Brauer carriers |
| Proposition 0.7, §9.15 | Named in docstring; missing K3/semialgebraic cohomology/scheme Brauer carriers |
| Theorem 0.10, §7.11 | not_anisotropic_of_not_isSemireal |
| Theorem 0.12, §§7.8,7.10 | not_anisotropic_of_hasZeroTotalSignature and exists_anisotropic_hasZeroTotalSignature |
| Theorem 0.13, §7.13 | exists_common_zero_of_not_isSemireal is the full pair-of-quadrics input; del Pezzo carrier absent and explicitly named in docstring |

Each of the nine own Lean names occurs in the README, and the README's own named headline/predicate identifiers resolve to those declarations. Native carrier inspection supports the listed nonstatability reasons; no missing statable headline was identified.

### Pinned library evidence

Paths in this paragraph are relative to the corresponding pinned library checkout. Mathlib pin: 1b1ccf4b088b32fa3f23f2de1127433254a81e1e. Tau Ceti pin: 2fd255d997f47c0b5d834ee416c7015d55444ce5.

Mathlib/Algebra/BrauerGroup/Defs.lean:41,100 gives finite-dimensional central simple algebras and their Brauer quotient. Mathlib/Algebra/Order/Ring/Ordering/Defs.lean:115,287 gives preorderings/orderings. Mathlib/Algebra/Ring/Semireal/Defs.lean:38 and FieldTheory/IsRealClosed/Basic.lean:52,80 specify semireality and real closedness: the latter does not itself choose an order. Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054 defines anisotropy; TensorProduct.lean:128 needs invertible 2; IsometryEquiv.lean:177 and Real.lean:78 give the cited diagonalizations. Signature.lean:65,98,121,190,243 supplies the additional ordered-field inertia results in R01. Dimension/Finrank.lean:62 uses cardinal-to-natural conversion, including the infinite-dimensional value 0.

TauCeti/Algebra/BrauerGroup/Group.lean:139,174 provides mk and the abelian group law; BaseChange.lean:136 the same-universe base-change map; Division.lean:69 the central division representative; Real.lean:102 the real quaternion classification. TauCeti/Algebra/CentralSimple/Index.lean:99,112,196,255 defines index, identifies it in a matrix presentation, bounds it by degree and realizes a splitting field of that degree. Its :242 index-one theorem assumes the actual base field is algebraically closed, not merely that K has transcendence degree two over one. TauCeti/Algebra/CrossedProduct/Comparison.lean:274,317 contains the cited comparison and uniqueness. TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean:76 and BaseChange.lean:389 contain the hyperbolic plane and isotropy base-change input. The signature declarations listed in R01 are at this same pin.

The local cover uses Mathlib/Algebra/QuadraticAlgebra/Defs.lean:44,387: the parameters give z² = a + bz, so QuadraticAlgebra O b 0 means z² = b. The discriminant is 4b. The field/module definitions are native Algebra.trdeg, Algebra.EssFiniteType, TensorProduct and Module.finrank, not free predicates.

### Supplier resolution and gaps

All cross-roadmap references were resolved against main or the provided open-head index, not remembered from the earlier review. The substantive supplier contracts read were:

| Supplier and current location | Consumed interface |
|---|---|
| SchemeAndStackFoundations, main, §§0.1,0.9,0.17,2.2,2.6,2.11,2.16,2.20,2.22,3.4,4.9,4.11,4.13,4.17,5.4,5.10 | Relative Spec, spreading/depth, Leray/coherent cohomology, Kummer/Tsen/Brauer, Picard extension, formal functions, blowups/Bertini/SNC, projective bundles, surface intersections |
| ResolutionOfSingularitiesCharacteristicZero, main, §§5.1,6.2,7.8 | Principalization, SNC compactification, field resolution |
| AlgebraicModuliForArithmeticGeometry #853, README :313,706 | Projective quotient convention and amplePowersAndFixedTwists |
| HeightsRationalPointsAndObstructions #1017, README :1146,1202 | smoothBrauer_residueExact, pullbackMultiplicity, finiteFlatBrauerCorestriction and pullback_comp |
| MotivesAndAlgebraicCycles #1313, README :1401,1412,1441,1477 | §§7.6a,7.6b,7.8,7.10; equivariant cohomology, cycle classes, divisor theorem, real Enriques Picard image; §0.5b supplies Gersten |
| AlgebraicTopologyPartII #1694, Layer 6; §§7.4,9.2–9.3,10.3,10.5,12.1–12.2,14.1–14.3,15.1–15.6,16.1–16.4 | Free descent, Bockstein/localization, w₁ and loops, sign/trace sequences, quotient lifts, circle extension, transport and chase |
| ComplexComparisonPartII #848, README :3257,3584,4853,4896 | C5.2/C5.3 smooth proper Hodge family, C6.2 covers, C6.3 finite Artin comparison |
| EnriquesSurfaces #1286, README :123,181,205; WeilConjectures #1208 WC.7 | Canonical cover/Picard kernel, Chern isomorphism, H³=ℤ/2 and finite Kummer Brauer term; Enriques condition |
| RealAlgebraicGeometry, Completed, Layer 1; QuadraticFormInvariants, main, Layers 0,1,2,4,5 | Ordered real closure; diagonal/Witt/quaternion/Clifford inputs |
| FormalLaurentPuiseux, main, L4 | puiseuxField, ramifiedEmbedding, puiseuxField_isAlgClosed |
| AffineMorseLefschetz A3,A5; ShimuraData §3.1; AlgebraicTopology Stage 6 | Affine vanishing/weak Lefschetz, Variation, manifold cohomology |
| SemisimpleAlgebras Layer 6; StableReduction Layer 4; ModularCurves 4D; PurityOfBranchLocus §2.3 | Division/maximal-subfield theory, surface blowups, miracle flatness, branch purity |

The three gap slugs agree exactly between design/plan.json and the README contracts. Their suppliers are named and earlier. real-artin-comparison asks for the real equivariant comparison absent from the complex comparison statement. picard-cokernel-torsion-free requests a named extraction of the fact used inside the divisor theorem; BW20 line 1361 states it for smooth varieties over real closed fields. at2-stratified-pair-transport requests invariant compatible control data; the current AlgebraicTopologyPartII §16.2, README :1673, still explicitly assumes those data, despite its expanded foundational subsections. None is unowned, redundant as a named interface, or a reason to reject this package.

Mechanical dependency output:

    depcheck: 236 roadmaps, 2145 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. This checks roadmap supply, not the internal target cycles in R10.

### Seeded source sample

Every available sampled passage was opened at the text. The sample is not reported as fifteen clean locators: §0.6 has two wrong locators (R13), and §8.3 has a false Check (R08). Previously unlocated BW20 Remark 1.6(i) and Theorem 1.12 were found at BW20 lines 699–700 and 876–900.

| Sample | Exact text inspected | Result |
|---|---|---|
| 0.4 signature | EKM lines 7222–7272, §33 pp.133–134; B19 §0.5 p.66 | Total signature, ring laws and continuity supported; native duplication R01 |
| 0.6 Elman–Lam u | EKM lines 8820–8833, §36 p.161; BEC05 lines 75–79 p.3; B19 lines 125–139 p.66 | Definition supported; locators and Lean domain need R13/R02 |
| 0.7 Tsen–Lang | EKM lines 20208–20285, §97 pp.385–386 | General finite-transcendence-degree theorem, including algebraic/inseparable extensions; proof branch R16 |
| 0.9 Witt real curves | B19 lines 687–704, Proposition 4.2 proof p.80; EKM line 9272, Corollary 37.8 p.169 | Real-closure vanishing route consistent; BCR primary real-curve topology remains uncertified |
| 2.3 topological obstruction | B19 lines 263–279, Lemma 1.3 pp.69–70 | Kummer boundary killed by weak Lefschetz; n invertible in characteristic zero |
| 2.4 compatible lift | B19 lines 280–290, Lemma 1.4 p.70 | Corrected compatible lift is stronger than an arbitrary Brauer lift and makes the adjustment valid |
| 2.10 norm bound | B19 lines 36–38 p.63, §0.4 p.65 and §7.5 p.104; CT05 §3 | ind divides 2 per over real closed fields by complexification and degree two; no equality claimed generally |
| 5.9 blowups | B19 lines 1052–1095, Proposition 5.5 pp.89–90 | Blowup/general-points construction and all four auxiliary cohomological conditions present |
| 7.1 half-period evaluation | B19 lines 1286–1300, Proposition 6.7 p.95 | n/2 mod 2, including zero for n divisible by four, is the needed correction |
| 7.3 sufficiency | Same passage | Odd case separated; degree-two induction and per/index divisibility support even case |
| 7.5 real-point vanishing | B19 lines 52–53, Theorem 0.4 p.64, and line 1301 onward p.95 | Scheme statement and birational conversion consistent; build-order issue R10 |
| 8.3 trace lift | B19 lines 1422–1440, Lemma 7.2 p.98 | Integral/quotient decomposition with minus sign; zero-class Check needs R08 |
| 8.5 circle cover | B19 lines 1472–1540, equations (7.5)–(7.9), Lemma 7.5 pp.99–101 | Extension, positive Ext vanishing and n mod 4 distinction agree with supplier |
| 9.3 exponent four | B19 lines 1746–1753 p.106 | Complex Brauer group ℤ/2 and restriction/corestriction imply 4α=0 |
| 9.9 one nonempty half | B19 lines 1782–1799 p.107; MVH98 lines 500–540, Proposition 4.2/Theorem 4.4 p.12 | Picard image w₁-perpendicular; odd-total-Euler branch impossible; the revised one-half criterion is consistent |

### Computed adversarial table

The earlier table was used only for untouched rows that actually contained numerical values. All new/changed passages, sampled targets and headlines were independently checked. Rows below include the findings' counterexamples; a passing row tests the specified instance, not all cases of its theorem. Tests excluded by hypotheses are explicitly distinguished from valid inputs.

| Statement | Instances and computed sides | Result / change |
|---|---|---|
| 0.1–0.3 ordering/real closure | ℂ: X=∅; ℝ: X has one point; ℝ(t) admits t>0 and t<0. At a closure, sign(t)=+1 or −1 respectively | Domains and order distinction sound; arbitrary extension route R03 |
| 0.4 signature | ⟨1,1⟩: 2−0=2; H:1−1=0; H⊗⟨−1⟩:0·(−1)=0; ⟨1,−t⟩:0 for t>0,2 for t<0 | Values sound; import native laws R01 |
| 0.5 survival locus | Hamilton over ℝ: Z={P}; zero class: Z=∅; (−1,t): Z=H(−t); R_L/ℝ has trdeg1 versus required0 | Clopen formula sound; R03/R14 |
| 0.6 u / finite predicate | u(ℝ)=0, u(ℂ)=1; on H choose isotropic line:2·1=2; positive plane has maximal isotropic dimension0, so0≠2; infinite V gives2·0=0 | R02/R13 |
| 0.7 C_i / Lang–Nagata | ℂ(t): d=2 threshold2, ⟨1,t⟩ anisotropic but rank3 isotropic. ℂ(x,y): threshold4, rank4 witness anisotropic. d=0 constant1 has no zero. ℂ,C₁,r=2,d=2,N=5 gives5>4 but no normic degree≥2 | Theorem sound; R09/R16 |
| 0.9 Witt | (−1,1+t²) over ℝ(t): positive everywhere, Brauer class0. (−1,t): value1 at negative t,0 at positive t. Nonreal conic: no orderings, Br=0 | Both vanishing directions distinguished; R10 for dependency |
| 0.10 Springer | H⊥t⟨1⟩: q(1,1,0)=0, residue isotropy(true,false). ⟨1,t⟩/ℂ((t)): residue ranks1,1, both anisotropic | R04; iff itself survives |
| 0.11 Amer–Brumer | In characteristic2, q₁=x²,q₂=y² on F₂² have no common nonzero zero; x²+t y² over F₂(t) has none since t is not square. q₁=q₂=0 on dimension1: vector1 gives(0,0) | Both directions and char2 checked |
| 0.12 index conventions | Split matrix algebra:per=ind=1; M₂(ℍ):degree4,index 2,period2; quadratic splitting extension has degree2 divisible by2 | Index versus representative degree distinguished |
| 0.13–0.15 quadratic inputs | Over ℝ with a=b=c=d=−1 the Albert form is ⟨−1,−1,−1,1,1,1⟩: signature0, zero(1,0,0,1,0,0), Clifford index1. u(ℂ)=1≤4, u(ℝ)=0 | Split and real-closed boundary compatible |
| 1.1 unramified locus | (x,y) on 𝔸² has residues y and x nontrivial on axes; U=𝔸²\{xy=0}; twice class0 gives whole𝔸² | Correct, repeated Check R14 |
| 1.2 Kummer/Bockstein | ℙ¹,O(1),n2:κ=1 mod2,βκ=0,c₁=1. Specℝ:Pic0,H²_G(ℤ(1))0,H³_G(ℤ(1))ℤ/2 | Sequences consistent; proof identity R05 |
| 1.3–1.4 real components | Constant Hamilton evaluates1 on every real point; doubling gives0. For a Möbius real line on S¹, w₁ evaluates1 on its fundamental loop | Twist/evaluation convention consistent |
| 1.7 point removal | Removing a point from ℝ² gives H¹=𝔽₂ while H¹(ℝ²)=0; restriction0→𝔽₂ is injective, not surjective | Injection correctly distinguished |
| 2.3 topological obstruction | S=ℙ²_ℂ,α=0,n1:τ=0∈H³; coefficient groupℤ/1=0. A compatible pullback has β(p*α̃)=0 | Source hypotheses retained |
| 2.4 pushforward adjustment | With α̃=β=0 chooseγ=0: p_*β=n·0=0. n1 givesγ=β. Replacingβ by classL changes p_*β by p_*c₁(L), possibly1 modn | Compatibility is essential; no arbitrary-lift inference |
| 2.6 lattice coset | Λ=ℤ,open cone(0,∞),ε=1/2,n2:δ=0,ν=1/2; ε=−1/2:δ=−1,ν=3/2 givesε=2δ+ν | Negative/positive cosets meet cone |
| 2.9 de Jong headline | K=ℂ(x,y), quaternion(x,y): period2,index 2 (iterated valuation witness); split class:1=1 | Nontrivial and boundary cases agree |
| 2.10 real-closed bound headline | K=ℝ(x,y), division biquaternion from README:per2,index4, so4 divides2·2 but4≠2; Hamilton:2 divides4 | Bound not silently strengthened |
| 3.1–3.4 cover | z²=xy singular at(0,0,0); incidence fibre overx=y=0 isℙ¹, not two points; r=s=1 over𝔸² givesT=𝔸²⊔𝔸², X nonproper | Finite versus incidence models correct; R06 |
| 4.4–4.8 boundary | a₁=0,a₀=0 gives[ζ]₁=0; a₀=1 gives[e]₁; on two components a₀=(0,1) gives(0,e₁) | Uniform computations correct; general omission R11 |
| 5.2 graph lift | a₁=1 gives v=±gw; over g=0 both graphs have v=0; elsewhere two distinct values | Duplicate Check R14 |
| 5.9 auxiliary blowups | S = ℙ², R a line, A₀ = O(1): (i) H⁰(O(−2)I_P) = 0; (ii) H⁰(O(−3)I_Q) = 0; (iii) H¹(ℙ¹,O(1)) = 0; (iv) H⁰(K_S) = 0, so the cup map has kernel 0 | All four conditions computed on a rational surface |
| 6.1,6.7 positivity | M=ℝ: u²>0 for u≠0; u=0 gives 0, neither sign. ord_R(h₁r)=−1+1=0; wrong zero gives1+1=2 | Pole repair correct; repeated Checks R14 |
| 6.9–6.13 projection | Degree 2 gives p_*p*h=2h; conic λ gives p_*λ=2h; λ_van=λ−p*h gives0 | R07 |
| 6.12 / 8.3 fixed lifts | α=0, κ(O(1,0))=(1,0)≠0 mod2; η=ζ=0 gives 0 on the right. η=c₁O(1,0),ζ0 gives(1,0) | R08 |
| 7.1 half-period | n=2,4,6: (n/2)·1 inℤ/2 equals1,0,1. At evaluation 0 all give 0 | Required uniform values verified |
| 7.2–7.3 induction | n=6, a degree 2 cover splitting 3α gives period 3: 6 divides 2·3; n=4 gives period 2: 4 divides 2·2. n=3: n/2 is not an integer, handled separately | Sufficiency correctly separates odd case |
| 7.4 nonreal headline | K=ℂ(x,y) as an ℝ-field: trdeg 2, −1=i², quaternion(x,y) hasper=index 2 | Matches nonreal field generality |
| 7.5 vanishing headline | K=ℝ(x,y),(x²+1,y):x²+1 positive at every ordering, so class splits in every real closure; nonzero y-residue givesper=index 2 | Full real-closure hypothesis tested |
| 7.8 upper-bound headline | Overℂ(x,y), q=⟨1,−1,1,1,1⟩ has rank 5, zero(1,1,0,0,0), all-real-closure condition vacuous; positive rank 5 over ℝ(x,y) has signature 5 and is excluded | No vacuous isotropy claim over a real field |
| 7.9–7.10 sharpness headline | Corrected w′ satisfies w′²+1=(w²+1)²/(4w²); at w=i, dy_j=2(1+i)dz_j,det=8i≠0. Four-form signs(+,+,−,−) sum0; iterated residues have rank 1 and are anisotropic | Corrected lower bound retained |
| 7.11 isotropy headline | K=ℂ(x,y),rank5 threshold satisfied; same vector above hasq=0. Rank4 form⟨1,x,y,xy⟩ staysanisotropic and is excluded | Rank threshold sharp |
| 7.13 common-zero headline | K=ℂ(t), q₁=x₁², q₂=x₂² on K⁵: e₃ gives (0,0); dimension 0 has no nonzero vector but fails 5≤finrank | Correct quantifiers on common vector |
| 8.1–8.2 sign cover | S₂ transposition: sign −1, m=1; a 3-cycle: sign +1, m=2. Renumbering by conjugation preserves both signs. Identity covering: m=0, no branch | Mathematical sign convention sound; cycle R10 |
| 8.4 trace sign | n=4, a=(1,0,0,0): ψa=(−3,1,1,1), trace 0;ψ mod4=(1,1,1,1),−ψ mod4=(3,3,3,3) | Minus sign required and present |
| 8.5 circle | n=2: E=(𝔽₂⊕ℤ)/⟨(1,2)⟩≅ℤ/4; n=4: E≅𝔽₂². Positive cohomology of ℤ[C₂] is 0. Constant ℤ/4 extension has δ(1)=0 but no group-homomorphic splitting | Truncation and torsor/group distinction verified |
| 8.10 obstruction headline | n = 2 gives possible indices 2,4; failure of the lift rules out 2, leaving 4. n = 4 gives 4,8 analogously | Dichotomy uses divisibility, not arbitrary bound |
| 9.3 Brauer exponent | res α has order ≤2, so res(2α) = 0; cor res(2α) = 4α = 0 | Four-torsion bound, not a claim that every class has order 4 |
| 9.9 one half / Enriques headline | Klein bottle: w₁≠0 but deg(w₁²)=χ mod 2=0. Two ℝℙ² components: 1+1=0; a single odd-Euler component gives 1 and is excluded | Real Picard orthogonality eliminates the odd-total branch |
| 9.11 Puiseux / 9.15 headline | t>0 andt<r for every real r > 0;K(i) is the algebraically closed complex Puiseux field. Example: period 2, index 4, H¹(real locus) = 0 | Does not contradict the theorem over ℝ; the field condition is essential |
| 9.13 evaluation | Four components, one Ξ: value 0 on Ξ, 1 on the other three; Θ has 3 components | Correct, duplicated at:2559/:2563 |
| Build and source-order claims | Internal edges 8.1→8.2 and 8.2→8.1 give a cycle of length 2; Layer 4→5 edge count 0 and 5→4 edge count 0 | R10/R12 |
| Check/API/style claims | §0.5 has 2 Checks, required ≥3; repeated axes outputs are equal; deleting “unaccepted” changes 0 mathematical hypotheses | R14/R15 |

## Not verifiable

The following thirteen texts remain settled as uncertified in sources.toml. They were not requested again, and no new missing-reference request is needed. Their primary text was not available in the supplied legal cache; citations remain by locator only.

- BCR: Examples 7.1.4 and 15.2.2, Proposition 7.1.7, §§4.1/10.3, Theorem 12.4.11.
- ARA75: Hilfssatz 2.
- SPR55: the complete discrete-valuation quadratic-form theorem (the EKM substitute was read).
- EL73: the Elman–Lam u-invariant results (EKM/BEC05 substitutes were read).
- BRO80: Satz a) and b), the real-divisor/sign inputs.
- DK96: §1.3, real Enriques halves.
- CTP90: Proposition 3.1.2, prescribed evaluation.
- SER06: Proposition 3.2.9, deformation/normal-bundle input.
- SCH94: Corollary 15.3.1, real étale–equivariant comparison.
- GG73: III.3.11, isotopy input.
- BRE97: II.7.1, sheaf-cohomology input.
- DIM85: Lemma 4, equivariant transport citation.
- DIK00: Appendix C, real Enriques classification context.

BW20 Remark 1.6(i) and Theorem 1.12 are no longer in this list: both were located and read this round. Assertions about unavailable texts are not certified merely because B19 cites them. The source gaps identified below remain proof obligations; computed examples and successful Lean elaboration do not establish the general missing mixed-evaluation argument.

## Source issues

- **Error** in B19 at §3.1, printed page 76: the source says the incidence surface is a finite double cover; it should be proper generically degree two, with ℙ¹ fibres over intersections of the two branch divisors; affects a stated result.
- **Gap** in B19 at Lemma 1.4, printed page 70: the source says an integral Brauer lift has the needed reduction; it should choose an integral lift of the specified pulled-back Kummer class first; affects the proof.
- **Gap** in B19 at Proposition 4.4, printed page 84: the source says the boundary component equals the cover component on Ψ; it should include multiplication by the locally constant evaluation component and justify its global correction; affects the proof.
- **Misprint** in B19 at Lemma 7.3, printed page 98, and equation (7.13), page 103: the source says the integral pullback lift uses plus ψ(ζ); it should use minus ψ(ζ), consistent with the trace-sequence map; affects nothing.
- **Misprint** in B19 at proof of Lemma 7.3, printed page 99: the source says source injectivity proves equality of two maps; it should use injectivity of their common target into its restriction-pushforward; affects nothing.
- **Misprint** in B19 at Proposition 6.7, printed page 95: the source says the half-period lift condition for every period n; it should separate odd n and impose that condition only for even n; affects nothing.
- **Gap** in B19 at proof of Theorem 0.12, printed page 95: the source says the ambient field is a union of finite extensions of the chosen coefficient field; it should first include a transcendence basis in that field; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, printed page 96: the source says separate nonproportionality conditions make the two new parameters independent; it should first choose w with w²+1 in the square of the maximal ideal; affects the proof.
- **Misprint** in B19 at equation (5.7), printed page 88: the source says the normal-sequence boundary lands in H⁰ of the normal bundle; it should land in H¹; affects nothing.
- **Misprint** in B19 at §3.1, printed page 77: the source says the fixed nodes have v zero; it should have w zero and v nonzero; affects nothing.
- **Error** in B19 at Lemma 6.4, printed page 92: the source says h₁ has a simple zero along R; it should have a simple pole, cancelling the factor r in the constructed section; affects the proof.
- **Gap** in B19 at Proposition 6.6, printed pages 94–95: the source says replacement by a nearby fibre completes splitting; it should transport the pair and a lift normalized against the fixed Kummer class; affects the proof.
- **Error** in B19 at proof of Theorem 0.6, printed page 107: the source says the one-half odd-total-Euler case yields an obstruction example; it should discard that impossible case because w₁ lies in its own orthogonal complement; affects the proof.
- **Gap** in EKM at proof of Theorem 97.2, printed page 385: the source says after n>0 and d>1 one can invoke nonalgebraically-closed normic forms; it should first handle algebraically closed F for every n, since C_n is monotone; affects the proof.
