<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/589#issuecomment-6322616387 -->
Red team round 1 pass b (claude) of aac0445

Verdict: needs_changes

1. **F01** (P3) Strict coefficient-prime bounds transcribed from an extraction that prints ⩾ as >

   Location: `packages/SelmerIwasawaCohomologyPartII/README.md:187` ("ℓ>2(N+1)"), `:469`, `:482`, `:492`, `:502` ("ℓ>2(N+1), ℓ unramified in F"), `:632` ("ℓ>2(n₀+1) and ℓ unramified in F").

   Claim: §§3.3–3.6 and the rigid-r-equals-t contract state the even-rank bound as strict, and Datum 5.1 states its bound as strict, both attributed to ltxzz Theorem 6.3.5(a) and §7.2.

   Witness: ltxzz-published line 6408 (Theorem 6.3.4(a)) and line 6746 (§7.2 data) print the symbol as "greaterorequalslant", i.e. ℓ ⩾ 2(N+1) and ℓ ⩾ 2(n₀+1). The arXiv extraction prints every ⩾ as ">" (ltxzz line 644 has "smallest integer r_R > 0" for a depth that is 0 under irreducibility; line 4021 has "r := ⌊N/2⌋ > 1" where N = 2 is allowed). L1 "ℓ > 4n" is genuinely strict (ltxzz-published line 7348).

   For a prime ℓ the two forms are equivalent (2(N+1) is even), so no mathematical change is involved; the repair is fidelity to the cited statement.

   Repair: at the six locations replace "ℓ>2(N+1)" and "ℓ>2(n₀+1)" by "ℓ≥2(N+1)" and "ℓ≥2(n₀+1)" and cite ltxzz-published line 6408 and line 6746 beside the arXiv locators. Keep "ℓ>4n" in L1.

2. **F02** (P3) Bare "§" references to ltxzz sections collide with this roadmap's own section numbers

   Location: `packages/SelmerIwasawaCohomologyPartII/README.md:303` ("all auxiliary CM-moduli data of §§3.5/5.1"), `:325` ("isogeny correspondence S←π B→ι M of §4.3"), `:345` ("the link fibre projective bundles of §5.5"), `:632` ("CM-moduli and uniformization data of §§5.1/5.10"), `:676` ("special subcategory of §5.10").

   Claim: these refer to ltxzz §§3.5, 4.3, 5.1, 5.5, 5.10.

   Witness: this roadmap has its own §3.5 (even singular comparison, line 488), §4.3 (projected Abel–Jacobi map, line 567), §5.1 (first-reciprocity datum, line 630) and §5.5 (first explicit reciprocity law, line 731); line 345 would then be a forward reference from §2.3 to §5.5, and line 303 would make Datum 2.1 depend on Datum 5.1, which itself needs §2.1 (line 643). Every other source reference in the file is prefixed "ltxzz".

   Repair: write "ltxzz §§3.5/5.1", "ltxzz §4.3", "ltxzz §5.5", "ltxzz §§5.1/5.10", "ltxzz §5.10" at the five locations.

3. **F03** (P3) Supplier subsection cited under a name that does not exist at the supplier's head

   Location: `packages/SelmerIwasawaCohomologyPartII/README.md:117` and `:579` ("AG2.1b (Weight separation into the middle degree; The multiplicity of archimedean packets)").

   Claim: AutomorphicGaloisRepresentationsPartII Layer AG2.1b has a subsection "The multiplicity of archimedean packets".

   Witness: at the supplier's current head, Layer AG2.1b's subsections are "Weight separation into the middle degree" and "The archimedean packet multiplicity" (`TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md`, Layer AG2.1b headings). `design/plan.json` already uses the correct name in the `diagonal-concentration` gap.

   Repair: replace "The multiplicity of archimedean packets" by "The archimedean packet multiplicity" at lines 117 and 579.

