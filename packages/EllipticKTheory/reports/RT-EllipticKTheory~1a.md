<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/138#issuecomment-6328982258 -->
Red team round 1 pass a (codex) of 09c1447

Verdict: needs_changes

1. **F01** (P1) Geometric Frobenius is not the contragredient of arithmetic Frobenius on the Tate module

   **Location:** `packages/EllipticKTheory/README.md:390–391`: “geometric Frobenius on `H¹` is its contragredient.”

   **Claim:** Arithmetic Frobenius on `T_ℓE` and geometric Frobenius on untwisted `H¹` are related by inverse transpose.

   **Witness:** For `E: y²=x³−x` over `𝔽₃`, `a₃=0`; arithmetic Frobenius on `T_ℓE` has determinant `3`. Geometric Frobenius on `H¹` has determinant `3`, whereas its claimed contragredient has determinant `1/3`.

   **Exact repair text:** “Under `H¹(Ē, ℚ_ℓ) ≅ Hom(V_ℓE, ℚ_ℓ)`, arithmetic Frobenius acts by `(π⁻¹)ᵗ`, and geometric Frobenius by `πᵗ`. Consequently arithmetic Frobenius on `H¹(Ē, ℚ_ℓ(j))` has eigenvalues `q^j/α`, as used in §5.8.” Add the `a₃=0`, determinant-`3` example as a convention Check; type it only when the cohomology carriers exist.

2. **F02** (P2) The embeddings formulation of reciprocity needs inseparable multiplicities

   **Location:** `packages/EllipticKTheory/README.md:2010–2012`: “The product over geometric points, with all embeddings of each `k(P)`, is the same identity”.

   **Claim:** Replacing each residue norm by the product over embeddings works over the arbitrary base field of Layer 7.

   **Witness:** On `ℙ¹_{𝔽₂(s)}`, `{s,t²−s}` has tame values `s` at the purely inseparable degree-two point and `s⁻²` at infinity. The norms multiply to one; the unweighted embedding values multiply to `s⁻¹`.

   **Exact repair text:** “For a finite residue extension `L/k`, its norm is the product of its embeddings into an algebraic closure, each raised to `[L:k]_insep`. Equivalently use the tame values of the base-changed functions, whose orders include those multiplicities. The unweighted embeddings formula applies when all residue extensions are separable.” Add the displayed characteristic-two example as a negative-control Check. Keep the general normed theorem and its degree-one Lean statement.

3. **F03** (P2) An easy scheme milestone is omitted on a stale claim about the pins

   **Location:** `packages/EllipticKTheory/Suggested.lean:16–17,406–408`; `packages/EllipticKTheory/README.md:252–253`: “These postdate the pinned commit, so `Suggested.lean` does not use them.”

   **Claim:** Layer 1 cannot be represented in Lean because the projective Weierstrass scheme is absent at the pins.

   **Witness:** Pinned `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:75,80` defines `WeierstrassCurve.projModel` and `projModelOver`; `Scheme/Integral.lean:60` supplies `isIntegral_projModel`. Mathlib has `GeometricallyIntegral`. README §1.2's geometric-integrality milestone is therefore easy to state.

   **Exact repair text:** Replace the unavailable-carrier claim by “The pinned library supplies the projective Weierstrass scheme; scheme K-groups remain README-only.” Add the individual scheme module imports used and a Layer 1 signature:

   ```lean
   /-- Every projective Weierstrass cubic over a field is geometrically integral. -/
   theorem EllipticScheme.geometricallyIntegral {F : Type*} [Field F]
       (W : WeierstrassCurve F) :
       AlgebraicGeometry.GeometricallyIntegral W.projModelOver := by
     sorry
   ```

   Retain the dimension and cohomology assertions as separate README targets. Remove the claim that this carrier postdates the pin, and audit the remaining Layer 1 milestones against the actual imports.

4. **F04** (P1) Three prerequisite roadmaps are outside the permitted supplier set

   **Location:** `packages/EllipticKTheory/README.md:342–374`, supplier contracts for `K3BlochGroups`, `ArithmeticKTheory`, and `MotivicEtaleKTheory`; corresponding Needs throughout §§3.7, 4.4–4.6 and 5.5–5.9.

   **Claim:** These named sections provide indecomposable K₃, arithmetic K-theory, and the motivic/étale comparison infrastructure.

   **Witness:** None of these three folders exists in `TauCetiRoadmap/` or `Completed/` at main, occurs in `merge-order/ORDER.txt`, or is among the seven supplied open-roadmap heads. No matching declared gaps exist.

   **Exact repair text:** “The following prerequisites are owned here until supplied by an eligible earlier roadmap: the indecomposable-field K₃ quotient and its rational weight comparison; S-integer localisation, number-field K₂ torsion and the Dedekind finite-generation criterion; cycle complexes, field motivic cohomology, Bloch–Gabber–Kato, motivic K-theory spectral sequences and the prime-to-characteristic étale comparison.” Expand this into individually named prerequisite targets with the hypotheses currently claimed in the three contracts, before their consumers, and replace every citation to those three names by those targets. Alternatively register each genuinely missing theorem as a precise gap to an eligible earlier owner, in both the README and plan; mere renaming of a supplier is insufficient. Remove unused inputs such as Suslin's exact sequence unless a target actually consumes them. These are ownership moves required by the supplied merge order, not a demand to prove the prerequisites in this package.

5. **F05** (P2) The isogeny-to-scheme construction already belongs to AlgebraicCurves

   **Location:** `packages/EllipticKTheory/README.md:563–565`: “Prove `Isogeny.toSchemeHom`”.

   **Claim:** This roadmap owns the construction of the scheme map corresponding to a function-field isogeny.

   **Witness:** `TauCetiRoadmap/AlgebraicCurves/README.md:1128–1147` already owns the finite dominant morphism functor and explicitly its Weierstrass-isogeny specialisation. `TauCetiRoadmap/ModularCurves/README.md:64–66` confirms that ownership.

   **Exact repair text:** “Use AlgebraicCurves Layer 12C's isogeny-to-scheme-morphism correspondence, transported through ModularCurves Layer 2A's `projModelFunctionFieldEquiv`. The targets here are its compatibility diagrams with the pinned degree, differential, kernel-point and divisor-conorm APIs.” Delete the new construction/ownership claim for `Isogeny.toSchemeHom`; retain only those genuinely additional named compatibility targets.

