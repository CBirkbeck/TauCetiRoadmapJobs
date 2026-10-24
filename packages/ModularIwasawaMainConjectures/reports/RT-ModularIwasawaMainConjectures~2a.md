<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/165#issuecomment-6379455655 -->
Red team round 2 pass a (codex) of e1ec38a

Verdict: needs_changes

1. **F01** (P1) The Schneider construction still lacks global flat duality

   **Location:** packages/ModularIwasawaMainConjectures/README.md:1299, 1313: “from the cyclotomic universal-norm obstruction and flat duality”; “ArithmeticGaloisDuality D7.6”.

   **Claim:** The supplied arithmetic duality suffices to construct Schneider's pairing and compare the flat Néron-model complex.

   **Witness:** TauCetiRoadmap/ArithmeticGaloisDuality/README.md:5911,5967 supplies big-étale Ext over a field and local duality over a finite extension of ℚ_ℓ. Schneider explicitly needs global flat duality over integers (src18 lines 506–508).

   D7.6 is not duality for the p-primary Néron-model sheaves on the fppf site of the ring of integers. SchemeAndStackFoundations §§2.1–2.2, 2.11 constructs sites/cohomology/Kummer; SelmerIwasawaCohomology §3.15 compares étale and Galois cohomology after inverting p. Neither bridges this distinction. Object searches across the indexed roadmaps found no global-flat-duality target. This is a remaining prerequisite of the new repair of r1a-F17, not an objection to its general A/k scope.

   **Exact repair text:** Add under the ArithmeticGaloisDuality supplier contract: “What ArithmeticGaloisDuality must provide (gap:schneider-global-flat-duality): for an abelian variety A over a number field k and odd p, supply the global flat duality pairings for the p-primary torsion of the full and connected Néron models over the rings of integers, with the compact-support terms, component-group errors and restriction/corestriction compatibility used in Schneider §1 and §2, Lemma 2.” Add that same slug and supplier to the plan's gaps and to §3.8's Needs; retain D7.6 only for its actual field/local inputs.

   **Repair test:** At a place above p, the base still has a characteristic-p special fibre and A[pⁿ] need not be étale. The added fppf contract applies there; local étale duality over the generic field alone does not.

2. **F02** (P2) Tate existence and residual inertia have earlier owners

   **Location:** packages/ModularIwasawaMainConjectures/README.md:7,697–705: “Tate's uniformisation theorem, the existence of the Tate parameter”; “ResidualHyp.ramified_iff_not_pth_power”.

   **Claim:** No other roadmap plans these constructions, and this roadmap constructs them.

   **Witness:** TauCetiRoadmap/PadicHodgeTheory/README.md:1520–1524 includes unique positive-valuation Tate parameter existence. TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3865–3876 states multiplicative residual unramified iff p divides v_K(j(E)), including nonsplit reduction.

   These are current indexed new-roadmap heads, both earlier in the merge order. The first includes every finite K/ℚ_ℓ and split multiplicative curves; the second is exactly the inertia criterion claimed here, since v_K(j(E))=−v_K(Δ_min).

   **Exact repair text:** Replace the two ownership claims and their construction paragraphs with: “Import the unique positive-valuation Tate parameter and multiplicative presentation from PadicHodgeTheory §9.3, potentiallyMultiplicativeTwistReduction. Import ArithmeticGaloisRepresentations §6.3, Multiplicative residual unramified criterion, for p≠ℓ; consequently residual inertia is nontrivial exactly when p does not divide v_ℓ(Δ_min), also in the nonsplit case. These supply the elliptic instances of the residual predicates below.” Add these precise suppliers to §1.1's Needs and remove Tate-parameter existence from this roadmap's owned-theorem list.

   **Repair test:** For 11a1 at ℓ=11, v_11(Δ_min)=5. The imported criterion gives ramification at coefficient prime 7 and no ramification at coefficient prime 5, exactly the intended examples. The split case of the imported presentation supplies q_E without rebuilding it.

3. **F03** (P2) The multiplicative reduction asks for an impossible Σ

   **Location:** packages/ModularIwasawaMainConjectures/README.md:928: “for Σ containing all primes dividing N”.

   **Claim:** This is an admissible enlargement in the theorem of §1.7.

   **Witness:** Line 920 assumes p∥N and p∉Σ. Thus p∣N forces p∈Σ under line 928, contradicting p∉Σ. Line 916 already explains the translation from Skinner's convention.

   **Exact repair text:** Replace “for Σ containing all primes dividing N” with “for Σ containing all primes dividing N/p, with p∉Σ”.

   **Repair test:** For N=6,p=3, the original enlargement requires {2,3}⊆Σ and 3∉Σ, impossible; the repaired enlargement allows Σ={2}. This tests the set-theoretic step independently of the theorem's residual hypotheses.

4. **F04** (P3) A logarithm-zero Check incorrectly makes the ℒ-invariant undefined

   **Location:** packages/ModularIwasawaMainConjectures/README.md:1280: “would make the corrected height and the ℒ-invariant undefined”.

   **Claim:** log_p(q)=0 prevents defining both quantities.

   **Witness:** At q=p, log_p(q)=0 and ord_p(q)=1. Thus ℒ=log_p(q)/ord_p(q)=0/1=0. Only the height correction divides by log_p(q); §5.5's own Check at line 1693 gives ℒ=0.

   **Exact repair text:** Replace the quoted phrase with “would make the corrected height undefined and the ℒ-invariant zero”.

   **Repair test:** At q=p² the values are log_p(q)=0, ord_p(q)=2, ℒ=0; the height correction still has a zero denominator. Neither q is asserted to be the parameter of an elliptic curve with algebraic j.

5. **F05** (P2) The elliptic period adapter excludes a prime its consumers allow

   **Location:** packages/ModularIwasawaMainConjectures/README.md:1045: “Assume p>3”; lines 1080,1087,1097 and 1535 use §3.1 at every odd p.

   **Claim:** The lattice/period theorem of §3.1 supplies the Néron comparison used by the ordinary and signed elliptic constructions at p=3.

   **Witness:** For 11a1,p=3, a₃=−1 gives good ordinary reduction, so §3.2 applies; §3.1's p>3 premise is false. For supersingular p=3 with a₃=0, §4.5 has the same unmatched input.

   **Exact repair text:** Replace line 1045 with: “The rational Tate-module comparison and inverse-image lattice constructor apply at every prime. Only the identification of integral parabolic Γ₀(N)-cohomology with H¹ of the coarse modular curve in the following proof assumes p>3. For p=3 use the saturated modular-symbol period line of ModularSymbolsPadicLFunctions §1.1 and the odd-prime saturated comparison required by gap:manin-period-comparison. Establish that comparison before using the Néron-normalized statements of §§3.2 and 4.5.”

   **Repair test:** The constructor and period contract now cover 11a1 at 3. No argument inverts the order 3 of an elliptic stabilizer in ℤ₃. The existing gap retains the integral comparison as an obligation; narrowing the consumers to p>3 would not repair their promised range.

6. **F06** (P2) The Γ-branch is evaluated at characters that do not factor through Γ

   **Location:** packages/ModularIwasawaMainConjectures/README.md:1080–1082: “L_p(E/Q) ∈ Λ ⊗ Q_p”; “Its value at a primitive χ of conductor p^n > 1”.

   **Claim:** This element of Λ=O[[Γ]] has the displayed interpolation value at every primitive p-power-conductor Dirichlet character.

   **Witness:** At p=3 the nontrivial character modulo 3 satisfies χ(−1)=−1 but is trivial on Γ=1+3ℤ₃. The measure δ₁−δ₋₁ pushes to 0 on Γ, yet its χ-integral is 2.

   The full measure on ℤ_p× carries this information, but its trivial tame component does not. “Restricted to the Γ-branch” at line 1070 does not correct the unrestricted quantifier in the named twist target. Colmez lines 179–200 states the full-measure interpolation before taking the analytic branch.

   **Exact repair text:** Replace mazurSwinnertonDyerL_twist with: “For the full Néron-normalized measure μ_(E,α) on ℤ_p×, every primitive χ of conductor p^n>1 has integral p^n α^(−n)L(E,χ⁻¹,1)/(G(χ⁻¹)Ω_E^(χ(−1))). Define its η-branch on Γ by pushing forward η·μ_(E,α). The element L_p(E/ℚ) used here is the η=1 branch, so its finite-order interpolation assertion quantifies only over χ trivial on Δ.” Keep the plus-period isogeny and form comparisons attached to that η=1 branch.

   **Repair test:** For p=3 and the odd character modulo 3, the value belongs to the η=χ branch; δ₁−δ₋₁ gives 2 there and 0 on the trivial branch. A wild character trivial on Δ still evaluates on the original Γ-element.

7. **F07** (P3) Two signed-definition Checks repeat the same defining reduction

   **Location:** packages/ModularIwasawaMainConjectures/README.md:625,627: “If Im(Col_i) = Λ, SMC^i is the principal-ideal statement”.

   **Claim:** These are two discriminating Checks for SMC.

   **Witness:** Both repeat SMC.of_image_eq_top at line 610; the η notation does not give a different test. A definition omitting the image correction passes both tests when the image is Λ.

   **Exact repair text:** Replace the two bullets with: “On an abstract rank-one module model, Im(Col)=XR and Col(z)=X² give char(Im(Col)/R Col(z))=(X), whereas replacing the image by R gives (X²).” And: “For Im(Col)=ϖR and Col(z)=ϖX, the corrected quotient is R/(X), of characteristic ideal (X); the ambient quotient R/(ϖX) instead has μ=1. After inverting ϖ that difference disappears.”

   Move the consumer-only bullets at lines 1558 and 1756, and the proof-route observation at line 653, out of Checks into the corresponding interface/proof paragraphs; they contain no test instance.

   **Repair test:** The wrong full-image model now fails: at the height-one prime (X), the first lengths are 1 versus 2; at (ϖ), the second lengths are 0 versus 1. These differ integrally even though the second becomes equal rationally.

8. **F08** (P3) The omitted Hida approximation headline is not accounted for in Lean

   **Location:** packages/ModularIwasawaMainConjectures/Suggested.lean:16–26; packages/ModularIwasawaMainConjectures/README.md:7,873–905.

   **Claim:** The module docstring accounts for the roadmap's headline theorems that cannot yet be stated at the pins.

   **Witness:** The scope names the all-odd-prime Hida approximation as an owned deep result. The docstring names ordinary/multiplicative main conjectures, but never the approximation or its missing family carriers.

   **Exact repair text:** Add to the module docstring: “The Hida approximation theorem of README §1.6 lacks the ordinary Hecke-family and Galois-lattice specialization carriers, together with the integral family-period comparison needed for its congruence of canonical p-adic L-function ideals.”

   **Repair test:** The p=3 approximation still requires the specified family and integral period data; the added sentence records that missing signature without introducing an ad hoc predicate or scalar stand-in.