4. **F04** (P3) Two pinned-convention Checks are statable at the pins and have no Lean test

   Location: `packages/SelmerIwasawaCohomologyPartII/README.md:44` (satake_reflect_sign) and `:51` (cochain_sign); `packages/SelmerIwasawaCohomologyPartII/Suggested.lean` has no example for either.

   Claim: the reciprocity sign "P = (−1)^N • Polynomial.reflect N P" (line 60) and the coboundary sign "g·m−m" (line 67) are pinned by these Checks.

   Witness: `Polynomial.reflect` and `coeff_reflect` exist at the Mathlib pin (`Mathlib/Algebra/Polynomial/Reverse.lean`, line 95) and `TauCeti.ContCohomology.d0` at the Tau Ceti pin (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`, line 172); both Checks compute a concrete value on these carriers. SmoothRepresentationsOfLocalGroups SR.4.4 already carries the two reflect identities as tests ("Both identities are tests"), so the README Check at line 44 duplicates a supplier test without saying so.

   Repair: either add two proved examples to Suggested.lean (reflect 1 (X−1) = −(X−1) and reflect 2 (X²−3X+1) = X²−3X+1 over ℤ; d0 of 1 under the sign action of a two-element group on ℤ evaluates to −2 at the nontrivial element, with `import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`), or replace the line-44 Check by an explicit citation of the SR.4.4 tests and add only the d0 example.

5. **F05** (P3) Suggested.lean has never been elaborated; one example conjunct is unlikely to close as written

   Location: `packages/SelmerIwasawaCohomologyPartII/Suggested.lean:88-93` (second example, conjunct "(fun _ => (1 : ZMod 2)) … = 0", proof `norm_num [definiteDiagonalPeriod, Fintype.sum_bool]`).

   Claim: both examples are proved.

   Witness: the package and both repair reports record that the file was not compiled (`reports/PKG-SelmerIwasawaCohomologyPartII.md` line 141: "compilation was not run"). After `Fintype.sum_bool` the conjunct becomes `(1 : ZMod 2) + 1 = 0`; `norm_num` evaluates `1 + 1` to the numeral `2` but has no extension deciding `(2 : ZMod 2) = 0`, and the default simp set has no lemma rewriting a numeral literal to zero in `ZMod n` (`ZMod.natCast_self` matches a `Nat.cast`, not the literal). The six `sorry`'d theorems and the first example are true as typed (checked by hand: `Finset.sum_add_distrib`, `Finset.mul_sum`, `map_sum`, `Equiv.sum_comp`, `Finset.sum_fiberwise`, `Finset.exists_ne_zero_of_sum_ne_zero`).

   Repair: elaborate the file once with the build gate; if the ZMod conjunct fails, split the example and prove that conjunct by `simp [definiteDiagonalPeriod, Fintype.sum_bool]` followed by `decide` (ZMod 2 has decidable equality), leaving the ℤ conjuncts as they are.

6. **F06** (P3) Process narrative in the References section

   Location: `packages/SelmerIwasawaCohomologyPartII/README.md:970` ("The source manifest identifies the legal versions and hashes. Mathematical statements here are paraphrases, not transcriptions of source passages.").

   Claim: none; the sentences describe the sourcing procedure.

   Witness: the repository rules require timeless roadmaps with no reference to the process (content `README.md`, "Roadmaps are timeless"); the manifest and its hashes are tooling artefacts, not mathematics.

   Repair: delete line 970.

7. **F07** (P3) Ownership sentence names a supplier section that has no such content

   Location: `packages/SelmerIwasawaCohomologyPartII/README.md:17` ("General hermitian classification belongs to AdelicAlgebraicGroups §4.1 with its prescribed-invariant extension contract") and `:235` ("§4.1; Extension: hermitian local-global classification").

   Claim: AdelicAlgebraicGroups §4.1 owns general hermitian classification.

   Witness: at the supplier's head, §4.1 is "Weak approximation and torsors" (`TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, heading at its line 3875) and the file mentions hermitian forms only in two unrelated examples; the only owner of the Hasse classification is the declared gap `hermitian-local-global`, whose plan entry says "new obligation".

   Repair: at line 17 write "General hermitian classification is the declared gap hermitian-local-global on AdelicAlgebraicGroups (a new obligation extending its §4.1 local-global machinery)", and at line 235 drop "§4.1;" or write "new obligation after §4.1".