6. **F06** (P1) The e-invariant splitting has no owned interface

   **Location:** `packages/EllipticKTheory/README.md:1421–1423,1477,1532`: “split by the field summand and the `e`-invariant”.

   **Claim:** The two surviving spectral-sequence pieces split as Galois modules, and the splitting descends compatibly to the actual positive K-group base-change map.

   **Witness:** `weibel` lines 30656–30661 and 30723–30727 use the e-invariant and its split edge map. No target or exact supplier contract in this README constructs that map or proves its splitting and Galois compatibility.

   **Exact repair text:** Add before `geometricK_galoisModule`: “`curveEInvariant`: for a smooth projective geometrically connected curve over a finite field, construct the odd K-theory e-invariant and identify its restriction to the field summand with the finite-field isomorphism. Construct the divisible-coefficient edge map, prove that structure pullback splits it, and prove compatibility with finite constant-field extension and the Galois action after passage to the algebraic closure (Weibel VI.6.3 and VI.6.4, including their cited VI.2.5.1 input).” Give these assertions separate names and dependency lines. Cite them explicitly in §§5.7, 5.9 and 5.11; do not infer a split extension merely from degeneration.

7. **F07** (P2) A quotient Bloch class is used as an actual certified K₂ class

   **Location:** `packages/EllipticKTheory/README.md:2195–2196`: “for instance a `G`-stable combination of the `S_a`”.

   **Claim:** The canonical classes of §7.7 can directly be fed to `N(β)/[L:k]` in the unramified K₂ group of §7.9.

   **Witness:** At README 2083–2086, `blochClassLift` lies in the localised tame kernel, but `S_a = blochClass a` lies in its quotient by constants and torsion. Over general fields, constant K₂ classes need not vanish rationally.

   **Exact repair text:** “Apply this descent theorem to an actual `G`-invariant element of `K_2^T(E_L) ⊗ ℚ`. For a combination of the quotient classes `S_a`, choose lifts, average them over `G`, and descend the averaged lift; its class modulo constants is independent of that choice. Add `galoisDescent_quotient`, proving that restriction and transfer preserve `Q_E` and that the rational quotient groups satisfy the same descent isomorphism. For number fields, constants are torsion, so the rational quotient identifies with the rational tame kernel.” Keep the distinction between a certified representative and its quotient class.

8. **F08** (P2) Arbitrary base change leaves the regular-curve interface

   **Location:** `packages/EllipticKTheory/README.md:1096–1097`: “in particular along base change `F ⊂ F'`”.

   **Claim:** The regular-curve weight-component interface applies to every scalar extension.

   **Witness:** The package's own README 1105–1107 gives `X = Spec(𝔽₂(t)[x,y]/((y−x)²−t))`, regular over `𝔽₂(t)`, whose base change to `𝔽₂(t)(√t)` is nonreduced and hence not regular.

   **Exact repair text:** “Define Adams eigenspaces on every noetherian scheme using SchemeKTheoryOperations §6.8 and prove pullback preserves them, including arbitrary field extension. The decomposition, finite weight bound and cycle-complex comparison in this section require the scheme to be regular; apply those conclusions to a scalar extension only when that base-changed scheme is regular.” Add the displayed inseparable extension as a Check distinguishing preservation of eigenspaces from applicability of the regular comparison.

9. **F09** (P1) The global resolution input exceeds the cited supplier

   **Location:** `packages/EllipticKTheory/README.md:1650–1657`: “so it has a resolution of singularities `X → W_O` by Lipman's theorem”.

   **Claim:** StableReduction Layers 4–5 supply the resolution used over the nonlocal Dedekind ring, with preservation of the regular locus; the supplier contract also advertises global blow-down machinery.

   **Witness:** `TauCetiRoadmap/StableReduction/README.md:481–487` restricts its resolution and common-resolution theorem to models over a DVR. A projective model over `ℤ`, as used here, is outside that hypothesis.

   **Exact repair text:** Add a prerequisite target before §6.2: “`excellentSurfaceResolution`: an integral excellent noetherian two-dimensional scheme admits a projective resolution by a regular scheme, obtained by normalization and blow-ups supported away from the regular locus; the resolution is an isomorphism over that locus (Stacks 54.14.5, tag 0BGP).” Supply the general surface construction here or declare its precise contract to an eligible earlier owner. State the global common-resolution extension in §6.4 as work owned here, using Stacks 54.17.2, and distinguish it from StableReduction's DVR theorem. Do not describe the local supplier as already supplying the global result.

10. **F10** (P3) The cited pinned torsion-function declaration has a different name

   **Location:** `packages/EllipticKTheory/README.md:61,224,2034`: `exists_principal_zsmul_pointPlace_sub_infinity`.

   **Claim:** This exact pinned theorem supplies the function with divisor `n(P)−n(O)`.

   **Witness:** The cited name is absent. Pinned `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/TorsionDivisor.lean:42` instead provides `WeierstrassCurve.Affine.exists_principal_eq_zsmul_ofPoint_sub_infinity`, with `n : ℤ` and hypothesis `n • T = 0`.

   **Exact repair text:** Replace each occurrence by `WeierstrassCurve.Affine.exists_principal_eq_zsmul_ofPoint_sub_infinity`, cite `TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.TorsionDivisor`, and explicitly cast the natural annihilator `C` to `ℤ` when applying it. Keep the existing result imported rather than introducing an alias with the stale name. Also correct README 231: `LineBundleClass X` already has a `CommGroup` instance at `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:142`, rather than merely the advertised monoid structure.