## Round-1 repair verification

All locations below refer to packages/ModularIwasawaMainConjectures/README.md unless another file is named. “Repaired, conditional” accepts an explicitly declared supplier contract; it does not certify an implementation by that supplier. The four settled dispositions are not re-raised.

| Earlier finding | Status | Repaired passage and locator | Recomputed witness / remaining issue |
|---|---|---|---|
| r1a-F01 reciprocal automorphic dependency | Repaired, conditional | 87: “use earlier suppliers' carriers and do not import any definition or result of this roadmap” | gap:automorphic-endpoints occurs in both plan and README. The local dependency check returns 0 problems; no claim that the missing owner is implemented. |
| r1a-F02 source manifest | Repaired | sources.toml: schema “tauceti-roadmap-sources/v1” | 35 unique works: 30 cached readable, 3 uncertified, 2 waived; no duplicate DOI/arXiv work found. |
| r1a-F03 rational zeta quotient | Repaired | 384: “choose nonzero d ... with dz∈H¹” | z=ϖ⁻¹e, H²=0: d=ϖ gives 0−0+1=1; d=ϖ² gives 0−1+2=1. |
| r1a-F04 unrestricted Σ independence | Repaired | 760–768: “If X^Σ is Λ-torsion”; “Assume H⁰(G_ℚ,T*)=0” | The large-set ramification condition is at 768. SU lines 1004–1012 has all three inputs. A nonzero invariant invalidates the route rather than being discarded. |
| r1a-F05 wrong dual | Repaired | 37: “T*=Hom_cont(T,ℚ_p/ℤ_p) ... it has no Tate twist” | For T=ℤ₅(1), the untwisted dual has cyclotomic inverse action, while the Tate dual is trivial; their invariant groups differ. |
| r1a-F06 arbitrary deformation Σ | Repaired | 1433: “Σ a finite set containing p, every prime where ρ̄ ramifies, and the auxiliary Steinberg prime of §2.2” | For 14a1,p=5, residual inertia at 2 is nontrivial (5∤6); Σ=∅ is excluded. |
| r1a-F07 split coordinate factor | Repaired | 1327: “(ℒ_p(E)/log_p κ(γ))·Reg_γ” | Rank r gives analytic order r+1, so division by log^(r+1) sends ℒ·Reg_p to (ℒ/log)·Reg_γ. Rank 0 retains log⁻¹. |
| r1a-F08 Frobenius normalization | Repaired | 1213: “set φ=p⁻¹F” | F roots α,p/α become α/p,α⁻¹; valuations 0,1 become −1,0. |
| r1a-F09 missing b₂ | Repaired | 1213: “E₂(E,ω_E)=b₂−12c” | For 11a1, b₂=−4: E₂+12c=−4, while e₂=E₂−b₂=−12c. |
| r1a-F10 differential weight | Repaired | 1223: “C⁻²” | C=2 gives 1/4; log_E² multiplies by 4, leaving the exponent unchanged. |
| r1a-F11 identity-point formula | Repaired | 1215–1221: “ĥ_p(O)=0”; “For nontorsion P choose a nonzero integer m” | O and torsion give 0. h(4P)/16=h(2P)/4 if h(4P)=4h(2P); no affine denominator at O. |
| r1a-F12 omitted transcendence headline | Repaired | Suggested.lean:64: “tateParameter_transcendental_of_isAlgebraic_j” | Native unit parameter excludes 0; norm<1 excludes 1. All primes, including 2, are quantified. |
| r1a-F13 absent supplier targets | Repaired, conditional | 73: “What KatoEulerSystems must provide”; 83: “What PadicHodgeRegulators must provide” | All 8 declared slugs match plan.json. Full integral SL₂ and rank-one coinvariants remain different hypotheses. The new global-flat input is S01, outside those contracts. |
| r1a-F14 approximant period units | Repaired, conditional | 901: “Rational interpolation alone cannot remove C_λ” | C_m=(ϖ), C₀=O distinguishes (ϖX) from (X); the canonical congruence requires the declared unit contract. |
| r1a-F15 duplicated p=3 control | Repaired | 895: “Use PadicFamilies §0.17, ordinaryCuspidal_control_oddPrime” | Current supplier §0.17 explicitly quantifies over every odd prime; p=3 is included. |
| r1a-F16 exceptional-zero family range | Repaired, conditional | 123: “every odd p including 3 and with reducible residual representations allowed” | GS lines 1615–1616 requires p≥5; the extra range is explicitly a gap, not attributed to that theorem. |
| r1a-F17 general height and Selmer comparison | Partly repaired | 1284: “For an abelian variety A over a number field k”; 1356: “allowing reducible E[p]” | H⁰ and T_pSha are now retained; zero A gives series 1. The cited local duality still does not supply global flat duality: S01. |
| r1a-F18 p-converse proof | Repaired, conditional | 1647: “first treat L(f,k/2)≠0”; “explicit reciprocity” | z specializing to 0 gives an augmentation factor; z specializing nonzero uses L=0 to put it in H¹_f. Neither implication follows merely from z≠0. |
| r1a-F19 invented supplier labels | Repaired for the reported labels | 194: “AutomorphicGaloisRepresentations §5.1”; 234: “SelmerIwasawaCohomology §§2.8–2.8a” | Those current sections exist, as do §§5.2,6.4 and the repaired Selmer sections. S01 concerns an actual section supplying the wrong kind of duality. |
| r1a-F20 wrong coordinate/log owners | Repaired | 61: “§§4.5–4.6”; 121: “DirichletPadicLFunctions §0.6” | γ↦1+X; log(p)=0; log(5) has 2-adic valuation 2. The supplier has the three named logarithm outputs. |
| r1a-F21 forward construction references | Repaired for the reported references | 1041: “elliptic datum constructor ... belongs here”; 1747: “proved here after greenbergStevens_derivative” | Unipotent algebra precedes its use, Σ-change precedes §1.3, and the derivative precedes its BSD consequence. S03 is a separate impossible set enlargement. |
| r1a-F22 period scaling | Repaired | 508: “Scaling ω by a multiplies both periods by a” | a=2 gives period 2P and normalized value L/(2P); simultaneous Betti/de Rham scaling gives 2/2=1. |
| r1a-F23 precision and residue field | Repaired | 912–915: “modulo p^m for every m>0”; “Over F₉ a generator has order eight” | X and 2X have equal ideals but unequal generators mod 3; p=uϖ^e gives p^m=unit·ϖ^(em); g∈F₉× has g² of order 4. |
| r1a-F24 missing negative controls | Repaired under current acceptance-file rule | 450–452 and 722–727 retain the controls in prose | [[1,1],[ϖ,1+ϖ]]−I has determinant −ϖ, giving torsion quotient O/(ϖ); residual unipotence alone does not give a free line. No padding was added to Lean. |
| r1a-F25 API catalogue and padding | Repaired | Suggested.lean:8–26: opening headline/carrier explanation | Only 1 necessary definition and 3 deep theorems remain. No admitted boundary example, scalar μ stand-in or trailing catalogue. |
| r1a-F26 duplicate invariants lemma | Repaired | 687: “apply Mathlib Representation.invariants_eq_top” | Pinned Mathlib/RepresentationTheory/Invariants.lean:85 supplies exactly the trivial-action result; invariants dimension is 2 for F₇². |
| r1a-F27 Paškūnas attribution | Repaired | 105: “Paškūnas's Propositions 2.13 and 2.33” | Paskunas lines 471,1013 contain those propositions; FW lines 1385–1400 cite the replacement inputs. |
| r1a-F28 excessive Mahler–Manin specialization | Repaired | 1231: “For every prime p ... every q∈ℂ_p×” | q=p,p² are algebraic, with norm<1, hence J(q) transcendental; no global elliptic realization is assumed. |
| r1b-F01 finite-field Lean instances | Repaired by deletion | Suggested.lean:35–68 retains only the general definition and three theorems | F₇ boundary declarations are absent; the mathematical README test has I-fixed dimension 1 and D-fixed dimension 0. |
| r1b-F02 ArithmeticGaloisRepresentations R01 | Repaired | 661: “Layers 2, 4 and 6” | Current supplier layers address decomposition/inertia, residual representation theory and Tate modules respectively; R01 is no longer cited. |


## Verified sound

Read 1,992 README lines and all 70 Lean lines; compared all four declarations with the supplied elaborated signatures. Reviewed all 51 numbered target sections and all 15 bold mathematical target groups. The computed ledger below has 250 rows covering declarations, targets, conventions and distinct Check controls. Inspected 246 Check bullets; computations are recorded below, including the failed/non-discriminating bullets in S04 and S07. Revisited all 30 earlier findings: 29 repaired or repaired conditionally on accepted gaps, one partly repaired (r1a-F17/S01).

The three Lean theorem signatures are mathematically consistent with their README targets. The necessary coinvariant definition is real data on native modules. There are no lost section binders, sorry'd data, `set_option`, admitted examples, API padding, or substitute scalar headlines. The unipotent theorem requires genuine square-zero difference and a primitive image; the lifting theorem retains closedness and p≥5; Mahler–Manin retains every prime and an actual native Tate curve. No one-tactic/library-lemma deletion was found among the three retained theorems.

The pinned definition of `ContRepresentation` is `toMonoidHom : G →* V →L[R] V` (Mathlib/RepresentationTheory/Continuous/Basic.lean:54–57): it supplies continuity in the vector variable, not the group variable. The README explicitly adds continuity of the Galois action. `IsDiscreteValuationRing` is a local PID domain whose maximal ideal is nonzero (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56–58); the unipotent theorem therefore does not admit fields or the zero ring. `Representation.invariants_eq_top` (Mathlib/RepresentationTheory/Invariants.lean:85) and `CuspForm.rank_eq_zero_of_weight_lt_twelve` (Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:155) are used by citation. The latter gives dimension zero at weight 4, while weight 12 is outside its strict bound.

The imported Tate specialization exists at TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Specialization.lean:70 and evaluates the integral Tate equation at a unit q with norm below one. It does not select a global curve's Tate parameter. `Matrix.SpecialLinearGroup.map` and `PadicInt.toZMod` exist at Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225 and Mathlib/NumberTheory/Padics/RingHoms.lean:300. The finite two-descent group at TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104 is not an ordinary cyclotomic Selmer carrier.