8. **F08** (P3) The one definition statable at the pins has no Lean mirror and its Checks no examples

   Location: `packages/SelmerIwasawaCohomologyPartII/README.md:249` (§1.5 special inertness) and `:264-266` (its three Checks); `Suggested.lean` has no Layer 1 declaration.

   Claim: §1.5 defines special inertness as a predicate on finite places of F⁺ by inertness in F, an odd rational prime unramified in F, and F⁺ᵥ ≃ ℚp.

   Witness: every carrier exists at the Mathlib pin: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean`, line 69), prime ideals of `𝓞 K`, `Ideal.map`, `Ideal.absNorm`, `Ideal.ramificationIdx`/`Ideal.inertiaDeg` and `Algebra.IsUnramifiedAt` (`Mathlib/RingTheory/Unramified/Locus.lean`, line 45). "Inert in F" is primality of the extended ideal, and "F⁺ᵥ ≃ ℚp" is absolute norm p with p unramified at v. Only very special inertness (the reflexive closure of PELModuli §M0.26) is unavailable at the pins. The README/Lean agreement rule asks for an example for each statable Check.

   Repair: add a real-bodied predicate for special inertness on prime ideals of the ring of integers of F⁺ relative to a CM extension F, state the ℚ(i) controls (3 special inert; 5 and 2 not) as proved examples or, if the Gaussian-integer computation is not immediate, as named `sorry`'d theorem targets listed under §1.5; keep very special inertness in the README.

No P1 or P2 finding survived verification. Eight P3 repairs follow, each with a witness.

## Verified sound

- Declarations read: 7 (`definiteDiagonalPeriod`, `_add`, `_smul`, `_map`, `_reindex`, `_fiber`, `_exists_ne_zero`) plus 2 examples; all six theorem statements are true at the stated generality (additive commutative monoid; semiring with left regular action), binders are explicit, there is no sorry'd data, no `set_option`, `theorem` throughout, a single `import Mathlib`, and every Lean name appears in README §5.1.
- Targets read: all 40 (1.5–8.5), with every API bullet and Check. Each target has a locator. Internal build order was checked target by target: no forward reference, no cycle. The pull request touches only the package folder (`git diff --stat origin/main...HEAD`).
- Dependency direction: the gate returned `depcheck: 7 roadmaps, 63 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every named supplier is earlier in `merge-order/ORDER.txt` (SelmerIwasawaCohomologyPartII is line 141; its latest supplier, IgusaVarietiesAndTorsionConcentration, is line 140).
- Locators verified against the cached texts (73): ltxzz Definitions 1.1.3, 2.2.4–2.2.5, 2.3.2, 3.1.5, 6.3.4, 8.1.1 and D.1.1/D.2.1; Hypothesis 3.2.10 and Proposition 3.2.11; Lemmas 2.2.7, 2.3.3–2.3.5, 2.4.5, 2.6.4, 2.7.1, 4.2.4, 5.2.7, 5.6.2, 5.9.2–5.9.3 (including the odd and even matrices and the N=2 matrix), 5.11.2–5.11.3, 6.1.9–6.1.11, 6.2.2, 6.4.2, 7.2.5 and Remark 7.2.6, 7.3.3, 8.1.3–8.1.7; Propositions 2.4.6, 2.6.6–2.6.7, 3.2.4, 7.2.7, B.3.5, B.4.3, D.2.3; Constructions 4.6.1, 5.8.3, 5.9.1, 5.9.4, 5.11.4, 5.11.7 and Remarks 5.9.5, 5.11.8; Theorems 1.1.5, 1.1.9, 4.3.5, 4.6.2, 5.2.5, 5.3.4, 5.4.4, 5.7.7–5.7.8, 5.11.5, 6.2.3, 6.3.5, 7.2.8, 7.3.4, 8.2.2, 8.3.2; equations (5.27), (5.28), (8.4)–(8.5), (8.8), (8.13)–(8.14) and footnote 34; Remarks 1.1.10, 5.2.8, 8.3.3, Conjecture 8.3.1, Corollaries 7.2.9, 8.2.3, 8.2.5; ltxzz-published Definitions 3.3.1–3.3.4, 8.1.1, Remarks 3.3.3, 8.1.2, Corollary 5.3.5 (N ⩾ 2, so §2.3's unconditional normal-bundle statement is at the source's generality); ltxzz-deformation Theorem 3.6.3, Corollary 4.1.2, Theorem 4.2.6; liu-tian §4.1, Assumption 4.1, Definition 4.5, Theorem 4.7; stacks-blowup 0B3V, 0806, 080D–080E; stacks-projective 02TW, 02TX, 02U1.
- Checks tested by hand (34): satake_reflect_sign; hecke_rank2 (I° = 3·(3+1/3+2) = 16, (q+1)R°−I° = 0 by Proposition B.3.5); hecke_rank3 (T° = 9·(2+1/2−2) = 9/2, I° = 9·(2+1/2+3+1/3) = 105/2 by Proposition B.4.3); twist_rank_two_three; frobenius_inert_three; polarization_square ((I,−1)c squared is (−I,1) under c(g,µ)c = (µ ᵗg⁻¹,µ)); torus_two_point_control; cochain_sign; Special Qi 3/split/residue degree; Admissible n2 twist/scalar identity/basis; Level positive exponent/empty lr; Basic N2/N3; Strata node/normal sign (deg O(4) on a plane quartic = 16); Incidence sign/scalar/parity (the odd matrix sends (p+1,−1,0) to (p+1,(p+1)²,−T•°), killed by (0,T•°,(p+1)²)); Singular invariants not coinvariants; Product dimension/exception/quartic section (η² + (a+b)η + ab = 0 from (37.1.1) applied to (L₀⊕L₁)∨; [D₀] = η+b, [D₁] = η+a, D₀·D₁ = 0; N_{E/Q°°} = O(−1) and N_{E/Q••} = O(−1)⊗ρ*(L₀⊗L₁)∨ via the chart identification t = u/x); Product centre transform/chart sections (x=0, t=0, v=0 and s=0 are Q°°, Q•°, Q••, Q°• as stated); Perfect pairing exponent; Detection rank two/primitive kernel (D = [[π,1],[0,π]], C = [[π,−1],[0,π]], t = (−1,π)); Rigid special simple pair ({3⁻²,1} = {5,1} in 𝔽₁₁ equals {p^{−N},p^{−N+2}}, consistent with Proposition 3.2.4(2) and Definition 6.3.4(2)); Rigid special double pair; First tensor not factors; the five period controls (values 1, 2, 0, 0, 0).
- Adversarial instances: n = 2 (ranks 2, 3; tensor rank 6, twist 2, weight −1, graph codimension 2, product dimension 3); N = 2 (zero link pair, N=2 matrix, link of dimension 0); N = 3 (relative dimension 2, DL• fibre of dimension 1); p = 3 at an inert degree-one place (residue size 9); ℓ = 3 fails L1; m = 0 excluded; Σ⁺lr = ∅ allowed; empty source for the period; 𝔽₂ coefficients; ramified Oλ; F⁺ = ℚ (H(N) retained for N ≥ 4, §8.4 valid for n = 2 through N ≤ 3 of Proposition 3.2.11; families 7.4A/B require F⁺ ≠ ℚ exactly as Lemmas 8.1.3 and 8.1.4(c)); exponent bookkeeping of §§7.3, 8.1, 8.2 (one place: m−m₀−c−mper−mlat; two places: m−m₀−mper−2c−mlat, matching the published 4r_R loss when c = 𝔣(2)d_R).
- Sibling citations checked (19 roadmaps, 61 sections or names): SelmerIwasawaCohomology §§0.12–0.13, 2.6–2.7, 4.8–4.11, 4.24–4.25 and the seven cited names; EulerSystemsAndKolyvaginSystems §§1.2, 1.3, 1.6, 1.11, 1.15, 4.4 with `expAt`, `ordAt`, `reducibilityDepth`, `θ_S`, `scaled_inverse`, condition (v) and 𝔣(1)=1, 𝔣(2)=4; SmoothRepresentationsOfLocalGroups SR.4.1, SR.4.4 with the five named items and the same reciprocity convention; LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20 with all thirteen names; GlobalGaloisDeformations §§3.3–3.8, 5.2 and `IsCyclotomicAbsIrred` (rank two); ArithmeticGaloisDuality §§R02.4.2, R02.4.3, D7.4, D7.7; ShimuraVarieties §§5.1, 6.7; PELModuli §§M0.25–M0.26 (intersection form of the reflexive closure), M2.8, M2.12–M2.14, M4.3, M4.5–M4.9 and the seven names (torusTrace never divides by |Γ|); EndoscopicTransferAndUnitaryTraceComparison §§9.1, 11.2–11.4, 12.12–12.15, 13.1, 13.5–13.9 and the S_FL convention the README attributes to §§13.7/13.9; AutomorphicGaloisRepresentationsPartII AG2.1b, AG2.2, AG2.5, AG2.6, AG2.7 and all twelve subsection names except the one in R03; IgusaVarietiesAndTorsionConcentration §IG.7.2 (F⁺ ≠ ℚ retained in `of_decomposedGeneric`); LefschetzPencilsAndVanishingCycles §§7a.7–7a.9 (ℚ_ℓ graded comparison, nonproper abutment as the README says); MotivesAndAlgebraicCycles §§7.16–7.18; SchemeAndStackFoundations §§0.3, 2.15 (`hochschildSerre_galois_covering`), 5.4 (`projectiveBundle`), 5.5; EtaleCohomologyFoundations §§F.0.3, F.2.1–F.2.3, F.2.6, F.2.7, F.3a, F.4.0–F.4.6, 0.9–0.11, F.6, F.7; StableReduction Layer 4 (blowups); Chebotarev Layers 1, 2, 10; ProfiniteCohomology Layers 1–3, 5–8, 10. ReductiveGroupsPartII, ShimuraCompactifications, HilbertModularVarietiesAndShimuraCurves and ArithmeticGaloisRepresentations carry no section cited as existing, consistent with their gaps. The six open sibling pull requests (K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers, ArithmeticDynamics) contain no overlapping object.
- Pinned declarations grepped at the pins (17): `Polynomial.eval`, `eval_X`, `derivative`, `derivative_X`, `reflect`, `coeff_reflect`, `Module.torsion_by_prime_power_decomposition`, `Module.free_iff_isTorsionFree`, `TopRep.homogeneousCochains`, `continuousCohomology`, `ContinuousCohomology.cochainsMap`, `map`, `map_id`, `map_comp`, `reesAlgebra`, `mem_reesAlgebra_iff`; Tau Ceti `d0`, `H1`, `H1pi`, `subsingleton_H1_of_subsingleton`, `subsingleton_H1_of_subsingleton_coefficients`, `nsmul_H1_eq_zero`, `affineBlowupι`, `opensRange_affineBlowupι`, `iSup_opensRange_affineBlowupι`, `affineBlowupι_toSpecZero`. All exist in the named files.
- Declared gaps: all 21 slugs appear identically in `design/plan.json` and under the README's supplier contracts, each with a named supplier and a `needs` sentence stating hypotheses; none asks for something already provided (checked against the supplier heads above). Not raised, per the brief.
- Headlines: no headline theorem is easy on existing carriers (unitary Shimura models, nearby cycles, Galois representations and Selmer groups are absent at the pins); the file does not force one. The finite period is a real-bodied specialisation of finite summation, not a stand-in.
- Policy: no pull-request number, no `lemma`, no `set_option`, no computational algorithm; `metadata.toml` and `sources.toml` parse; the sources are all open-repository or institutional copies.