11. **F11** (P3) Statable discriminating Checks are missing from Lean

   **Location:** `packages/EllipticKTheory/README.md:1516–1525,1926–1943,1963–1975,2151–2160`; `packages/EllipticKTheory/Suggested.lean:228–237,391–396`.

   **Claim:** The examples test the introduced definitions and mirror every Check that the pins can express.

   **Witness:** The origin example also passes for the zero subgroup. There is no positive nonzero Frobenius-kernel example, no rejected certificate example, and no mirror of the two distinct formal-symbol coefficients at README 2151–2155. `ord_tameQuotient` is absent from README.

   **Exact repair text:** Replace the origin-only subgroup example with the stated nonzero rational 2-torsion example over `𝔽₃`; retain the characteristic-torsion exclusion. Add a negative certificate example using a uniformiser `t` and an order-zero unit `c` with nontrivial residue: the singleton candidate `{c,t}` cannot have a certificate. Combine the zero and subtraction candidate Checks in one proved example and use the second for the formal singleton/normalisation distinction, explicitly proving the coefficients `1,1/3` versus `3,1` for distinct symbols. Fold the order-zero and `−1` tame-value Checks into the two existing tame examples. Add `ord_tameQuotient` to §7.1's API. Keep at most two examples per definition; boundary Checks not yet provable become named theorem targets in both files. Audit the newly available scheme carriers under R03 for the same mirror requirement.

12. **F12** (P3) The infinite-S Check is outside its definition's domain

   **Location:** `packages/EllipticKTheory/README.md:1829–1830`: “if `S` is the set of all finite primes”.

   **Claim:** `integralPartS E S` can be evaluated at all finite places, although Layer 6 fixes `S` finite at line 1592 and the S-integer convention at line 189 does likewise.

   **Witness:** A number field has infinitely many finite places. The asserted input is therefore not an instance of the defined finite-S interface. Scholl's broader convention does not change this roadmap's binders.

   **Exact repair text:** Either extend `integralPartS` explicitly to arbitrary sets of places via localization and retain finite-S hypotheses only on the model-localisation arguments, or replace the Check by: “`finite_S_exhaustion`: the union over finite sets `S` of `integralPartS E S` is `K_2(E) ⊗ ℚ`, by continuity of K-theory and descent of each class to a finite localization.” Make that continuity assertion a named target or cite its precise eligible owner.