The read-only diff at the reviewed head changes only this package. The single Mathlib import and the individual existing Tau Ceti import satisfy the import rule. No computational algorithm, pull-request number or process instruction was found in the README or Lean docstrings. The source-use and roadmap rules were read from README.md and CONTRIBUTING.md of the content repository. No source or supplier text was treated as an instruction.

### Headline acceptance inventory

| Headline in README | Statability and acceptance-file disposition |
|---|---|
| Integral rank-one unipotent quotient, §0.8 | Stated at Suggested.lean:42, using only the necessary definition at line 35. |
| Closed SL₂(ℤ_p) lifting, §3.6 | Stated at Suggested.lean:54. No pinned lifting theorem found to make it padding. |
| General p-adic Mahler–Manin, §3.7 | Stated at Suggested.lean:64 using native `tateCurveAt`; not weakened to an elliptic special case. |
| Kato/canonical-period dictionary and period-unit detection, §§0.9–0.10 | Needs modular zeta, period and analytic carriers; accounted for by the Kato/comparison docstring group. |
| Ordinary, multiplicative and elliptic main conjectures, §§1.3,1.7,3.4–3.5 | Missing cyclotomic Selmer and normalized modular p-adic L-functions; docstring names them. |
| All-odd-prime Hida approximation, §1.6 | Missing family/lattice/integral period carriers; omission from docstring is S08. |
| Kato–ordinary and signed formulation equivalences, §§0.10,0.13 | Missing zeta morphisms, complexes and actual Coleman images; docstring names these. |
| FW pointwise, family and specialization conclusions, §§2.2,4.1–4.2 | Missing modular deformation/zeta/fundamental-line carriers; docstring names them. |
| Signed main conjecture and elliptic dictionary, §§4.3–4.5 | Missing integral Coleman and signed local carriers; docstring names them. |
| Tate existence/uniformization, §1.1 | S02 imports the earlier owner; a second signature here is not required. |
| Cyclotomic heights and Schneider abelian/elliptic leading terms, §§3.7–3.9 | Missing global flat complexes, arithmetic height pairings and comparison carriers; docstring names them. S01 concerns their proof input. |
| Rank-zero converse, §5.4 | Missing Bloch–Kato Selmer carrier; docstring names it. |
| Greenberg–Stevens derivative and BSD consequences, §§5.7–5.8 | Missing modular analytic and height/regulator carriers; docstring names them. |

### Supplier, ownership and direction audit

The following 20 citation groups were resolved against main or the supplied/current indexed new-roadmap heads, rather than guessed from their titles. The 29-roadmap dependency graph below is a separate mechanical count. All eight accepted gap slugs agree between the README and design/plan.json, have named earlier suppliers, and retain their detailed hypotheses in the README. Their future implementations are not certified here. The settled r1a-F01, F13, F14 and F16 dispositions are not re-raised.

| Citation group | Located contract and result |
|---|---|
| ArithmeticGaloisRepresentations | Layers 2,4,6 supply local/residual/Tate representations. §6.3 already owns the multiplicative residual inertia criterion: S02. |
| AutomorphicGaloisRepresentations | §§5.1–5.2 supply modular representations and lattice compatibility; §6.4 supplies conductor, Steinberg monodromy and bad factors. |
| EllipticCurveModularity | R29.4–R29.6 supply modularity, parametrization and rational Tate comparison; no integral Manin-unit result is inferred from that comparison. |
| PadicMeasuresIwasawaAlgebras | §§4.5–4.6 provide the generator coordinate; Layers 4–5 provide characteristic ideals and determinants. Rational localization is not L[[X]]. |
| SelmerIwasawaCohomology | §§2.7–2.10,2.19,2.23 and §§3.1–3.2,3.12–3.15,3.18–3.21,4.21 contain the cited ordinary, duality, control and specialization inputs. §3.15 is not global flat duality: S01. |
| SelmerIwasawaCohomologyPartII | Supplied head §§8.1–8.4 concern unitary level raising and diagonal regulators. They do not duplicate the explicit sigma/Schneider comparison. |
| PadicFamilies | §0.17 explicitly includes odd p=3; §1.4 retains period correction ideals; §§1.5,1.6,1.12 and §§4.0–4.2 contain the named family, zeta and representation inputs. Extra period units/general exceptional-zero families remain gaps. |
| ModularSymbolsPadicLFunctions | §1.1 saturated periods, §2.5 ordinary interpolation, §4.3 Euler depletion located. These support the S05 repair; they do not identify every tame branch with Γ. |
| PhiGammaModulesAndIwasawaCohomology | §§6.0,6.2–6.3 supply Wach bases and domains. Actual integral Coleman maps/images are the separate accepted regulator gap. |
| KatoEulerSystems | Three accepted extension, nonvanishing and central-specialization gaps; no absent current declaration counted as implemented. |
| PadicHodgeRegulators | Accepted signed-regulator gap names integral domains and actual images, not just rational maps. |
| AutomorphicCongruences | Accepted endpoint contract requires independent statements on earlier carriers, regular-base family comparison, and distinct rational/integral BCS branches. |
| GrossZagierAndArithmeticHeights | Accepted optimal Manin and saturated-period gap; nonoptimal isogenies retain degree/index corrections. |
| DirichletPadicLFunctions | §0.6 contains `localIwasawaLog`, `existsUnique_isIwasawaLog_of_finiteDimensional`, `localIwasawaLog_exp`; the dyadic domain is 1+4ℤ₂. |
| CrystallineCohomology | CR.2.3 and CR.3.4 supply de Rham/crystalline comparison and Frobenius; the package now divides F by p before taking the unit-root eigenspace. |
| NeronModelsAndSemistableAbelianVarieties and EllipticCurves | Néron models/components and the existing Tate curve/uniformization are imported; arithmetic component order is distinguished from geometric order. |
| ArithmeticGaloisDuality and SchemeAndStackFoundations | D7.6 and §§2.1–2.2,2.11 exist, but do not supply the asserted global Néron-model flat duality: S01. |
| SerreWeightAndLevelOptimisation and AlgebraicModularFormsAndSerreWeights | §§2.9,3.1,3.9 and R15.4 supply level lowering and the weight recipe; the weight-four example also cites the pinned level-one dimension theorem. |
| PadicHodgeTheory | §9.3 already states the unique Tate parameter and multiplicative presentation, including p=2: S02. |
| Downstream references | HeegnerPointEulerSystems HE.8b, RankZeroOneBSD BSD.6a/7a, CMAllPrimeMainConjectures CZ.0–CZ.3 and AutomorphicPadicLFunctions L3/L3h are identified as consumer/background interfaces, not added to this roadmap's Needs. Hida's addendum fails as recorded below. |

Ownership searches used the roadmap service over main and indexed new-roadmap heads, local main/Completed files, board packages, and the 28 explicitly supplied sibling checkouts. The named supplier texts were then read. Searches were by objects: Tate parameter/uniformization, residual inertia, Coleman images, zeta morphisms, integral periods, global flat duality, sigma/Schneider heights, SL₂ lifting and p-adic Mahler–Manin. Apart from S02, no other owner of the retained three Lean headlines or duplicate fully qualified declaration was found. The general p-adic Mahler–Manin statement is distinct from the complex Nesterenko target in DiophantineApproximationAndTranscendence §5.6. The Heegner sibling imports this roadmap; it is not a hidden supplier for these targets.

The supplied read-only direction check returned exit code 0 and exactly:

```text
depcheck: 29 roadmaps, 270 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Citation resolution likewise reported no missing cross-roadmap citation or Lean name. Its final tool warning said external Lean names were not checked by that resolver; the relevant pinned declarations were independently grepped and read as described above. Existence of a section does not certify its supplied statement, which is why S01 remains despite the clean mechanical check.

### Source locator audit

Thirty readable source records were examined at the resolved locator groups below; five settled unread records are listed under Not verifiable. This counts source/locator groups, not each repeated citation as a separate verification. Source hypotheses were compared with the targets. Readability/certified status is not mathematical endorsement: the SW, FW and Hida defects below are independent checks of their text.

| Source / locator group | Resolved text and outcome |
|---|---|
| SU, Proposition 3.2.18; Theorems 3.6.4,3.6.11 | SU lines 1004–1012,1609–1620,1722–1731: torsion/invariants/ramification inputs and ordinary conclusions agree after the repairs. |
| FW, Assumption 2.1; Lemma 3.13; Theorems 5.1–5.2; Corollary 5.3 | FW lines 923–927,1472–1513,4016–4061: residual/deformation restrictions retained; two proof issues recorded below. |
| Skinner, Theorems A,C; Proposition 2.6.1 | Skinner lines 36–47,82–89,697–711: multiplicative range, BSD consequence and approximation located; S03 concerns the package's Σ translation. |
| SkinnerConverse, introduction | SkinnerConverse lines 44–48: rank-zero context is background, not a new unconditional all-prime theorem. |
| BCS, Theorem 1.1.2 and Remark 1.1.3 | BCS lines 59–77: p>3, irreducibility, rational branch and extra integral-image hypothesis distinguished. |
| LLZ, Definition 6.4; Theorem 6.5; Corollaries 6.6,6.8 | LLZ lines 2498–2546: actual Coleman images and component restrictions retained, rather than unconditional principal ideals. |
| RJW, Remark 2.3; Conjecture 13.21; Appendix B | RJW lines 383–389,4026–4029,4410–4420,4471–4477: cited main-conjecture formulations are not confused with arithmetic proofs. |
| Kato, Conjecture 12.10; §17.13 | Kato lines 4165–4168,6301–6346: dyadic exclusion of primes containing 2 and rational ordinary comparison retained. |
| Rubin, III.5.16–5.17 | Rubin lines 2421–2454: local/non-CM restrictions are carried into the structure theorem rather than dropped. |
| Colmez, Theorem 0.8, Definition 0.9, Remark 0.10, Theorem 0.11 | Colmez lines 179–208: full measure, analytic branch, Euler factor and derivative distinguished; S06 repairs their conflation. |
| CGS, Theorem A | CGS lines 81–91: Eisenstein residual condition belongs to the downstream theorem, not a claimed theorem of this package. |
| KY, Definition 1.2.1(iii), Theorem 1.2.2; Theorem 3.0.10 | KY lines 567–605,1752–1760: trivial-character augmentation factor and multiplicative restrictions retained. |
| HidaAdd, Lemma 0.2 | HidaAdd lines 13–35: locator is correct, replacement lemma is false; explicit finite-field witness below. |
| BSTW, Theorem 1.3 | BSTW lines 151–156: a_p=0 at supersingular p=3 is not replaced by arbitrary supersingular reduction. |
| CastellaErr, corrected Theorem 1.1 | CastellaErr lines 17–26: p>3 and the residual/local assumptions are retained in downstream context. |
| LSTX, introduction | LSTX lines 19–24: rank-two lifting for p≥5 and small-prime exceptions located; higher-rank Theorem 1 is not misattributed to rank two. |
| SW, §§4.1–4.2; Theorem 6.1 | SW lines 735–820,1021–1031: height/leading-term formulas located; normalization errors are corrected in the package and listed below. |
| EPW, Theorem 2.1.2; Proposition 4.1.4 | EPW lines 340–346,1404–1425: family-control and quotient-period statements do not alone imply a canonical unit correction. |
| Ribet, Theorem 3.3; (4.7); Theorem 8.1 | Ribet lines 366–375,532–535,1311–1313: the higher-weight ramification proof uses actual level lowering, not one Frobenius polynomial alone. |
| Waldschmidt, coefficient convention; Théorème 2 | Waldschmidt lines 57–60,112–117: ℂ_p and every prime are supported; no p≥5 or global-elliptic restriction. |
| Nakamura, Theorem 1.1, Remark 1.2, Corollary 4.2, Theorem 4.3 | Nakamura lines 140–184,2899–2908,2934–2939: universal and classical zeta specializations distinguished. |
| Paskunas, Propositions 2.13,2.33 | Paskunas lines 471–475,1013–1015; FW lines 1385–1400: repaired attribution and p=3 replacement references agree. |
| Greenberg, Theorem 4.1 | Greenberg lines 1480–1495: finite-Selmer leading term used only with its finiteness hypothesis. |
| Hida, Theorem I; Lemma 3.17 | Hida lines 249–255,2555–2565: condition (V) retained; false auxiliary lemma is described below, not assumed repaired merely by citing the addendum. |
| MST, scaling and equations (1.7)–(1.9) | MST lines 90–100,153–168: sigma/differential weights and b₂ correction support the repaired formulas. |
| LMFDB11, local and Galois data | LMFDB11 lines 504–511,525–536: discriminant valuation 5, split multiplicative 11 and split-Cartan mod-5 image match the examples. |
| LMFDB14, coefficients/local data | LMFDB14 lines 452,488 onward: a₅=0,a₁₃=−4 and multiplicative valuations at 2,7 match the examples. |
| GS, Theorem 7.1 | GS lines 1615–1616: p≥5 is explicit; the all-odd-prime input remains an accepted declared gap. |
| Werner, Theorem 7.2 and Corollary 7.3 | Werner lines 713–740: local multiplicative height correction is retained. |
| src18, §§1–2 and §7 | src18 lines 287–320,506–508,1533–1541: two heights, global flat duality input and negative comparison sign located. Some formula typography remains unreadable; see Not verifiable. |

Even after correcting the addendum’s ambient-submodule misprint, its intended statement fails. The source counterexample is entirely finite: take A=𝔽₅, m=3 and N={(x,y,x+y)}⊂A³. N has 25 elements versus 125 in A³. Each of its projections to coordinates (1,3), (2,3), and (1,2) is bijective onto A² (25 elements), satisfying the hypotheses of Hida Lemma 3.17 and HidaAdd Lemma 0.2. However N∩(A²×0)={(x,−x,0)} has 5 elements. Its projection onto the first two coordinates has 5, not 25, elements, refuting the addendum's recursive condition (2) for m−1=2. The earlier lemma's conclusion N=A³ also fails. This does not refute Hida's μ theorem; it refutes the stated auxiliary arguments cited for it.

## Computed statement ledger

The following are evaluations, not proofs of the general arithmetic theorems. “Contract” marks an accepted declared supplier gap; these computations do not establish that gap. A numerical module model checks an identity's sign or correction factor; it is not asserted to arise from a modular form. O is a coefficient DVR unless explicitly varied, R=O[[X]], v(ϖ)=1, and l=log_p κ(γ). Empty determinants/products are 1. Unrelated test classes (fans, quasi-separatedness, inseparable coefficient extensions) do not occur in these signatures; finite characteristic-zero coefficient extensions are separable. Equal-characteristic DVRs do occur in the unipotent Lean theorem and are tested.

### Every Lean declaration and its actual context

| Statement, section and line | Variable/instance context retained in supplied elaborated signature | Instances and computed values | Result / change |
|---|---|---|---|
| HasRankOneCoinvariants, §§0.8,1.1, Suggested.lean:35 | O:Type u, T:Type v; CommRing O, AddCommGroup T, Module O T; σ:T→ₗ[O]T; no finite/rank/topological assumptions | T=0 over ℤ₃: quotient 0≄O, false. T=O,σ=id: quotient O, true. T=O²,σ=id: quotient O², false. Zero ring: quotient=O=0, true. O=F₃[ε]/ε²,u=I+E₁₂: quotient O, true; u=I+εE₁₂: quotient O/(ε)⊕O, false. | Definition agrees with README; zero ring is harmless here. |
| hasRankOneCoinvariants_of_unipotent, §0.8, Suggested.lean:42 | O:Type u; CommRing, IsDomain, IsDiscreteValuationRing; u on Fin 2→O; square-zero difference; image not contained in m·O² | u=I+E₁₂: N²=0, image=Oe₁, quotient=Oe₂. u=I+ϖE₁₂: quotient O/(ϖ)⊕O, second hypothesis false. u=I: second hypothesis false. Over F₂[[t]] and ramified mixed-characteristic O, I+E₁₂ still gives quotient O. | Sound; no lost hypothesis. Field/zero ring excluded by DVR/domain context. |
| sl2Zp_closedSubgroup_eq_top, §3.6, Suggested.lean:54 | p:ℕ, Fact p.Prime, 5≤p; H subgroup SL₂(ℤ_p); IsClosed H; reduction image=top | p=5,H=top: reduction has 120 elements, equality top=top. H=ker reduction: image has 1≠120 elements. Dense SL₂(ℤ) image has full reduction but is not closed. p=2,3 fail 5≤p. | Sound; closure and small-prime exclusions retained. |
| tateParameter_transcendental_of_isAlgebraic_j, §3.7, Suggested.lean:64 | p:ℕ, Fact p.Prime; q:ℂ_pˣ; norm(q)<1; IsAlgebraic ℚ j(E_q) | q=p,p²: norms p⁻¹,p⁻², algebraic q; theorem gives nonalgebraic J(q). q=0 is not a unit; q=1 has norm 1, so fails. At p=2,q=2 the same conclusion holds. | General Mahler–Manin contraposition; no missing oddness hypothesis or padding. |

The source and supplied elaborated types were compared declaration by declaration. No Lean command was run in this read-only pass. All four signatures have explicit required binders; no section-variable loss was found.

### Conventions and Layer 0

| Statement / locator | Instances and computed values on both sides | Result / change |
|---|---|---|
| Γ-coordinate, README:29 | p=3: κγ=4; p=2: κγ=5∈1+4ℤ₂ while 3∉1+4ℤ₂ | Sound |
| Tame components, 29 | O[C₂]→O² at p=2 sends a+bδ to (a+b,a−b); determinant −2, image pairs congruent mod 2 | Injective, not integral product; 2 kills cokernel |
| Algebraic localization, 29 | Σ p^(−n)X^n∈Q_p[[X]] has unbounded denominators, hence is not in ℤ_p[[X]][1/p] | Distinction sound |
| Geometric/arithmetic determinant, 33 | Weight 2,trivial ε: det V_f=κ⁻¹; determinant twist gives det T=κ | Correct dual direction |
| Ordinary line, 35 | Homological Tate realization: line κ·α⁻¹, quotient α; quotient unramified but line has cyclotomic inertia | Sound |
| Scalar versus contragredient dual, 37 | Scalar 2 in F₇ dualizes to 2 by precomposition; inverse action gives 4; 2·4=1 | Correct involution |
| T* versus Tate dual, 37 | ℤ₅(1) gives (Q₅/ℤ₅)(−1) versus Q₅/ℤ₅; global invariants 0 versus whole group | Repair F05 sound |
| Period exponent, 39 | m=0: (−2πi)Ω=P; m=1: (−2πi)²Ω=(−2πi)P | Sound |
| Determinant signs, 41 | [O→ϖO] in degrees 1,2: +1; H¹=Oe,z=ϖe,H²=0: −1; together 0 | Sound |
| Euler zeta direction, 41 | E=2,z_prim=1,z_Σ=2: E⁻¹z_Σ=1 | Sound |
| Signed basis convention, 43 | b′=b diag(2,1): Col′=(Col₁/2,Col₂); swapping columns interchanges kernels | Correct inverse matrix |
| ModularIwasawaDatum / T, §0.1 | Weight 2: T_f determinant κ⁻¹, T=T_f⊗κ has determinant κ; rank T=2 | Sound |
| residual, §0.1 | O²/ϖO²=F², dimension 2; zero representation module has dimension 0 and is not a datum | Sound |
| residual_ss_independent, §0.1 | A reducible extension and its split semisimplification both have diagonal characters χ₁,χ₂; their inertia off-diagonal entries can be 1 versus 0 | Semisimplification, not ramification, invariant |
| changeLattice, §0.1 | T′=ϖT⊂T: V/T′→V/T has kernel T/ϖT, order q² | Correct map direction |
| extendCoefficients, §0.1 | Rank-two lattice tensored with O′ remains rank 2; ϖ=unit·ϖ′^e | Sound finite faithfully flat change |
| ordinaryLine, §0.1 | Saturated Oe₁⊂O² gives quotient O; nonsaturated ϖOe₁ gives O/(ϖ)⊕O | Saturation discriminates |
| cyclotomicIdentification, §0.1 | γ−1 maps to X; trivial Δ gives one component; C₂ at p=2 has determinant −2 | Correct prime split |
| OrdinarySelmer / mem_iff, §0.2 | Zero class localizes to 0 everywhere; a class with nonzero ordinary quotient at p is rejected | Kernel specification |
| OrdinarySelmer.dual, §0.2 | Trivial Γ action yields X-annihilated dual; scalar 2 gives 2, not 4, on the scalar dual | Correct action |
| OrdinarySelmer.dual_fg, §0.2 | Zero Selmer gives zero dual with 0 generators; no arbitrary noncontinuous Galois action is admitted | Supplier finite generation |
| OrdinarySelmer.relax, §0.2 | Empty difference gives local direct sum 0 and X^Σ→X^Σ identity; one removed factor R/(E) multiplies characteristic ideal by (E) | Hypotheses retained |
| OrdinarySelmer.changeLattice, §0.2 | Kernel killed by ϖ may be ⊕_n F, infinite; localization at ϖ kills it | Does not claim finite kernel over tower |
| OrdinarySelmer.extendCoefficients, §0.2 | R/(ϖ)⊗O′=R′/(ϖ′^e); scalar coefficient extension is not reduction | Sound |
| OrdinarySelmer.etaComponent, §0.2 | Δ=C₃ over F₇ with η(g)=2: scalar dual retains 2; twisting coefficients by η⁻¹ gives 2·4=1 on invariants | Correct inverse twist |
| Structure torsion, §0.3(2) | Torsion R/(X) has rank 0; free R has rank 1 and is excluded from characteristic assertions | Ordinary arithmetic input conditional on supplier |
| Structure no finite submodule, §0.3(3) | Finite module R/(ϖ,X) has itself as finite submodule and is excluded; 11a1,p7 local torsion divides 50, 7∤50 | Local hypothesis not omitted |
| Structure Fitting=characteristic, §0.3(4) | R/(X): both (X). R/(ϖ,X): Fitt=(ϖ,X), char=R | Finite-submodule exclusion necessary |
| ordinaryPadicL definition, §0.4 | Weight 2,ψ=1: e=(1−α⁻¹)²; split multiplicative α=1: e=0 | Correct reduction-dependent interpolation |
| ordinaryPadicL_interpolation, §0.4 | Primitive ψ conductor p^n>1: e=α^(−n); ψ=1 uses n=0, not t=1 | No junk conductor exponent |
| ordinaryPadicL_unique, §0.4 | Difference X has only zero X=0 in open unit disc; nonzero integral power series has finitely many such zeros by preparation | Infinite distinct character evaluations suffice |
| ordinaryPadicL_period_unit, §0.4 | Period→2P at p=3 gives L→L/2 and ideal unchanged; period→3P changes ideal | Unit hypothesis discriminates |
| ordinaryPadicL_depleted, §0.4 | Σ=∅: L^Σ=L; L=X,E=1−X: depleted X−X²≠0; L=0 gives 0 | Both directions use nonzero E in a domain |
| ordinaryPadicL_extendCoefficients, §0.4 | Coefficients 1,ϖ of 1+ϖX become 1,unit·ϖ′^e | Same series under embedding |
| ordinaryPadicL_ne_zero, §0.4 | 11a1,p7 augmentation=(1−α⁻¹)²/5≠0; split case augmentation=0 does not imply series=0 | Nonvanishing gap retained |
| IMC, §0.5 | Model X_alg=R/(X), L=X: ideals (X)=(X), torsion true | Correct predicate |
| IMC_rational, §0.5 | char=(X), L=ϖX: unequal integrally, equal after inverting ϖ | Distinction sound |
| IMC.toRational, §0.5 | (X)=(X) localizes to (X)=(X); preceding ϖX example refutes converse | One direction only |
| IMC.iff_divisibilities, §0.5 | (X²)⊂(X), but (X)⊄(X²); conjunction false, equality false | Correct both directions |
| IMC.greenberg_instance, §0.5 | Weight 2: V_f⊗det⁻¹=V_f∨, determinant κ | Uses actual modular twist |
| iwasawaH1, §0.6 | Norm-compatible classes (c_n) satisfy cor(c_(n+1))=c_n; identity tower gives constant classes | Corestriction, not unrestricted product |
| iwasawaH2, §0.6 | Zero module has rank 0; a free summand R would violate torsion | Kato input |
| fundamentalLine, §0.6 | Two-term rank-one complex gives line O⊗O⁻¹≅O, rank 1 | Correct invertibility |
| fundamentalLine.triv, §0.6 | Nonzero z=ϖe gives fractional image ϖ⁻¹O when H²=0; z=0 cannot trivialize | Rational trivialization |
| fundamentalLine.changeLattice, §0.6 | Scale both compatible integral lattice and good pair by c: c⁻¹c=1 | Arithmetic determinant cancellation required, not arbitrary-complex claim |
| fundamentalLine.baseChange, §0.6 | Complex [O→ϖO] tensored with F becomes [F→0F], with cohomology F in both degrees | Derived errors retained |
| fundamentalLine.divisor, §0.6 | z=ϖ⁻¹e,d=ϖ: 0−0+1=1; d=ϖ²: 0−1+2=1 | Denominator-independent |
| fundamentalLine.sigmaPartial, §0.6 | E=ϖ,z_Σ=ϖe: z_prim=e; factor nonunit before localization | Correct inverse factor |
| KMC, §0.7 | H¹=Re,z=Xe,H²=R/(X): lengths 1=1; with H²=0: 0≠1 | Definition discriminates |
| KMC_rational, §0.7 | char(H²)=(X), char(H¹/Z)=(ϖX): equal rationally, unequal integrally | Correct |
| KMC.iff_triv, §0.7 | Equal lengths 1−1=0 gives unit divisor; unequal 0−1=−1 gives nonunit line image | Requires free rank-one H¹ |
| KMC.iff_reverse_divisibility, §0.7 | Given (X²)⊂(X), reverse inclusion fails unless exponents equal | Correct ideal orientation |
| KMC.changeLattice, §0.7 | Homothety cT changes good pair by (c,c), factor c⁻¹c=1 | Integral conclusion uses residual irreducibility |
| Zeta basis/characteristic comparison, §0.8 | H¹=Re,z=ϖe,H²=R/(ϖ): 1−1=0; replace H²=0: −1 | Correct determinant equality |
| Rank-one image from genuine unipotence, §0.8 | I+E₁₂ has quotient O; [[1,1],[ϖ,1+ϖ]] has det(g−I)=−ϖ and torsion quotient O/(ϖ) | Genuine square-zero condition necessary |
| katoPadicZeta_scale, §0.9 | (a,b)=(ϖ,1): ϖ⁻¹L; (ϖ,ϖ): L; (1,ϖ): ϖL | Correct a⁻¹b |
| katoPadicZeta_canonical, §0.9 | m=0 denominator P=−2πiΩ on both conventions | Sign fixed only through oriented period comparison |
| katoPeriodDefect, §0.9 | f=ω_B gives class 1; f=ϖω_B gives class ϖ | Nonunit distinction |
| katoPadicZeta_homothety, §0.9 | c=ϖ: c⁻¹c=1; changing only ω gives ϖ⁻¹ | Simultaneous scaling essential |
| katoPadicZeta_goodPair, §0.9 | f=ϖω_B: good-pair function=unit·ϖL_f | Correct direction |
| KatoPeriodDefectUnit, §0.9 | u=1 or 2 at p3: true; u=3: false | Well-defined modulo units |
| KMC/ordinary comparison, §0.10 | u=ϖ: KMC implies char X=(ϖL_f), not (L_f); after inverting ϖ both agree | Correct defect retained |
| Period-unit detection, §0.10 | (uL)=(L), L≠0 implies v_P(u)=0 at every coefficient prime; u=ϖ fails | No cancellation of zero L |
| SignedSelmer.localCondition, §0.11 | Col=(x,y)↦x has kernel second line; its perfect-pairing annihilator is first dual line | Actual kernel and Tate pairing determine condition |
| SignedSelmer.dual, §0.11 | Zero signed group gives dual 0; one trivial Γ-divisible summand gives R/(X) | Correct dual carrier |
| SignedSelmer.poitouTate, §0.11 | Exact model 0→R --X→R→R/(X)→0 has ranks 1,1,0 | Torsion permits injectivity; zero first map would leave rank-one cokernel |
| SignedSelmer.changeBasis, §0.11 | B=[[1,1],[0,1]], Col′=(x−y,y), so first kernel changes x=0 to x=y | Arbitrary basis does not preserve signed labels |
| SignedSelmer.etaComponent, §0.11 | At odd p, e_η²=e_η and distinct e's multiply to 0; at p2 denominator 2 unavailable | Odd-prime domain retained |
| SignedSelmer.ordinary_case, §0.11 | α-branch=unit·Col₂(z); factor ϖ is rational unit but not integral unit | Only rational unit asserted |
| SMC, §0.12 | Im=XR,z-image=X²: quotient XR/X²R≅R/(X), char=(X) | Image correction essential |
| SMC_rational, §0.12 | Im=ϖR,z-image=ϖX: quotient R/(X) before and after localization | Correct |
| SMC.of_image_eq_top, §0.12 | Im=R,z-image=X²: char=(X²); with Im=XR gives (X) instead | Hypothesis distinguishes |
| SMC.changeBasis, §0.12 | Changing basis to make chosen coordinate of z zero destroys nonvanishing; retained coordinate X gives rank-zero cokernel | Conditional equivalence only |
| SMC.kobayashi_form, §0.12 | i=1 gives minus; i=2 gives plus; multiplier ϖ preserves kernel but changes ambient ideal | Corrected/principal distinction |
| Signed–cohomological comparison, §0.13 | Exact length relation a−b+c−d=0; a=d implies b=c; a=1,d=2 gives unequal b,c | Equality transport correct |

### Layers 1 and 2

| Statement / locator | Instances and computed values on both sides | Result / change |
|---|---|---|
| ResidualHyp.irred, §1.1 | Diagonal representation has invariant coordinate line; weight-four example has discriminant 5 mod 7, nonsquare, hence no invariant F₇-line | Discriminates reducible/irreducible |
| DistinctCharacters, §1.1 | Characters 1,1: false; 1,ω over F₇: true since ω has order 6 | Correct |
| IsRamifiedAt, §1.1 | Trivial inertia gives ρ(g)−1=0; standard transvection gives nonzero E₁₂ | Correct |
| FWAuxiliaryCondition, §1.1 | I trivial on F₇²: dimensions 2,at most 2, fails first. Independent D-characters and I=ker fst: dimensions 1,0 | Both dimensions matter |
| ResidualHyp.fwExplicit, §1.1 | k=2: invariant line μ, quotient μω⁻¹; μ=−1 gives D-fixed dimension 0 for odd p | Correct normalization |
| LocalExclusion, §1.1 | Pair {1,ω}: false; {1,ω²} over F₇: true; at ω=1 equal-character pairs exactly excluded | Correct unordered character condition |
| ScalarExclusion, §1.1 | 1⊕1: false; 1⊕ω with ω≠1: true | Distinct from LocalExclusion |
| HasRankOneImage, §1.1 | Trivial subgroup on O² only gives quotient O², false; subgroup containing I+E₁₂ gives O, true. For the standard S₃ action over ℤ₅ a transposition gives quotient O; on A₃, nonidentity g has det(g−1)=3 and quotient 0, while identity gives O² | Restriction to the determinant kernel changes the answer |
| Trivial-inertia imported invariants result, §1.1 | F₇² with trivial inertia has invariants F₇², dimension 2 | Pinned lemma used |
| not_fwAuxiliary_bot, §1.1 | dim W^I=2≠1 for trivial I, regardless of D | Correct, retained only in README |
| fwAuxiliary_independentCharacters, §1.1 | D=F₇××F₇×,I=ker fst: W^I=Fe₁; (2,1)e₁=2e₁, so W^D=0 | Dimensions 1,0 |
| not_hasRankOneCoinvariants_id, §1.1 | (id−id)=0, quotient O²; nontrivial commutative ring has IBN, so rank 2≠1 | Nontriviality retained |
| not_hasRankOneCoinvariants_upper_uniformizer, §1.1 | N(e₂)=ϖe₁: quotient O/(ϖ)⊕O, torsion class e₁ nonzero | Correct |
| hasRankOneImage_fullAutomorphismGroup, §1.1 | det(I+E₁₂)=1; quotient Oe₂ | Correct witness |
| FWAuxiliaryCondition.isRamifiedAt, §1.1 | Trivial inertia would force dim invariants 2, contradicting 1 | Correct for dimension two |
| localExclusion_one_iff, §1.1 | ω=1,χ₁=χ₂: both false; χ₁≠χ₂: both true | Both implications |
| fwAux_iff_nonsplit_weight_two, §1.1 | μ=1: invariant line D-fixed, dim=1; μ=−1,p odd: dim=0 | Correct |
| suAux_im, §§1.1–1.2 | Nonzero residual transvection lifts to N with unit entry and N²=0; quotient O | Genuine Steinberg input needed |
| tateParameter_exists, §1.1 | Positive valuation q has v(j)=−v(q); split twist η=1, nonsplit η unramified quadratic | S02: import earlier owner |
| ramified_iff_not_pth_power, §1.1 | q=ℓ^p gives inertia coefficient p=0 mod p; q=ℓ gives coefficient 1 | S02: import earlier owner; name does not change valuation criterion |
| locExc_ordinary_weight_two, §1.1 | 11a1,p7: ā=5,ā²=4≠1, true; F₃×={±1} gives square 1, false | Correct elliptic F₃ restriction |
| Genuine inertia rank-one quotient, §1.2 | Nonzero upper entry in F implies unit in O; image primitive line and quotient O | Sound |
| Euler local polynomial, §1.2 | Split multiplicative ℓ11,γℓ=2: 1−1/22=21/22; wrong inverse gives 9/11 | Correct normalization |
| IMC.iff_of_sigma, §1.2 | Both ideals multiply by E≠0; (X)E=(X)E; if E=0 cancellation fails but arithmetic Euler factors nonzero | Local/global hypotheses retained |
| IMC.iff_extendCoefficients, §1.2 | (ϖ)O′=(ϖ′^e), O′ remains faithful; proper ideal cannot become unit ideal | Sound |
| Skinner–Urban theorem, §1.3 | 11a1,p7:k2≡2 mod6, a7=−2 unit,7∤v11Δ=5; 11a1,p5 fails irreducibility | Contract plus rank-one extension |
| Fouquet–Wan ordinary theorem, §1.4 | 14a1,p13: a13=−4 unit,13∤6 at nonsplit 2, fixed dimensions 1,0; split11a1 fails FW auxiliary condition | Exact ordinary hypotheses |
| Ordinary Selmer/period consequence, §1.5 | u=ϖ changes ideal (L) to (ϖL); u=1 recovers IMC | Correction retained |
| hidaApproximant, §1.6 | k_m=2+(p−1)p^r is >2 and ≡2 mod (p−1)p^r; at p3 gives 2+2·3^r | Source approximation, gap-dependent normalization |
| hidaApproximant_lattice, §1.6 | Rank-two free lattices reduce to (O/p^m)²; matching ordinary lines reduce to rank-one summands | Stronger than matching traces |
| hidaApproximant_periodComparison, §1.6 | C_m=(ϖ),C₀=O gives different valuations 1,0; perfect pairing/saturation must force both 0 | Accepted gap |
| hidaApproximant_padicL, §1.6 | X and 2X at p3 generate equal ideals mod 3 but differ as elements; ϖX and X do not generate equal ideals integrally | Corrected ideal congruence |
| hidaApproximant_residual, §1.6 | m≥1 gives congruence mod ϖ, so an inertia matrix entry 1 remains 1 | Residual ramification preserved |
| Bold “Hida's family through f”, §1.6:895 | p3 satisfies odd-prime control; p2 does not | Uses current §0.17 |
| Bold “Weights close to 2”, §1.6:897 | v_p(k_m−2)=r; increasing r gives arbitrary fixed p^m precision | Quantifier order m then r |
| Bold “Lattices”, §1.6:899 | Distinct residual characters split filtration as O-modules; equal chars lose that criterion | Hypotheses retained |
| Bold “p-adic L-functions”, §1.6:901 | u_λ unit has valuation 0; correction ϖ has valuation 1 and cannot be canceled integrally | Accepted gap |
| Multiplicative main conjecture, §1.7 | p∥N implies p∈primes(N); Σ requires p∉Σ | S03 fixes proof enlargement, theorem range unchanged |
| FW convention adapter, §2.1 | Central twist k/2 sends determinant κ^(1−k) to κ; k=2 gives Tate realization | Correct twist |
| FW pointwise theorem, §2.2 | p3 allowed, but ordinary elliptic local pair has LocExc false; p5,14a1 supersingular has nonsplit auxiliary 2 with 5∤6 | No claim all p3 elliptic points satisfy hypotheses |
| Ordinary consequence, §2.3 | u=ϖ gives char=(ϖL); after inverting ϖ gives (L) | Correct defect branch |
| Signed consequence, §2.3 | a_p=0,k2 passes (A); i1 all η and i2 η=1 retained; missing (E) prevents integral quotient argument | LLZ hypotheses preserved |

### Layers 3 and 4

| Statement / locator | Instances and computed values on both sides | Result / change |
|---|---|---|
| Elliptic Tate-lattice comparison, §3.1(1) | Isogeny with lattice matrix diag(p,1): inverse image of O² is p⁻¹O⊕O; image is pO⊕O | Correct inverse-image choice |
| Optimal periods, §3.1(2) | φ_* surjective gives saturated φ*H¹; cφ=p would make Ω_E/P_f have valuation 1 | Nonunits retained; S05 for p3 scope |
| Manin unit, §3.1(3) | Optimal semistable odd p gives v_p(cφ)=0; nonoptimal p-isogeny may contribute index p | Accepted gap |
| ModularIwasawaDatum.ofEllipticCurve, §3.1 | Rank-two T_pE transported through rational isogeny remains free rank 2; p3 does not invalidate rational map | S05 clarifies all-prime constructor |
| mazurSwinnertonDyerL, §3.2 | α=1 split: augmentation 0; α=−1 nonsplit: factor 2 | Correct on trivial tame branch |
| mazurSwinnertonDyerL_trivial_character, §3.2 | 11a1,p7: (1−α⁻¹)²/5, valuation 0; split11a1,p11: 0 | Sound |
| mazurSwinnertonDyerL_twist, §3.2 | p3,χ(−1)=−1: δ₁−δ₋₁ has Γ-pushforward 0 and χ-integral 2 | S06 separates full measure and branches |
| mazurSwinnertonDyerL_mem_Lambda, §3.2 | Irreducibility excludes a rational p-isogeny; reducible 11a,p5 can have period ratio valuation ±1 | Does not claim integrality from algebraicity alone |
| mazurSwinnertonDyerL_isogeny, §3.2 | Ω_E′=pΩ_E gives L_E′=L_E/p; prime-to-p period ratio has valuation 0 | Correct plus-branch direction |
| mazurSwinnertonDyerL_eq_form, §3.2 | P_f/Ω_E=p gives L_E=pL_f; taking reciprocal would give L_f/p | Correct scalar |
| mazurSwinnertonDyerL_analytic, §3.2 | s=1 maps X to 0; derivative of κγ^(s−1)−1 at 1 is l | Correct variable |
| katoPeriodDefect_elliptic, §3.2 | Good ω_E gives u=P_f/Ω_E; 7ω_E is not good at p7 and gives function divided by 7 | Correct goodness condition; S05 range input |
| Elliptic Kummer Selmer adapter, §3.3 | Split α=1: inertia/strict quotient Q_p/Z_p, dual R/(X); α=−1: φ−1=−2 is a unit at odd p, quotient 0 | Distinct conditions retained |
| MazurMC, §3.3 | Torsion model R/(X), analytic X gives ideal equality; free R excluded | Correct definition |
| MazurMC_rational, §3.3 | Analytic pX and char X agree rationally, disagree integrally | Correct |
| MazurMC.iff_IMC, §3.3 | Period ratio unit 2 at p3 preserves ideal; ratio p changes it | Unit assumption required |
| MazurMC.isogeny, §3.3 | Degree n prime to p gives T_p isomorphism; degree p may have index p | Proper range |
| MazurMC.toRational, §3.3 | Equality localizes; (pX) versus (X) refutes reverse implication | Correct |
| BCS rational theorem, §3.4 | p5>3 allowed; p3 excluded; CM is not an explicit exclusion in Theorem 1.1.2 | Contract agrees BCS lines 59–68 |
| BCS integral theorem, §3.5 | τ=I+E₁₂ gives free quotient O; τ=I+ϖE₁₂ gives torsion extra term | Actual integral image witness required |
| Residual surjectivity→full image, §3.6 | p5: SL₂(F₅) has order 120; determinant cyclotomic is surjective onto ℤ₅× | Serre lifting plus determinant, not SL statement alone |
| Residual surjectivity→rank-one image, §3.6 | Standard unipotent in SL₂(ℤ_p) has det 1 and quotient ℤ_p | Correct kernel witness |
| canonicalSigma, §3.7 | c=a/b, exponent −c log_E²/2 has second derivative −c; Bernardi equation −x becomes −x−c | Correct b₂ subtraction |
| Frobenius coefficient c, §3.7 | φ=F/p roots α/p,α⁻¹; 11a1,b₂=−4 gives E₂=−4−12c | Correct normalization |
| Multiplicative sigma transport, §3.7 | ψ*ω=Cdu/u,C2: E₂ weight 1/4; log² weight 4 | Repaired weight cancels |
| cyclotomicHeight and scaling, §3.7 | h(O)=0,h(torsion)=0; h(2P)=4h(P),h(4P)=16h(P) | No zero affine denominator |
| cyclotomicHeight_model, §3.7 | Scaling numerator and sigma consistently by C gives same ratio e/σ; changing only sigma by 1+p changes the height by −2log_p(1+p)≠0 | Actual differential/model comparison needed |
| cyclotomicHeightPairing, §3.7 | h(nP)=n²a: ½(h(2P)−2h(P))=a; pair(P,2P)=2a | Correct polarization factor |
| padicRegulator, §3.7 | Rank0 det=1; rank1 [a] det=a; basis matrix [[1,1],[0,1]] gives det²=1 | Basis independent |
| padicRegulator_rank_zero, §3.7 | Empty matrix determinant 1, while torsion-corrected rank-zero MTT regulator is #tors⁻² | Correct distinction |
| normalizedRegulator, §3.7 | Rank r, v_p(l)=1: v(Reg_γ)=v(Reg_p)−r | Not interchangeable up to integral unit |
| HeightNondegenerate, §3.7 | Rank0 true (1≠0); diag(1,0) false; [p] true over Q_p | Nondegenerate does not mean unit determinant |
| Bold general Mahler–Manin, §3.7:1231 | q=p,p² algebraic of norms p⁻¹,p⁻² imply J transcendental; q1 norm1 excluded | Full prime/domain range |
| tateParameter_transcendental, §3.7 | j(E)∈Q algebraic and q_E nonzero norm<1: q_E cannot be algebraic | Contraposition |
| tateParameter_log_ne_zero, §3.7 | Kernel on Q_p× consists of ζp^n; all these are algebraic, contradicting transcendence | Nonzero for global elliptic parameter |
| Bold flat arithmetic complex, §3.8:1284 | A=0: all H_i=0, product1, order0; rational p-torsion gives nonzero H⁰ | S01 missing global-flat input |
| Flat generic restriction, §3.8:1288 | Identity tower map sends c to c on both sides; zero class maps to 0 | Correct variance |
| Flat degree zero, §3.8:1289 | Rational point of order p yields subgroup Z/p, not 0 | H⁰ retained |
| Flat local error comparison, §3.8:1290 | Nonsplit I₆ for 14a1 at 2: arithmetic component order2, geometric order6 | S01; arithmetic factors correct |
| Bold algebraic height, §3.8:1299 | Zero A gives zero pairing; T_pSha=0 if Sha[p∞] finite, but not from ordinarity alone | S01; quotient retained |
| Bold analytic height, §3.8:1299 | Rank1 h_an=a; theorem h_alg=−a, determinant sign−1 | S01; sign fixed |
| Schneider bilinearity/torsion, §3.8:1303 | nP=0 gives n·h(P,Q)=0 in Q_p, hence h=0 | Sound |
| Schneider isogeny functoriality, §3.8:1304 | φ=[2]: both sides 2h(P,Q) | Dual isogeny on second variable |
| Schneider character scaling, §3.8:1305 | κ→κ² at odd p: pairing doubles; rank2 determinant×4 | Correct |
| schneiderMultiplicativeHeightComparison, §3.8 | u=v=1+p: correction log(1+p)²/log q, valuation 2−v(log q) | Correct denominator; S04 false Check wording only |
| schneiderHeight_sign, §3.8 | Rank1 a↦−a; rank2 det unchanged | Correct sign |
| schneiderHeight_eq, §3.8 | Omitting split correction changes diagonal value by log(u)²/log q≠0 | Actual corrected pairing required |
| leadingTerm_T_to_s, §3.8 | F=T² gives leading s-coefficient l²; F=1 gives 1; inverse coordinate flips sign only in odd order | Correct |
| Bold full elliptic comparison, §3.9:1356 | Split extra quotient dual R/(X) has char(X), while finite R/(p,X) has char1 | Cannot discard infinite correction |
| schneider_leading_term_abelianVariety, §3.9 | A=0: rank0, regulator1, all cardinalities1, c∼1; A=E gives #tors² denominator | General target, S01 input missing |
| schneiderFlatGaloisComparison, §3.9 | 11a1,p5: H⁰ contains Z/5, finite-layer denominator contributes 5² | Reducible case retained |
| Multiplicative local factor, §3.9 | r0: ℒ/l; r1: ℒ Reg_p/l² | Correct coordinate exponent |
| schneider_order_ge_rank, §3.9 | Rank0 gives ord≥0; extra degenerate height zero forces ord>r in equality criterion | Source SW1021–1031 |
| schneider_order_eq_iff, §3.9 | Reg=0 with finite Sha makes RHS false and equality false; rank0 Reg=1 so finiteness is remaining condition | Both directions source-supported |
| schneider_leading_term, §3.9 | 11a1,p5: ε valuation2,c11 valuation1,torsion² valuation2; net valuation1 plus v(#Sha) | Correct Tamagawa/torsion placement |
| schneider_leading_term_split, §3.9 | r0 Regγ1, coefficient∼ℒ/l times arithmetic factors, not ℒ alone | Repaired |
| greenberg_rank_zero, §3.9 | 11a1,p7: ε unit,c11=5 unit,torsion p-part1, analytic value unit ⇒ Sha p-part1 | Nonanomalous example agrees |
| FW universal-family theorem, §4.1 | Σ=∅ excludes p and auxiliary2 for 14a1,p5; required regular base O[[X₁,X₂,X₃]] dimension4 | Admissibility/regularity retained |
| FW specialization, §4.2 | Derived tensor [R→aR] at a=0 gives two cohomology groups; underived quotient alone loses one | Derived correction retained |
| Signed main conjecture, §4.3 | i1 permits all η; i2 requires η1; a_p=0,k2 satisfies A; E full-SL condition separately required | Correct range |
| Removing Coleman image term, §4.4 | Im=XR,z=X²: image quotient char X versus ambient quotient char X² | Requires actual image=R (or rational version) |
| Kobayashi/Pollack dictionary, §4.5 | i1=minus,i2=plus; multiplier p maps R/XR≅pR/pXR, but ideals (X)≠(pX) | Corrected quotients integrally isomorphic |
| pollackMultiplierUnit, §4.5 | a=1 or 2 at p3: unit; a=p or p⁻¹: rational unit, not integral unit | Principal form needs hypothesis |
| kobayashi_corrected_iff_signed, §4.5 | Multiplication by p sends actual image R to pR and submodule XR to pXR; quotient unchanged | Correct both directions; S05 p3 period input |

### Layers 5 and 6

| Statement / locator | Instances and computed values on both sides | Result / change |
|---|---|---|
| Imprimitive change, §5.1 | Σ=Σ′: direct sum0,char1; split11 factor with γ11=2 is21/22 on both sides | Hypotheses imported from §1.2 |
| Coefficient invariance, §5.2 | Ramification e=2 sends μ(ϖX)=1 to μ′=2; λ remains1; equality descends faithfully | Sound |
| μ/λ comparison, §5.3 | f=ϖX,g=X: rational ideals equal, μ1≠0,λ1=1; μ equality would remove coefficient-prime discrepancy | Both conditions necessary |
| Rank-zero p-converse ordinary, §5.4(1) | 11a1,p7: L/Ω=1/5≠0, finite Selmer corank0; X-factor corresponds positive augmentation rank | Correct finite-error control |
| Rank-zero p-converse multiplicative, §5.4(1) | Split α1 gives analytic value0 despite L/Ω1/5; derivative ℒ/5≠0 supplies corrected test | Does not use ordinary interpolation argument |
| Bloch–Kato iff central L≠0, §5.4(2) | z specialization0 gives ord_X quotient≥1; nonzero specialization gives a line only after L=0 reciprocity | Accepted central-critical gap |
| Large-prime rank-zero context, §5.4(3) | rank0 and finite p-Sha give discrete corank0; source-reported implication then gives analytic order0 | Background only, no narrower proof asserted |
| ordinaryAugmentationControl, §5.4 | Finite group F has corank0; Q_p/Z_p error has corank1 and invalidates equality | Correct distinction |
| tateLInvariant, §5.5 | q=p gives0/1=0; q=p² gives0/2=0; q=1 has denominator0 and is outside norm<1 domain | S04 Check corrected |
| tateLInvariant_def, §5.5 | log q=a,ord q=n>0: (a/n)n=a; for q=p:0·1=0 | Sound |
| tateLInvariant_ne_zero, §5.5 | Algebraic j(E) excludes q=ζp^n, so numerator≠0 and denominator>0 | Only global elliptic assertion |
| tateLInvariant_isogeny, §5.5 | q→q^7 multiplies log3→21 and ord2→14;21/14=3/2 | Both isogeny directions |
| tateLInvariant_ofForm, §5.5 | Split a_p1 matches form ℒ=log q/ord q; nonsplit a_p−1 outside defined split predicate | Source convention preserved |
| MTT exact definition, §5.6 | 11a1 rank0,#tors5,c11=5,Sha1: regulator1/25 and arithmetic product5 give1/5 | No double-counted torsion |
| MTT_p definition, §5.6 | Multiplying an exact leading coefficient by p-adic unit2 at p3 preserves p-part but changes exact equality | Correct distinction |
| MTT.order_lower_bound, §5.6 | r0 nonsplit bound0; r0 split bound1; r1 split bound2 | Exceptional order retained |
| MTT_p.rank_zero_iff_BSD_p, §5.6 | Nonzero ordinary ε cancels even if v_p(ε)=2; equality of valuations subtracts same2 | Need nonzero, not unit, factor |
| MTT T-coordinate formula, §5.6 | Split r0 s-coefficient ℒA becomes ℒA/l; split r1 becomes ℒReg_p A/l² | Correct |
| greenbergStevens_derivative, §5.7 | 11a1,p11: derivative ℒ11/5≠0; nonsplit α−1 value2L/Ω already nonzero | Accepted general family gap |
| Trivial-zero order, §5.7 | L≠0,α1: value0,derivative≠0 ⇒ order1; α≠1: value≠0 ⇒ order0 | Both directions |
| MTT.exceptional_rank_zero, §5.7 | Nonzero ℒ cancels from ℒ·L/Ω=ℒ·A; zero ℒ would prevent cancellation but excluded globally | Correct |
| MMC plus nondegenerate height⇒MTT_p, §5.8(1) | Rank1 char leading a, coordinate conversion a·l; Regγ=Reg_p/l, cancellation leaves Reg_p | Integral ideal equality gives only up-to-unit conclusion |
| MMC plus order=rank⇒finite Sha/nondegenerate, §5.8(2) | Equality of ideal orders gives ord char=r; Schneider iff gives Reg≠0 and finite Sha | Correct direction |
| Greenberg modular instance, §5.9 | Weight2 datum homological determinantκ and ordinary local rank1 | Actual modular representation, not arbitrary scalars |
| Coates–Perrin-Riou modular instance, §5.9 | Kato line with H¹ rank1, quotient torsion; free extra summand would invalidate determinant setup | Imported generic proposition instantiated |
| 11a1 arithmetic example, §5.10 | a7=−2,Δ=−11⁵;7∤5,ā7²=4≠1; L/Ω=1/5 | SU true, FW auxiliary at11 false |
| 14a1 ordinary example, §5.10 | a13=−4,Δ=−2⁶7³;13∤6 and nonsplit2 gives invariant dimensions1,0 | FW ordinary range |
| 14a1 signed example, §5.10 | a5=0,#E(F5)=6;5∤6 at2; p5>3 and full residual image criterion | LLZ A and E |
| Eta-product coefficients, §5.11 | a2−4,a3=2,a4=8,a5−5,a6−8,a7=6; a4=16−8, a6=−4·2 | Hecke checks |
| etaProduct_residualRamifiedAtFive, §5.11 | Discriminant at2:16−32=−16≡5 mod7 nonsquare; Serre weight4; level1 dimension0 | Ramification requires level lowering, not Frobenius test alone |
| Higher-weight FW applicability, §5.11 | μ5=−1,5⁻¹=3 mod7 gives invariant eigenvalue−3=4≠1;4≢2 mod6 | FW applies; SU does not |
| p13 diagnostic, §5.11 | 1+2³=9≡−4;1+3³=28≡2;13 divides5⁴−1=624 | Finite congruences do not certify reducibility |
| anticyclotomicFormulationInputs, §6.1 | Inert prime has γℓ=1 anticyclotomically, unlike nontrivial cyclotomic Frobenius | Does not transfer cyclotomic local quotient blindly |
| Anticyclotomic rational/integral interface, §6.1 | (pX)=(X) after inverting p but not before | Correct output distinction |
| eisensteinFormulation, §6.2 | 11a1,p5 has rational Z/5 and residual reducibility; fixed T_pE remains specified | No homothety claim at reducible primes |
| eisenstein_imprimitive_change, §6.2 | Split-Cartan E[5]=1⊕ω gives T*[5]=ω⁻¹⊕1 with invariant dimension1 | Transfer condition fails for this example |
| eisenstein_isogeny_transfer, §6.2 | Prime-to-5 degree gives Tate isomorphism; degree5 may alter period valuation by1 | Correct range |
| kobayashiFormulation_iff_signed, §6.3 | η1,i1/i2 give minus/plus; p3,a3=±3 fails a_p0 requirement | Dictionary range retained |
| multiplicativeLocalConditions, §6.3 | α1 quotient L/O, dual R/(X); α−1 quotient0 at odd p | Correct correction |
| Supersingular downstream twist range, §6.3 | Twist discriminant prime to Np but containing supersingular reduction prime fails ordinary-prime support condition | Restriction retained, no extension claimed |

### Additional Check evaluations

These cover Checks whose distinctive test was not already recorded in a target row.

| Check location | Instances and computed values | Result / change |
|---|---|---|
| 399–405, determinant sign controls | (H² length,z quotient length)=(2,0) gives +2; (0,2) gives −2; (1,1) gives0 | All distinguish inverse determinant |
| 477–479, Iwasawa suitability | Identity A=O→O with nonzero specialized z passes; specialization z=0 gives no fraction-field trivialization | Correct contained-point direction |
| 624, Coleman image on all tame components | Σδ acts as p−1 on η1 and0 otherwise; image becomes R on η1 and (X) otherwise | Nontrivial η correction retained |
| 625,627 | Image=R gives identical defining quotient R/(L) in both bullets | S07: replace duplicate restatements |
| 713, homological versus cohomological inertia line | 11a1,ℓ11,p7: homological eigenvalue11≡4 gives fixed dimension0; cohomological eigenvalue1 gives dimension1 | Normalization distinction valid |
| 716, higher-weight μ versus invariant dimension | k4,ℓ5,p7,μ−1: eigenvalue4≠1; μ1,ℓ5 gives3≠1 also | μ nontrivial not equivalent outside weight2 |
| 756, determinant-one false unipotent lift | g=[[1,1],[ϖ,1+ϖ]], det g=1; det(g−I)=−ϖ; quotient O/(ϖ) | Correct negative control |
| 912–915, precision/field controls | Ideals(X)=(2X) at p3, coefficients1≠2 mod3; F₉ generator square order4 | Correct |
| 1267–1272, height boundary/scaling controls | O↦0; torsion↦0; h(4P)/16=h(2P)/4; C2 gives factor1/4 | Correct after repairs |
| 1275, alternative height normalization | h_MST=−h_SW/(2p); reversed polarization multiplies by−2, giving pairing_SW/p | Regulator factor p^(−r) correct |
| 1280 and 1693 | q=p: log0,ord1,ℒ0; logarithmic height correction denominator0 | S04 |
| 1295 | diag(1,0) determinant0, restriction to first line determinant1 | Retaining T_pSha matters |
| 1297 | 14a1 nonsplit I₆: arithmetic c₂2 versus geometric6 | Correct arithmetic component choice |
| 1321–1322 | u=1: correction0; replacing u by uq^a changes valuation by a·ord(q), so only a0 stays formal unit | Correct unique formal lift |
| 1414 | a5=1 ⇒ #E(F5)=5; ε valuation2; local ratio −α(1−5/α) unit | Squared factor necessary |
| 1460 | Finite-free algebra of rank2 has a rank2 scalar determinant/norm; its fraction algebra need not equal Frac Λ | Correct restriction-of-scalars distinction |
| 1484 | Tensor [R→aR] with R/(a): differential0, H¹ and H² both nonzero | No underived specialization |
| 1530–1531 | Weight2 implies p≥k−1=1; Col₂ nontrivial η image(X) | Range/image not conflated |
| 1558,1756,653 | No input/output values: these are consumer or proof-route statements | S07: move out of Checks |
| 1724–1729 | Rank0 torsion5,c11=5 yields5/25=1/5; ε nonzero cancels despite positive valuation | Exact versus p-part distinction valid |
| 1783–1784 | Order1 coefficienta becomesa·l; inverse coordinate gives−a·l; v(l)=1 | Sign unit, logarithm nonunit |
| 1853–1854 | q−1=4 has only prime divisor2; ℓ7 allowed, ℓ3 below5; dim S₄=0,dim S₁₂=1 | Weight bound essential |
| 1891 | Inert conjugation fixes Frobenius but acts by inversion on anticyclotomic Γ, so Frobenius²=1; Γ torsion-free at odd p gives Frobenius1 | Correct complete splitting |
| 1914–1916 | ω(g)=2 mod5, inverse3; rational torsion line becomes eigenvalue3, other split-Cartan line becomes1 | Untwisted invariants properly justified |
| 1940–1943 | p3,a3=±3 excludes a_p0; split local quotient L/O not0 | Scope and correction retained |

## Not verifiable

- BSDGP's primary Mahler–Manin paper is settled uncertified. Its general p-adic statement was checked through Waldschmidt Théorème 2; the primary proof was not certified.
- Kobayashi is settled uncertified. The signed interfaces were checked through LLZ; Kobayashi's original §5 proof was not read.
- Silverman, Advanced Topics V.5.3, is settled uncertified. The Tate-existence ownership finding uses the earlier roadmap's explicit target, not an assertion that this book was read.
- Serre IV.3.4, Lemma 3, is settled waived. LSTX's introduction verifies the rank-two statement and p≥5 range, not Serre's original proof.
- Jones is settled waived. The multiplicative endpoint was checked in SW Theorem 6.1 and Werner's local comparison, not Jones's original argument.
- Parts of the scanned src18 formulas near lines 1536–1541 have damaged mathematical typography. The sign at line 1533 and the global-flat-duality requirement at lines 506–508 are legible. The elliptic leading coefficient and coordinate factors were independently checked against SW Theorem 6.1 and direct substitution; a symbol-by-symbol certification of the damaged general formula is not claimed.
- The eight declared supplier gaps remain unimplemented contracts for purposes of this review. Their matching declarations and precise README ranges were checked; their completion by other owners was not assumed. This is separate from S01's undeclared global-flat prerequisite.
- No Lean elaboration or build was run, as required for this read-only pass. All four supplied elaborated signatures were compared with the source and README. This report does not substitute for a new build after the repair worker changes the acceptance file.

No new source request is needed; the five settled source dispositions remain unchanged.

## Source issues

- **Error** in SW at §4.1, p.1770 (SW line 758): the source says Katz's E₂ equals −12a/b; it should be b₂−12a/b, with −12a/b the corrected coefficient E₂−b₂; affects a stated result.
- **Misprint** in SW at equation (4.1), p.1770 (SW lines 763–766): the source says the expanded quadratic coefficient is −a/b; it should be +a/b to agree with the adjacent exponential formula and e₂=−12a/b; affects a stated result.
- **Error** in SW at §4.2, p.1771 (SW lines 807–817): the source says the weight-two Eisenstein value scales by C² when the differential pulls back by C; it should be C⁻² times the Tate value; affects a stated result.
- **Error** in FW at proof of Lemma 3.13, p.26 (FW lines 1497–1499): the source says lifting a nonidentity residual unipotent gives a rank-one kernel; it should be required to choose genuine characteristic-zero unipotence with primitive image; affects the proof.
- **Misprint** in FW at proof of Lemma 3.13, p.26 (FW lines 1504–1510): the source says a cone on fraction-field representations has the displayed integral torsion cohomology; it should be an integral cone, or its displayed cohomology should be tensored with the fraction field; affects the proof.
- **Error** in Hida at Lemma 3.17, p.95 (Hida lines 2555–2565): the source says the specified pairwise and first-coordinate projections force N=A^m; it should be allowed that N is a proper graph hyperplane, as the 𝔽₅ example above demonstrates; affects the proof.
- **Misprint** in HidaAdd at Lemma 0.2, p.1 (HidaAdd line 19): the source says the coordinate submodule N′ embeds in N; it should be embedded in A^m before intersecting with N; affects the proof.
- **Error** in HidaAdd at Lemma 0.2, p.1 (HidaAdd lines 13–20): the source says every proper N has an intersection satisfying the same projection hypotheses in one fewer coordinate; it should be allowed that this intersection loses pairwise surjectivity, as the graph-plane example shows; affects the proof.
- **Misprint** in HidaAdd at proof of Lemma 0.2, p.1 (HidaAdd line 25): the source says preservation of surjections by tensor product is left exactness; it should be right exactness; affects nothing.

The SW corrections and the genuine-unipotence safeguard are already in the repaired package. The Hida issues concern the downstream background citation, not an additional proof input to this package's targets.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e1ec38a2cc28f046cc9bba1e9c616c3052f6160a", "job": "RT-ModularIwasawaMainConjectures~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