## Not verifiable

- Lean elaboration of `Suggested.lean`: the brief supplies no Lean command, so the file was checked statically only (see R05).
- ltxzz-deformation Theorem 3.6.3 (D1): its extraction prints the bound as "ℓ > 2(N+1)" and no second rendering is available to decide ⩾ versus >; immaterial for prime ℓ (R01).
- SmoothRepresentationsOfLocalGroups and IntegralHeckeAndGaloisDeterminants were read from their pull-request branches; those pull requests are recorded as merged into the ReductiveGroupsPartII chain branch rather than into main, so their current text may sit at the head of that chain. The cited sections and names were present on the branches read.
- The repair reports' claim that LefschetzPencilsAndVanishingCycles §7a.7 states only the ℚ_ℓ graded comparison was confirmed on the branch head; whether the supplier later adds the integral complex is outside this pass.

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: weight, twist, Frobenius, hγ, coboundary | n=2; inert p=3; γ=(I,−1)c; sign action on ℤ | −1; 9 and 1/9; γ²=(−I,1); −2 | none |
| Reciprocity convention P=(−1)^N•reflect N P | N=1 (T−1), N=2 (T²−3T+1) | matches (−T)^N P(T⁻¹) of Definition 3.1.5 | R04 (Lean test) |
| Even/odd Hecke formulas (SR.4.4) | r=1, q=3, a=3 / a=2 | I°=16, (q+1)R°−I°=0; T°=9/2, I°=105/2 | none |
| §1.5 special and very special inert | ℚ(i): 3, 5, 2; degree-two completion | 3 accepted; 5, 2, degree-two rejected; "equivalently" valid since F⁺rflx/F⁺ is Galois | R08 (mirror) |
| §1.6 L1–L7 | ℓ=3; ξ=±1; identity scalar; basis change | L1 fails at ℓ≤4n; witnesses excluded; invariance by Remark 8.1.2 footnote | R01 (fidelity only) |
| §2.1 datum | m=0; Σ⁺lr=∅; reduction λᵐ→λᵃ | m≥1; empty allowed; n_a = n_m + λᵃ so P6 reduces | none |
| §2.2–2.3 fibres, codimensions, normal bundles | N=2,3; p=3 quartic | dims ⌊(N−1)/2⌋, ⌊N/2⌋; O(4) degree 16, dual −16; Corollary 5.3.5 is N⩾2 | none |
| §2.4 link cohomology, counts, excess bundle | ⌊N/2⌋−j=1; ℓ | p+1 | p+1 points, ℙ⁰; isomorphism needs the unit | none |
| §2.5 E₁, d₁, ∇₀/∇₁, matrices | N=2,3,4; p=3 | matches Lemmas 5.9.2(2), 5.9.3(7); odd boundary killed | none |
| §2.6 blowup, exceptional ℙ¹-bundle, Chern relations | chart xy=p, uv=p; n=2, p=3 | components, sections, normals and η-relations consistent; σ!j!ρ*=0 | none |
| §3.1–3.7 even/odd theorems | N=2,3; omit H(N), A6.1.4 | hypothesis lists equal Theorems 6.2.3, 6.3.5, Lemma 8.1.7 | R01 (fidelity only) |
| §4.1–4.6 diagonal cycle and regulator | n=2; non-Cartesian refinement; degree-2 cover | codimension n; trace multiplies by source degree | none |
| §5.1 datum and period | tensor vs factor specialness; S=∅; 𝔽₂ | PI7 independent; values 0, 0 | none |
| §5.2–5.6 first law | p=3, one graph point | (p+1)φ₀(I°)φ₁(T°)=4a₀a₁; units by PI2, PI4, PI5 | none |
| §6.1–6.4 second law | O/π²→O/π | exponent 2→1: inequality only, as Theorem 7.3.4 | none |
| §7.1–7.2 image lifting and detection | c=0; c≥k; D=[[π,1],[0,π]] | basis only at c=0; t=(−1,π) primitive, D₁t=0 | none |
| §7.3 annihilators and rigidity | N=2, p=3, λ|11; N=4, p=3, λ|19 | simple pair once; double pair fails; exponents m−mper−mlat and m−mper−c−mlat as (8.4), (8.13) | none |
| §7.4 families | F⁺=ℚ | excluded exactly as Lemmas 8.1.3, 8.1.4(c) | none |
| §8.1–8.4 rank theorems | n=2 over ℚ; n≥3 | H(2),H(3) from N≤3; H(n+1) needs F⁺≠ℚ for n≥3 | none |
| §8.5 Hilbert precursor | g odd; Assumption 4.1 clauses | matches liu-tian Theorem 4.7 | none |
| Lean theorems | empty S; torsion R; noncommutative semiring; S'≃S | all true as typed | none |
| Lean examples | ℤ values 1,2,0; signed Bool; ZMod 2 | values correct; ZMod proof unverified | R05 |

<!-- tauceti-roadmap-review {"agent": "claude", "head": "aac044513d90996ef86a7290447878cbf6093220", "job": "RT-SelmerIwasawaCohomologyPartII~1b", "model": "fable", "worker": "chris-f"} -->