13. **F13** (P3) The package has no source manifest

   **Location:** `packages/EllipticKTheory/README.md:2322–2376` and the package file list.

   **Claim:** Every cited work is recorded with exact locators, version, access status and legal provenance.

   **Witness:** The package contains README, Suggested.lean, metadata.toml and review.json; there is no `packages/EllipticKTheory/sources.toml`. The references include fourteen works, counting Stacks as one work.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1` and one entry per cited work/version, including authors, title, year, locator scheme, exact locator(s), consumed sections, and the source service's URL, fetched-from URL, timestamp, SHA-256, licence class and status where available. Preserve genuinely paywalled sources as `uncertified`. Record Bloch and Young as unresolved until their legal texts are obtained; do not fabricate certification from the README's claims. The report's source audit distinguishes read texts from unavailable ones.

14. **F14** (P3) Several Checks merely repeat the target or describe what is not claimed

   **Location:** `packages/EllipticKTheory/README.md:810,926–930,940,1872,2202`.

   **Claim:** These entries are discriminating mathematical Checks.

   **Witness:** `K2_injective_rat_statement`, `curveLocalisation_exact`, `K2_finite_exact`, `vertical_iff` and `descent_rational_iso` restate their targets. `K2_integral_not_claimed` is a comment about proof scope and supplies no test instance.

   **Exact repair text:** Replace these repetitions with explicit cases. For §3.7 use “On `ℙ¹_ℚ`, `∞_*K_2(ℚ)` is a nonzero torsion subgroup of the kernel of generic restriction; rationalisation kills it.” For §3.1 use the already specified degree-two divisor and tame-value computations to test adjacent maps and their signs. For §3.8 retain `ℙ¹_{F_q}` and test a genuine higher-degree residue point. For §6.10 use an explicit torsion vertical residue versus the infinite-order residue of §8.3. For §7.9 use a quadratic extension and calculate both composites on a transferred symbol. Count only distinct instantiated assertions toward the required Checks.

15. **F15** (P3) One Needs line obscures the different arithmetic prerequisites

   **Location:** `packages/EllipticKTheory/README.md:1276–1365`, especially the common Needs at 1362–1365.

   **Claim:** One dependency list specifies the proof inputs for the zero-cycle construction, BMS, finite generation, reciprocity exactness, tame-kernel finiteness and Geisser–Levine.

   **Witness:** The reciprocity proof uses `BMS_functionField` and `closedPoints_coprimeDegrees`; tame-kernel finiteness uses `curveFiniteGeneration`; zero-cycle splitting uses transfer and projection formulas. These different internal edges are absent from the common list.

   **Exact repair text:** Give each target its own Needs line: `closedPoints_coprimeDegrees` uses the general curve Weil bound; `degreeOneZeroCycle` uses that target and Bézout; `zeroCycle_splitting` uses the cycle and finite transfer/projection formulas; `BMS_functionField` uses the arithmetic Mennicke-symbol theory; `curveFiniteGeneration` uses the Dedekind criterion and the function-field Steinberg-homology input; `reciprocitySequence_exact` uses BMS, coprime degrees, reciprocity and §4.1; `tameKernel_finite` uses finite generation, §3.8, Bloch–Gabber–Kato and absence of p-torsion; `geisserLevine` uses its named motivic/logarithmic-differential computation, the motivic spectral sequence and coefficient exact sequence. Resolve R04 before treating the replaced supplier references as available. Pin the reduction-theory input to an exact theorem of Harder/Grayson, not an entire paper.

16. **F16** (P2) The étale Kummer/trace contract omits invertibility of the coefficient

   **Location:** `packages/EllipticKTheory/README.md:387–389`: “`H¹(X̄, μ_n) = J(X̄)[n]` … `H²(X̄, μ_n) ≅ ℤ/n`”.

   **Claim:** These étale-cohomology identifications hold for an unspecified integer `n` on every smooth proper curve over an algebraically closed field.

   **Witness:** Take `X̄ = ℙ¹` over `𝔽̄₂` and `n=2`. Every étale object is reduced, so its only square root of unity is one: the étale sheaf `μ₂` is zero. Thus `H²_et(X̄,μ₂)=0 ≠ ℤ/2`.

   **Exact repair text:** “For every positive integer `n` invertible in the algebraically closed base field, the étale Kummer sequence identifies `H¹(X̄, μ_n)` with `J(X̄)[n]`, and the trace identifies `H²(X̄, μ_n)` with `ℤ/n`.” Add the characteristic-two example as the negative control; the actual uses with `n=ℓ^ν`, `ℓ≠p`, already meet this hypothesis.

17. **F17** (P2) Harder's theorem unnecessarily excludes nontrivial constant fields

   **Location:** `packages/EllipticKTheory/README.md:1379–1380`: “smooth projective geometrically connected curve”.

   **Claim:** The general finite-field finiteness theorem is represented only in the geometrically connected case, though the roadmap's curve convention merely requires integrality.

   **Witness:** `weibel` lines 30619–30620 state the theorem for every smooth projective curve. `ℙ¹_{𝔽₄}`, viewed over `𝔽₂`, meets the roadmap's curve convention but is excluded by `harder` as written.

   **Exact repair text:** “`harder`: for every smooth projective curve over a finite field of characteristic `p` and every `n≥1`, `K_n(X)` is finite of order prime to `p`.” Add `constantFieldReduction`: for an integral such curve, `k_X=H⁰(X,O_X)` is a finite extension of the stated base and `X/k_X` is geometrically connected; apply the existing proof with `k_X`. For a disconnected smooth projective curve, use its finite component decomposition. State the finite-field group formulas with this exact constant field; the geometrically connected formulas remain the specialization `k_X=F_q`. Add the Check `K_1(ℙ¹_{𝔽₄}) ≅ (ℤ/3)²`, including when the scheme is viewed over `𝔽₂`.

18. **F18** (P3) The Lean file bypasses the required layer order and ends with a target catalogue

   **Location:** `packages/EllipticKTheory/Suggested.lean:35–180,400–432`: “Carriers of the headline statements”, “Headline theorems”, and “Statements not typed at the pins”.

   **Claim:** The file follows the required layer-by-layer signature format and omits catalogues of untyped names.

   **Witness:** Layer 7 definitions and examples precede Layer 5; `tame_last_point` and `blochCorrection` precede Layer 6. Lines 406–432 enumerate untyped targets. The brief requires README layer order and expressly forbids name catalogues.

   **Exact repair text:** Place `twistedFrobeniusKernel`, its cardinality theorem and its API in Layer 5; retain the model block in Layer 6; put the tame definitions, examples, `tame_last_point`, `blochCorrection` and certificate block together in Layer 7. Prepend the newly statable Layer 1 signatures from R03. Delete the closing catalogue and retain one sentence in the module docstring: “Targets whose carriers are not yet available remain in README.md.”

## Verified sound

Coverage: all 2,376 README lines and all 435 Lean lines read; **34 Lean declarations** (17 named theorems, 10 real-bodied definitions/structures, 7 proved examples); **60 numbered target blocks** and all **121 bold spans** inventoried; **237 Check bullets** examined, including the four unlabelled zero-cycle Checks; **106 source-locator checks** completed against legal texts, enumerated below. These counts describe review coverage, not successful formal proofs. Six finite-field point counts, the inseparable norm counterexample, the degree-two norm product, the E₄ discriminant and the C=2 obstruction were independently recomputed. No Lean command or build was run.

The typed tame-symbol normalization, its two orientation examples, the Frobenius-kernel cardinality signature for `i≥1`, the degree-one last-point signature, the finite-subgroup correction signature, and the model-morphism uniqueness hypotheses survive the tested cases. No false Lean proposition, admitted data definition, `True` placeholder, `set_option`, `lemma`, or forced headline was found. The missing easy scheme milestone is R03. The file has one `import Mathlib`; all five individually imported Tau Ceti modules exist at the pins. The source bodies are not copied into the report.

The seven available supplier roadmaps checked at their cited sections were ModularCurves, EllipticCurves, AlgebraicCurves, JacobianChallenge, StableReduction, SchemeAndStackFoundations and ProfiniteCohomology. Concrete checks included ModularCurves 1A–1B, 1D, 2A–2D; AlgebraicCurves 12A–12D; EllipticCurves 0.5, 1–3; JacobianChallenge A, B, D; StableReduction 4–5; SchemeAndStackFoundations 4.13, 5.7, 5.11; and ProfiniteCohomology 10–11 and its procyclic example. R05 and R09 record the mismatches. All seven supplied open-roadmap heads were searched for overlapping objects; the package makes **zero supplier citations to those seven heads**. Twelve other permitted suppliers could not be checked at a supplied head; these are listed below. R04 concerns three names outside the permitted set, not these unavailable twelve.

Pinned declarations and their surrounding objects were searched. Signature checks included `FiniteField.frobeniusAlgHom`, `Place.exists_eq_zpow_mul_unit`, `Place.finite_setOf_ord_ne_zero`, the point/place and point/divisor-class equivalences, `classGroupAddEquivPicZeroProdInt`, the torsion-divisor existence theorem, `projModel`, `projModelOver`, `isIntegral_projModel`, the scheme Picard equivalence, `ext_of_isDominant_of_isSeparated`, `genericFiberTowerIso`, isogeny degree/differential APIs, Tate-module rank and `hasse_bound`. R03 and R10 record pin drift. No new K-group carrier was invented for the Lean headlines.

The following table enumerates the 106 source-locator checks. “Read” means the locator and mathematical content were checked in the fetched version; discrepancies are reported above. Source IDs refer to the source-service audit records. R13 requires adding the corresponding package manifest.

| Source | Count | Locators read and extraction anchors |
| --- | ---: | --- |
| `weibel` | 43 | I.5.14–5.16 (lines 3266, 3295, 3337); II.8.1, 8.2.1, 8.2.3–8.2.4, 8.5–8.6 (lines 8053, 8124, 8185, 8197, 8338, 8341); III.2.5.1, 6.3, 6.3.1, 6.5.3, 6.7, 6.7.1, 7.2 (lines 10938, 13461, 13484, 13597, 13711, 13762, 14147); IV.6.9 and Exercise IV.6.13 (lines 19064, 19200); V.1.5, 3.3.2, 3.11–3.12, 6.6, 6.6.3–6.6.4, 6.7.1, 6.8, 6.12–6.12.1, 6.13.2, 9.5 (lines 21877, 23037, 23664, 23707, 24532, 24596, 24613, 24664, 24726, 25026, 25058, 25130, 26555); VI.1.7, 4.3, 4.3.2, 4.7, 6.1–6.8 (lines 28316, 29139, 29203, 29411, 30619–30800). |
| `levine` | 6 | §3.2, Lemma 3.3, Proposition 3.5, Proposition 6.8, Theorems 12.12 and 14.7: lines 551, 583, 618, 847, 2644, 3399. Author draft December 2001, as cited. |
| `ddz` | 9 | (3.1), (3.5), (3.6), Remark 3.8, Construction 4.1, Lemma 4.2, Proposition 4.3, Remark 4.14, Theorem 8.3: lines 173, 247, 257, 263, 348, 359, 365, 515, 1103. |
| `dgjk` | 4 | Proposition 2.2, Proposition 10.2, Remark 10.3, Table 10.4: lines 354, 1407, 1483, 1472. The source's discriminant misprint at line 375 is correctly corrected by the package. |
| `scholl` | 10 | Introduction (0.1); 1.1.1–1.1.7; 1.3.3; 1.3.6: lines 23, 92–139, 267, 317. Nonregular-model independence is explicitly rejected by the source. |
| `conrad` | 7 | Definitions 3.1, 3.8, Example 3.9, Theorem 3.10, Remark 3.11, Corollary 4.7, Example 5.3: lines 274, 342, 348, 362, 365, 536, 615. |
| `stacks-curves` | 5 | Tags 0BY1, 0BY3, 0BS6, 0BYC, 0BYD: lines 99, 142, 461, 755, 766. |
| `stacks-resolve` | 5 | Tags 0ADX, 0BGP, 0C5J, 0C2N, 0C5S: lines 28, 1880, 2064, 2274, 2390. |
| `stacks-models` | 8 | Tags 0C2U, 0C2V, 0CD9, 0C2W, 0C5Z, 0C6B, 0C9Z and Example 55.10.3: lines 2818, 2830, 2838, 2853, 2863, 3078, 3106, 3114. The package does not copy the source's misleading normal-locus claim or reversed arrow. |
| Further Stacks locators | 3 | 01T6: `stacks-01T6` line 1288; 00PD: `stacks-00PD` line 13409; Algebra 10.140.3 / 00TT: `stacks-10-140-3` line 17618. |
| `poonen` | 4 | (5.7.29), Corollary 6.7.8, Exercises 2.12 and 6.10: lines 6058, 8065, 2521, 8390. |
| `bms-numdam` | 1 | Corollary 4.3(a), lines 1319–1321, verifies the primary arithmetic-ring `SL=E` input behind the cited K-book variant. |
| `harder` | 1 | Corollary (3.2.3), lines 1589–1594. The proof assumes Quillen’s finite-generation theorem; it does not itself replace the missing detailed Grayson input. The introduction and reduction-theory context were also read. |

Dependency command output, run on the unchanged package:

```text
NOT IN ORDER: EllipticKTheory (insert it after its last supplier)
depcheck: 8 roadmaps, 61 edges, 1 problem(s)
```

Exit status was 1. There was **no UPWARD or CYCLE line**. “NOT IN ORDER” is not raised as a finding under the brief's rule. This gate output does not certify the absent suppliers: only eight roadmaps were loaded. The local numbered Needs edges were also read; no backward mathematical dependency was found beyond the unowned inputs and missing internal edges recorded in R06, R09 and R15. R04's required ownership moves are the indecomposable-field K₃ inputs, arithmetic K-theory inputs and motivic/étale prerequisites currently assigned to unpermitted suppliers. No move from a verified later sibling was required.

`git diff --stat origin/main...HEAD` reports only these package files: README.md (2,376 additions), Suggested.lean (435), metadata.toml (1), review.json (8), 2,820 insertions total. No tracked package file was edited by this review. No computational algorithm or pull-request number was found in the README or mathematical docstrings. R03 addresses the stale pin narrative; R18 addresses the Lean layout and catalogue. The source prose was checked for mathematical support, not certified by an automated plagiarism scan.

The complete declaration-context and adversarial-instance tables follow. “Correct” or “valid” in them describes the mathematical test, subject to the source and supplier limitations below.

The line numbers below refer to `packages/EllipticKTheory/Suggested.lean`. Every declaration was read, including its complete signature, section variables and proof/body. `T` means independent field universes `k,K : Type*`, `[Field k] [Field K] [Algebra k K]`; `F` means finite field `k`, arbitrary Weierstrass `W/k`, and extension field `L` with `[DecidableEq L] [Algebra k L]`; `M` means `O,F : Type u`, `[CommRing O] [Field F] [Algebra O F]`, `C : Scheme.{u}` and its fixed arrow to `Spec F`. These are signature inspections, not elaboration results.

| Line / declaration | README section; context and additional binders | Instances / result / change |
| --- | --- | --- |
| 43 `ord_tameQuotient` | 7.1; T, place, two units | Orders 0, 1, −1; bilinear cancellation correct. R11: name absent in README. |
| 53 `tameValue` | 7.1; T, place, two units | Unit/uniformiser, reversed pair, self-pair, characteristic two; sign and nonzero denominator correct. R11. |
| 60 `SymbolCandidate` | 7.1; field K only | Zero, singleton, repeated pair with opposite coefficients; real free abelian carrier, no K₂ quotient smuggled in. R11. |
| 63 `SymbolCandidate.tame` | 7.1; T, place, candidate | Empty product, coefficient −1, cancellation; correct. R11. |
| 71 orientation example | 7.1, 7.7; T, order-zero c, order-n h | n=1,3,−1: residues c, c³, c⁻¹ and inverses; valid. |
| 81 sign example | 7.1; T, ord(t)=1 | Odd residue characteristic gives −1; characteristic two gives 1; valid. |
| 86 quotient example | 7.1; T, three units | g=h gives zero candidate and quotient one; g≠h keeps integer coefficients; valid. |
| 109 `twistedFrobeniusKernel` | 5.10; F, i:ℕ | i=0, rational prime-to-p torsion, nonzero p-torsion, singular W; subgroup construction uses no missing ellipticity. R11. |
| 134 `card_twistedFrobeniusKernel` | 5.11; finite field, DecidableEq k/closure, explicit W.IsElliptic, i≥1 | q=2, traces ±2 give 5/13; i=0 excluded; all needed mathematical binders explicit. |
| 145 `tame_last_point` | 7.4; T, explicit IsFunctionField, degree-one place, all other residues trivial | Rational last point valid; degree-two value −1 with norm 1 explains hypothesis. R02 concerns prose, not this signature. |
| 156 `blochCorrection` | 7.6; field F, DecidableEq F, affine elliptic W, subgroup T, finite list exactly T\{0}, positive annihilator C, support/divisor/residue hypotheses | Trivial T, C=1, C=2, characteristic dividing C; formula works on the stated finite subgroup. Primary-source comparison unverified. |
| 190 membership iff | 5.10; F, i, point | Both conditions exactly unfold; true definitional theorem. |
| 201 characteristic-torsion exclusion | 5.10; F, membership and pP=0 | gcd(m,p)=1 forces point order one; true for all i. |
| 211 base-change membership iff | 5.10; F plus DecidableEq k, rational P, positive coprime annihilator | i=0 gives zero scalar; i≥1 gives q^i−1; map injectivity and q≥2 justify natural subtraction. |
| 221 map membership | 5.10; F, extension M with field/DecidableEq/algebra, k-algebra hom σ | Identity, further algebraic or transcendental extension; q-power commutation valid. |
| 228 origin example | 5.10; F, i | True for every subgroup, including the wrong zero subgroup; R11. |
| 234 negative torsion example | 5.10; F, i, pP=0, P≠0 | Valid use of coprime orders; excludes rational two-torsion in characteristic two at i=0. |
| 255 `RegularProperModel` | 6.1; M | Properness, flatness, all regular stalks and marking over F present. Fraction-field interpretation is used under the later explicit hypotheses. |
| 276 `genericFibreInclusion` | 6.1; M, model | Inverse marking then first pullback projection; direction correct. |
| 281 marking example | 6.1; M, model | Identity marking and field-twisting negative control; both triangles enforce the base arrow. |
| 291 `RegularProperModel.Hom` | 6.3; M, two models | Identity, blow-down, nontrivial elliptic involution; both base and marking conditions present. |
| 300 `Hom.id` | 6.3; M, model | Two identity triangles hold; real body. |
| 307 `IsMinimal` | 6.3; M, model | Smooth/nodal minimal models satisfy outgoing condition; point blow-up fails. No incoming/outgoing reversal. |
| 313 `Hom.subsingleton` | 6.3; M plus explicit IsDedekindDomain O and IsFractionRing O F | O a field; DVR; empty generic fibre; uniqueness follows from density/reducedness/separatedness. No standing instance silently lost. |
| 329 leading-unit formula | 7.1; T, four units, ord(t)=1, order-zero u,w, two factorisations | Positive/negative valuations and changed uniformiser; sign and inverse placement correct. |
| 337 two units | 7.1; T, both orders zero | Formula becomes one; no finiteness hypothesis needed. |
| 342 swap | 7.1; T, arbitrary units | Self-pair −1 is its inverse, including characteristic two; correct. |
| 347 multiplication | 7.1; T, three units | Cancellation f′=f⁻¹ and negative valuations; correct. |
| 352 Steinberg | 7.1; T, units f,g with f+g=1 | Orders positive, zero, negative; unit types exclude f=0,1; correct. |
| 358 self-pair | 7.1; T, unit f | ord(f)=−1,0,1,2; parity identity a²≡a mod 2 gives the stated sign. |
| 366 `SymbolCertificate` | 7.2; T, candidate; k explicit | Finite support, local uniformisers and actual residue-unit equality; norm-only certificate rejected. R11. |
| 379 certificate soundness | 7.2; T, certificate, place | On-support hypothesis plus off-support units; no function-field hypothesis needed here. |
| 386 certificate completeness | 7.2; T, explicit IsFunctionField, candidate | Finite union of zero/pole sets and local uniformisers give converse; empty candidate valid. |
| 391 empty-certificate example | 7.2; T | Empty support makes unused uniformiser values harmless; valid but needs a negative partner, R11. |

All 60 numbered README target blocks were examined, including the claims inside each block. Bold spans were separately inventoried: this README uses bold mainly for supplier labels, conventions and Checks, rather than target names. The table records the mathematical tests; an unchanged row does not certify an unavailable supplier or unread primary source. Fields exclude the zero ring; curves are integral, separated and finite type by the standing conventions; properness is retained where used. Characteristic two and inseparable extensions were tested separately rather than excluded.

| Statement / README section | Instances tried | Result / change |
| --- | --- | --- |
| 1.1 Weierstrass scheme/charts | Origin, affine points, cusp over F₅, general characteristic 2/3 | Chart cover and counts correct; existing carriers omitted from Lean, R03. |
| 1.2 smooth/proper/geometrically integral; genus | Discriminant zero cusp; elliptic cubic; scalar extension | Integrality survives the singular case, smoothness requires ellipticity. R03. |
| 1.3 regular-local and DVR interfaces | Generic point versus closed point; regular nonsmooth curve over F_p(t) | Dimension-one condition retained for DVR; smoothness is sufficient, not necessary. |
| 1.4 function field/closed points | Origin; degree-two point on y²=x³+1; affine open omitting infinity | Residue fields and degrees distinguish all closed points from rational points. |
| 1.5 points and group law | F₅ curve with 8 points; singular cubic with 6 points and 5 smooth points | Ellipticity retained for identification with full scheme points. |
| 1.6 isogeny scheme map and zero | Identity; prime-to-p multiplication; inseparable Frobenius; zero map | Zero map not finite; construction duplicates earlier ownership, R05. |
| 2.1 rank/determinant | O, skyscraper at rational/degree-two point, rank-zero class | Determinant is O(x), with positive sign; imported rank/determinant interface acknowledged. |
| 2.2 Euler characteristic | P¹, elliptic O, P¹_F₄ over F₂, negative-degree line bundles | Weighted degrees and constant-field dimension included; χ differs from degree on P¹. |
| 2.3 divisor/line-bundle bridge | Principal divisor, origin, affine line missing infinity | Correct restriction to proper model when using all places. |
| 2.4 Picard decomposition | O(P), O(O), real conic without rational point | Splitting requires degree-one class; conic degree image 2Z correct. |
| 2.5 Picard descent | Elliptic origin, real conic, separable closure | Brauer obstruction prevents false general surjectivity; elliptic case sound. |
| 2.6 ring multiplication | Two rank-zero classes; unit; negative virtual rank | Square-zero product correct; componentwise product fails. |
| 2.7 elliptic K₀ | F₅ curve; rational/nonrational skyscrapers; origin | Additive coordinates and square-zero multiplication agree. |
| 3.1 localisation | All closed points; (t²+1)/(t²+2); rank versus determinant degree | Rational-point truncation fails as claimed; repeated Check, R14. |
| 3.2 tame boundary | {u,t}, {t,u}, {t,t}; quadratic residue extension | Package convention is inverse K-book convention; sign correct. |
| 3.3 divisor boundary | t²+1 on P¹_Q, O_X, degree-zero virtual bundle | Degree-two zero balanced by twice infinity; rank tail correct. |
| 3.4 open restriction | Empty removed set; removed zero/pole; retained degree-two point | Residue projection and exact-functor direction correct. |
| 3.5 finite pullback | t=s² at zero; identity; purely inseparable map | Ramification multiplicity required and included; divisor conorm correct. |
| 3.6 transfer | Identity; quadratic field norm; restriction then transfer | Residue norm, not unweighted product, gives compatibility. |
| 3.7 number-field K₂ | P¹_Q, torsion ∞_*K₂(Q), {2,t} | Rational injectivity true; unavailable arithmetic supplier R04; vacuous Checks R14. |
| 3.8 finite-field K₂ | P¹_F₂; degree-two residue field; elliptic finite field | K₂ of every residue field zero gives integral injectivity; repeated Check R14. |
| 4.1 K₁/SK₁ | P¹, A¹, two affine charts, constants | Proper SK₁ is not determined by chartwise stable SK₁; two copies for P¹ correct. |
| 4.2 base-point splitting | Infinity on P¹; arbitrary closed point degree two | P*P_*=0; nonrational contribution is the norm. |
| 4.3 coniveau filtration | Spec F; A¹; P¹_Q in degree 3 | One/two columns and nonzero F¹ distinguished; no false kernel identification. |
| 4.4 third K-group | Elliptic origin; P¹_Q with K₃(Q)=Z/48 | F¹ contribution cannot be discarded; unpermitted K₃ supplier, R04. |
| 4.5 Adams weights/motivic comparison | P¹; P² integral eigenvectors; inseparable extension of regular curve | Rational weights and Adams pullback are correct; the latter’s target can leave the declared regular-curve interface, R08; supplier R04. |
| 4.6 indecomposable K₃ | Q; number field with r₂>0; P¹ Gysin weight shift | Weight 2/3 field decomposition and shift correct; supplier R04. |
| 5.1 K pullback/proper pushforward | Identity; structure maps; finite field extension; open/generic inclusion | Proper/perfect hypotheses and K versus G retained. |
| 5.2 projection formula | Identity; separable degree-two isogeny | Multiplication by f_*O, not automatically by degree, correct. |
| 5.3 determinant obstruction | Degree-two isogeny; [3] over Q; rational coefficients | Nontrivial degree-two kernel character and odd multiplication cases distinguish integral/rational claims. |
| 5.4 projective line | O,O(−1),O_∞; F₂ K₃; elliptic rational 5-torsion | Projective-bundle sign and failure of two-generator elliptic K₀ correct. |
| 5.5 six arithmetic inputs | F_q[t], F_q[t,t⁻¹]; signed degree 3−2 cycle; zero cycle; p=2 | Zero-cycle retraction and BMS statement sound; R04, R15; Harder’s corollary checked; the detailed Grayson finite-generation proof remains uncertified. |
| 5.6 Harder | P¹; nonproper G_m; n=0; characteristic torsion | Positive-degree/properness restrictions needed and present; unnecessarily restricted constant field, R17. |
| 5.7 geometric Galois modules | i=1; P¹ versus elliptic; integral versus divisible coefficients | Twist shift correct; unowned e-invariant splitting, R06; R01 in supplier convention; invertibility omitted from Kummer contract, R16. |
| 5.8 twisted cohomology descent | j=0,1,2; genus zero; H¹(Spec F_q,Q_l) | Restriction j≥2 avoids eigenvalue one; no false untwisted descent. |
| 5.9 positive K descent | n=1; n=0; extension F_{q^r} | Positive degree retained; generator changes to σ^r. Splitting input R06. |
| 5.10 twisted Frobenius kernel | i=0; rational 2-torsion over F₃; p-torsion over F₂; traces ±2 | Prime-to-p clause meaningful; D₁=5 or 13; missing discriminating example R11. |
| 5.11 finite-field K-groups | q=2,3; i=1,2; P¹; elliptic traces ±2 | Orders 5,25 and 13,41 and 28; i=0 excluded. Splitting input R06. |
| 6.1 marked regular proper models | O=F; field-twisted marking; 37a1 nodal fibre; 11a1 singular total space | Flatness and over-F marking present; regular total space differs from smooth fibre. |
| 6.2 model existence | Global Z versus DVR; regular 37a1; 11a1; normal singular surface | Existence true, but cited supplier lacks required global resolution, R09. |
| 6.3 Hom/minimality | Identity; involution; blow-down; nodal minimal model | Marking rejects involution; outgoing minimality correct. |
| 6.4 blow-up connection | Identity; one blow-up; arbitrary marking | Proper regular dimension-two hypotheses retained; general resolution ownership R09. |
| 6.5 locally minimal existence | Smooth model; one exceptional curve; finitely many bad primes | Finite contraction argument has correct sign/termination parameter; resolution input R09. |
| 6.6 terminal/local criterion | Minimal model; blow-up; genus-zero P¹ | Positive genus necessary and present; outgoing minimality versus terminal property reconciled. |
| 6.7 uniqueness/localisation | Identity; unmarked involution; invert 37 | Uniqueness only as marked models; localisation direction correct. |
| 6.8 integral part | Empty S; good prime 2; all primes; nonregular model | Finite-S boundary violation R12; regularity needed for model independence. |
| 6.9 good primes | F₂ good fibre K₁=0; F_q K₁ finite; split multiplicative fibre | Rational claim and stronger F₂ integral surjectivity correct; Young primary unread. |
| 6.10 vertical residues | Torsion residue; DdZ order-infinite residue; good fibre | Rational image requires torsion, not literal residue one; repeated Check R14. |
| 7.1 tame values/candidates | Units, uniformiser/self-pair, opposite coefficients, formal Steinberg singleton | Real definitions and sign correct; missing Lean mirrors R11. |
| 7.2 certificates | Zero candidate; 11a3 correction; degree-two residue −1 of norm 1 | Residue equality is stronger than norm equality; missing negative Lean example R11. |
| 7.3 integral certificates | Unit constants; 11a3; u=1/3 | Good-fibre support condition and infinite-order obstruction coherent; Young theorem unread. |
| 7.4 reciprocity | Rational last point; degree-two point; purely inseparable degree-two point | Normed identity correct; geometric restatement loses multiplicity, R02. |
| 7.5 torsion functions/rho | C=1; C=2; characteristic 2; nonprincipal (P)−(O) | Full-torsion rho requires C prime to characteristic as stated; stale pinned name R10. |
| 7.6 correction | Trivial torsion subgroup; C=1,2,5; correction residue c^(−C) | Factor C and function-first order correct; no extra coprimality needed for finite rational subgroup version. |
| 7.7 divided Bloch classes | C=1 empty family; C=2 residues; scaling f_a; two formal terms | Quotient and division distinguish integral convention; original Bloch comparison unread. |
| 7.8 constant extension transfer | Identity; quadratic extension Q(√2); nonsplit closed point | Norm projection and finite-extension hypotheses correct. |
| 7.9 Galois descent | Trivial group; chosen invariant lift; non-torsion constants over general field | Quotient class is not an actual K₂ input, R07; repeated Check R14. |
| 8.1 E₄ certificate | Eight points; specialization at (0,0), (−16,0); residue at 5 | Sign correction essential; corrected discriminant agrees with independent calculation. |
| 8.2 nonrational residue | Q(√2) residue −1; norm 1; degree-two conjugate product | Five listed residue values and norm distinction agree. |
| 8.3 vertical examples | 11a3; u=1/3 at 3; u=4 | Order-infinite residue 1/w obstructs every nonzero multiple; DGJK integrality statement checked; Young unread. |

## Not verifiable

- **Elaboration:** no Lean command was run, as required. The 34 declarations were inspected mathematically and against source signatures; neither their elaboration nor the prospective repair signature in R03 is certified by this pass.
- **Bloch, ICM construction, p. 514:** the sources service could not retrieve the official IMU PDF (SSL failure, including the alternative non-OCR URL). The claimed integral normalization and exact primary-source comparison in §7.7 remain unread. The algebraic normalization and correction signs were checked independently.
- **Young, Lemma 3.1, pp. 37–38; Theorem 3.3, p. 41:** both institutional URL attempts timed out. The primary statement, numbering, and bad-fibre rank claim used in §§6.9, 7.3, 7.5–7.6 and 8.3 remain unread. These two unresolved texts are recorded together in the job’s `scratch/needs-references.toml`; every other cited work was fetched or assessed before completing this report.
- **Geisser–Levine and Grayson:** the sources service records the primary publications as `uncertified` (paywalled). Their K-book formulations were read. The primary proofs and finer reduction-theory/Steinberg-homology interface were not certified. They are not included in the missing-reference request, following the brief’s settled-status rule.
- **Twelve permitted supplier heads:** the following roadmaps are allowed earlier suppliers, but their folders are absent from the supplied main/Completed trees and no read-only head was supplied. Their exact section names, signatures and outgoing dependencies cannot be certified. Their absence here is not a finding and is distinct from R04.

| Permitted supplier without an available head | Contract requiring verification |
| --- | --- |
| NeronModelsAndSemistableAbelianVarieties | The Néron-model comparison in the supplier list and Layer 6 |
| SchemeKTheoryOperations | §§2–7: operations, localisation, supports, weights and self-intersection |
| GeneralAlgebraicKTheory | §§2.4–2.5, 3.2, 4.6, 4.8, 4.14 and 13.8c |
| KTheoryLowDegrees | §§8.1, 11.1, 12.2–12.3 |
| K2SymbolsBrauer | Milnor symbols, residue normalizations, transfer, reciprocity and Bass–Tate |
| KTheoryFiniteLocalFields | §§1.5–1.6 and 3.4 |
| DeligneWeightsAndPurity | DWP.0 §0.2(iii); DWP.1 §§1.4, 1.6–1.7 |
| StableHomotopyKTheory | §§7.1–7.4, 7.8 and 7.25–7.29 |
| EtaleDualityAndPerverseSheaves | §§0.3 and 0.5; R16 independently corrects the stated contract |
| WeightsInEtaleCohomology | R34.2; R01 independently corrects the stated convention |
| ArithmeticGaloisDuality | R02.2 and Layer D7 |
| SelmerIwasawaCohomology | §2.7 |

The unavailable heads also limit the mechanical cycle check and verification of duplicate ownership within those roadmaps. No claim of a fully certified supplier graph is made.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "09c14478135198bcfe47a7cbc86ceff515066139", "job": "RT-EllipticKTheory~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
