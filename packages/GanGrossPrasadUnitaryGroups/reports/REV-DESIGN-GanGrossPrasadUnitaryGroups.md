<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/618#issuecomment-6326251032 -->
Review (codex) of 18fb589

Verdict: needs_changes

1. **F01** (P1) The distribution foundation has no owner

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:83`, “ownership is explicitly unassigned”; `packages/GanGrossPrasadUnitaryGroups/design/plan.json:2235`, `"supplier": "none"`.

   **Claim:** Targets 2.2 and 2.3 can consume `gap:distribution-gk` as their general distribution/descent/Gelfand–Kazhdan foundation.

   **Witness:** The plan names no supplier, while the prerequisites of both 2.2 and 2.3 require this gap. The review contract expressly classifies a `supplier: none` gap as unowned, even when its mathematical content is described.

   **Exact repair:** Assign this foundation to a named earlier owner. A concrete compatible assignment is an AutomorphicSpectralTheory local-distribution continuation: record that supplier and a requested extension section in the gap, mirror it in the README, and specify its general criterion and descent contracts. Keep the unitary relative symmetry and multiplicity proofs in 2.2–2.6. Do not turn the gap into an assumed multiplicity theorem.

2. **F02** (P1) The auxiliary isotropic subspace is not generally maximal

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:307`, “with maximal isotropic Y of rank r+1”; the same claim is in `packages/GanGrossPrasadUnitaryGroups/design/plan.json:376`.

   **Claim:** In 2.4, W′=V orthogonal-sum (−L) has a maximal isotropic subspace Y of rank r+1 and residual Levi U(W), for arbitrary relevant W.

   **Witness:** Take W=H and r=1. Then V=H² orthogonal-sum L and W′≅H³. Its Witt index is 3; the construction's rank-2 Y extends by an isotropic line in W. See also ggp line 2142 and line 2146.

   **Exact repair:** Replace “maximal isotropic” by the chosen totally isotropic subspace `Y=X⊕E(e+f)` of rank r+1, with W′=Y⊕W⊕Y∨. Keep the stated Levi of its stabilizer. Add W=H, r=1 as a Check distinguishing rank(Y)=2 from Witt index(W′)=3. Do not impose anisotropy of W to repair the statement.

3. **F03** (P1) The parabolic supplier is cited at the wrong layer

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:57`, “Layers 0, 3, 5 and 8 supply … flag parabolics”; the corresponding `*Needs:*` is at line 175.

   **Claim:** ReductiveGroups Layer 8 supplies the general parabolic/Levi interface used to construct the flag stabilizer in 1.2.

   **Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:631` places parabolic subgroup schemes and Levi decompositions in Layer 7. Layer 8 starts at line 1023 with classification/existence and relative reductive forms; the cited Layer 8 does not contain that flag-parabolic contract.

   **Exact repair:** Cite ReductiveGroups Layer 7's parabolic subgroup schemes/Levi decompositions for this input. Update the scope, supplier contract, 1.2 prerequisites, layer dependency list and plan supplier sections consistently. Retain Layer 8 only if a distinct consumed statement from it is identified. No new gap is needed for Layer 7's existing target.

4. **F04** (P2) The germ average needs its empty-orbit convention

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:491`, “let c_θ(x) be the average regular-nilpotent germ coefficient”; `packages/GanGrossPrasadUnitaryGroups/design/plan.json:732`.

   **Claim:** This average defines the integrand for every semisimple class in Γ, including non-quasi-split centralizers.

   **Witness:** For compact U(2)×U(1) at x=1, Γ includes x but the regular nilpotent orbit set is empty. Its cardinality is zero. The intended extension is explicitly zero in bp-arch line 4000; the averaging expression is at line 3994.

   **Exact repair:** Define c_θ(x)=0 when the regular nilpotent orbit set of g_x is empty, and use the average only when that finite set is nonempty. Cite bp-arch §4.5, Proposition 4.5.1(1)(i), p. 106. Add the compact U(2)×U(1), x=1 Check; keep all inner forms in the integral's domain.

5. **F05** (P2) The split local period API lacks its nonvanishing argument

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:837`, “α_v is nonzero iff the local Bessel model is nonzero, by 3.3 and C_v≠0”; plan API at `packages/GanGrossPrasadUnitaryGroups/design/plan.json:1420`.

   **Claim:** The equivalence follows from 3.3 for every quadratic étale local algebra allowed in 5.2.

   **Witness:** README line 827 permits E_v=F_v×F_v. Target 3.3 explicitly excludes split coefficients at line 463; its source also assumes a quadratic field extension (bp-arch line 137). Target 3.11 proves Hom nonvanishing, not nonvanishing of this particular integral.

   **Exact repair:** Keep the all-place API, but add a named split adjacent matrix-coefficient/Whittaker-period comparison before 5.2, with irreducible unitary tempered GL_(n+1)(F)×GL_n(F), the actual Haar measures and positive invariant pairings. Give its precise source and general Rankin–Selberg/Whittaker inputs, then use its nonzero test vectors for the split implication. The nonsplit implication can continue to use 3.3. Merely citing multiplicity one or m=1 does not identify a nonzero integral.

6. **F06** (P2) Several gap contracts combine independent, unspecified theorems

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/plan.json:2222`, “generic induction irreducibility and uniform seminorm estimates for the stated real reductive groups”; line 2395, “geometric Jacquet–Rallis trace comparison, Schwartz extensions, smooth transfer … fundamental lemmas”. README counterparts are at lines 77 and 103.

   **Claim:** These sentences are exact, minimal contracts which the intake can announce and a supplier can discharge independently.

   **Witness:** `archimedean-estimates` specifies neither the seminorm inequality nor the parameter/exceptional-set quantifiers. `relative-trace` combines global geometric comparison, finite transfer, dense infinite transfer, fundamental lemmas and local spectral comparison, which have different domains and hypotheses.

   **Exact repair:** Split these into separately named gaps for (a) globalization/tensor/dual comparison, (b) generic irreducibility in specified inducing families, (c) the quantified seminorm bounds, and (d) each of global geometric comparison, finite smooth transfer, dense archimedean transfer, fundamental lemmas and local relative-character comparison. For each give the actual groups, test spaces, field/rank range, normalization and quantified conclusion. Apply the same separation to the category-versus-Bernstein/mirabolic inputs in `local-categories`, the germ/Plancherel/Fourier-extension inputs in `local-harmonic-analysis`, and oscillator-model-versus-small-lift inputs in `real-theta`; the latter needs explicit signature/parameter conditions for nonzero lifts. Update `neededBy`, prerequisites and matching README slugs. The finding concerns precision and compound contracts, not the suppliers' present lack of implementations.

7. **F07** (P2) Supplier requests overlap ownership of the normalizer and character identities

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:115`, “all local tempered C_v regular nonzero”; line 95 requests “ordinary and twisted endoscopic character identities”, also requested at line 101. Plan counterparts are at lines 2355, 2265 and 2277.

   **Claim:** These are minimal missing supplier inputs, while 5.1 owns the relative normalizer and two distinct suppliers have separate roles in 3.6.

   **Witness:** README line 795 already assigns construction and regular nonvanishing of C_v to 5.1. Lines 95 and 101 both request identities for the actual enhanced packets, from ModularityAndLanglandsExtensions and EndoscopicTransferAndUnitaryTraceComparison respectively.

   **Exact repair:** Request the individual local L-factor regularity/nonvanishing and comparison identities from AutomorphicLFunctionsAndLocalFactors; derive the particular quotient C_v and its nonvanishing solely in 5.1. Assign actual-packet character identities to the enhanced-classification contract, and restrict the earlier endoscopy contract to transfer factors and general geometric/stable transfer inputs independent of that classification. State the single direction of this supply explicitly. This preserves 3.6's own relative Fourier calculation and avoids asking two owners to develop the same identity.

8. **F08** (P3) Internal references retain an earlier numbering

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:827`, “local factor of 5.2”; line 1113, “local product of 5.6”; line 1141, “product is the one of 5.6”; line 653, “Combine nonzero with 2.5.”

   **Claim:** These passages point to the preceding construction or bound used in their argument.

   **Witness:** The normalizer is 5.1; Layer 5 ends at 5.5; 2.5 is only an archimedean injection whereas 2.6 is the all-place multiplicity bound. The structured prerequisites already use 5.1, 5.5 and 2.6.

   **Exact repair:** Change these four references to 5.1, 5.5, 5.5 and 2.6 respectively, and mirror the first three in the plan's hypotheses/statements at lines 1395, 1962 and 2022. These are prose-reference defects, not evidence of a dependency cycle.

9. **F09** (P3) A conjectural-status note is counted as a mathematical Check

   **Location:** `packages/GanGrossPrasadUnitaryGroups/design/README.md:643`, “this definition is a proposition without an exported proof”; `packages/GanGrossPrasadUnitaryGroups/design/plan.json:1049`, `split_prediction_status`.

   **Claim:** The definition in 3.10 has three discriminating Checks.

   **Witness:** The third bullet describes proof status. It computes no model or predicate and also holds if the model uses the wrong character. Only the preceding two bullets test mathematical instances.

   **Exact repair:** Keep the status distinction in prose and replace this bullet with a mathematical test. For example, take nonarchimedean GL₃×GL₀ and a regular irreducible unitary principal series: the generic Whittaker model has dimension 1, whereas using the trivial N-character gives a six-dimensional unipotent-coinvariant dual. State the principal-series hypotheses explicitly and cite the supplier's Jacquet calculation. This tests the higher-codimension character, not the presence of a proof.

There are 9 findings: 3 P1, 4 P2 and 2 P3; 7 are blocking. The scope is repairable and does not re-plan an existing roadmap. There was no previous review to reconcile. The design, plan and author-recorded source manifest were left unchanged.

## Verified sound

The review covered all 39 numbered targets (9 definitions, 8 constructions, 22 theorem targets), their 79 named API items and 119 listed Checks, all 39 `*Needs:*` lines, seven layer dependency lists, all 15 gap registrations and all source-manifest entries. The 17 definition/construction blocks each have named APIs and at least three listed bullets; R09 distinguishes the numerical count from genuine mathematical coverage. Every numbered target has a hypotheses paragraph and a locator. The plan and README agree mathematically apart from the defects reported above; the three wording differences in 3.2, 3.7 and 3.10 do not change their content.

The library pins match the design: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Main-roadmap context was read at `3b455fc5eacfec059c240788ffcde9a5fe361b6f`. ReductiveGroups, GlobalNumberFields and Completed/RestrictedProducts were read for shape and ownership before preparing this report.

The scope retains bad finite places, split local algebras, both real line signs and rank-zero smaller spaces where the source allows them. The finite good-place restriction in 5.3 is a spherical evaluation used to construct an all-place product, not a good-primes-only endpoint. No computational algorithm, copied source passage, arbitrary-data substitute for an actual representation, hypothesis containing GGP.8, or attempt to prove a conjecture merely by naming it was found. Split archimedean higher-codimension nonvanishing and the general fixed-pair global conjecture remain propositions. All 11 sources used in the mathematical text were available in the supplied legal cache; no source or manifest edit was needed.

### Seeded source sample

All 15 sampled targets were checked at their stated theorem/section and page, including hypotheses and convention changes. “Supported” here describes the sampled mathematical statement; it does not discharge an explicit supplier gap or the separate API defects above. Source line references below identify passages without reproducing them.

| Target | Text and locator checked | Result |
| --- | --- | --- |
| 1.2 `besselDatum` | ggp §12, pp. 44–46; line 1593, line 1603, line 1624, line 1634 | Supported: flag radical, simple-coordinate sum, stabilizer and character. Empty flag gives diagonal U(W). |
| 1.3 `besselTransport` | ggp §12, p. 46, line 1637; §18, pp. 71–72, line 2503 | Supported: conjugacy of auxiliary choices, simultaneous scaling, and transported labels rather than frozen labels. |
| 2.6 `besselMultiplicity_le_one` | ggp Corollary 15.2, p. 63, line 2229; jsz-bessel Theorem A, pp. 1–2, line 24 and line 38 | Supported in characteristic zero, split/nonsplit, with the smooth admissible and continuous Casselman–Wallach categories. R02 affects the intermediate reduction's wording. |
| 3.6 `besselPacketFourierIdentity` | bp-refined §8.6 equation (1), pp. 71–72, line 2888; assumptions at line 2869 | The factor `(1+με)/2` and Fourier weights agree. The source's classification assumptions are explicitly required as proved supplier properties, not silently discarded. |
| 3.9 `besselTemperedPacket_real` | xue-real Theorem 2.2, p. 1000, line 213; Propositions 2.3–2.4 and Corollary 2.5, p. 1001, line 238, line 251, line 254; line-sign discussion p. 999, line 179 | Supported for irreducible tempered representations. The real theta route and transported opposite line sign are retained. The corollary statement is on p. 1001; its proof continues on p. 1002. |
| 3.10 `splitTemperedBesselPrediction` | ggp Conjecture 17.1 and discussion, p. 68, line 2386 and line 2394 | Correct proposition/singleton-packet specialization. No general split archimedean higher-codimension theorem inferred. R09 concerns its Check. |
| 3.11 `besselSplitGeneric_nonvanishing` | ggp Theorem 17.2(i)–(ii), p. 68, line 2398 | Correct range: adjacent ranks at all local places; general codimension at finite places; genericity retained. R08 corrects the final proof reference. |
| 4.4 `globalBesselConjecture` | ggp Conjecture 24.1, p. 90, line 3175 | Correct fixed-pair equivalence with every local model, central nonvanishing and multiplicity-one tempered cuspidal occurrence. |
| 5.2 `normalizedLocalBesselPeriod` | bpcz §1.1.6, p. 4, line 159; harris pp. 2–3, line 92 and line 111 | Integral and normalizing quotient supported; positive vector norm and nonzero C_v retained. R05 concerns the additional split nonzero-iff API, not the definition. |
| 5.4 `unitaryPeriod_rescaling` | bpcz pp. 4–5, line 160 and line 181; §2.3.2, p. 15, line 679 | Scaling follows directly from the displayed integrals. Pairing scales cancel, local Haar scales remain linear, global squared periods scale quadratically. |
| 5.5 `allPlaceBesselProduct` | bpcz equation (1.1.6.1), pp. 4–5, line 168 and line 193; §2.3.2–2.3.3, p. 15, line 688 and line 696 | Correct finite modification of the volume product. Global convergence factors are retained; no central Euler-product convergence is asserted. |
| 6.1 `globalWhittakerRelativePeriods` | bpcz §8.1.2 and Theorem 8.1.2.1, pp. 76–77, line 4122 and line 4152; §10.2.1, p. 90, line 4840 | RS argument s=0, Asai signs, leading coefficients, Whittaker norm and the two nonvanishing assertions agree. |
| 6.2 `unitaryGlobalRelativeCharacter` | bpcz §5.1.5/Proposition 5.1.5.1, p. 59, line 3040; §8.1.3, p. 78, line 4225; §10.3.1, p. 90, line 4873 | Correct actual-period basis pairing and local trace-integral realization. Convergence uses the stated Schwartz/nuclear contracts; no local positivity conjecture is assumed. |
| 6.3 `starGenericRelativeContribution` | bpcz Theorem 5.2.1.1, p. 59, line 3070; Theorem 8.1.4.1, p. 78, line 4245; equation (10.1.5.2), p. 88, line 4749 | Correct factor `2^(-dim a_P)`, including the full split centre. Distinctness/conjugate-dual exclusions agree with §4.3.2, line 2791. |
| 7.2 `unitaryStableGlobalNonvanishing` | bplzz Definition 1.5, p. 3, line 128; Theorem 1.8, p. 4, line 157 | Correct n>1 stable range, Hermitian condition and existential inner form; no split-supercuspidal-place assumption. n=1 is separately covered by 7.1. |

The only manifest locator marked “unverified” is `xue-bessel`, whose status is `waived` and from which the design infers no theorem. That waiver was respected; it was not reopened or entered as a missing reference.

### Adversarial mathematics pass

Each numbered row covers its statement, named APIs and listed Checks. The general exclusion checks were: the zero ring and inseparable quadratic algebra do not meet the standing hypotheses; characteristic 2 is excluded algebraically, whereas residue characteristic 2 and 3 is included analytically; characteristic-p local analytic fields are outside the source scope; q=1 is not a residue-field cardinality. No hidden DVR-only assumption or prime restriction was found. This is mathematical review, not Lean elaboration.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: form, rank and pairing | H basis e,f; split E rank 1; B(i,1); compact weights (1,0) against −1,0,1 | Mutual pairing 1; split group F×; linear-first value i; model dimensions 1,1,0 | None |
| Conventions: character, induction and Frobenius | ν(h)=i; GL₂ diag(a,1); two unramified eigenvalues | Period scales by i; δ=abs(a); normalized induction inserts square root; geometric Frobenius convention matches ggp line 272 | None |
| Conventions: signs and measures | Degrees (2,1), two nonnorm changes; constituent counts (1,1)/(2,1); Haar scales 2 and 1/2 | Even-side generator changes sign twice back to itself; coefficients 1/4 and 1/8; local scales cancel | None |
| 1.1 `RelevantHermitianPair` | W=0,V=line; H⊕line; positive definite real 3-space; field extension splitting E | Rank 2r+1 and non-example correct; transport retains actual form | None |
| 1.2 `besselDatum` | r=0,1,2; split GL₃; product of two simple-coordinate unipotents | b adds and U(W) fixes it; split character must be nontrivial on both factors | R03 supplier locator |
| 1.3 `besselTransport` | Identity/composite frames; h and −h; altered ψ with coordinates frozen | Conjugacy, not literal equality of characters, is needed; unitary stabilizer equations unchanged | None |
| 2.1 `besselModel` | H=1; U(1) weights 1 and −1 versus 1 and 1; finite-place intertwiners | Bilinear/smooth-dual direction correct; cardinal dimension precedes finrank | None |
| 2.2 `adjacentInvariantDistribution_symmetry` | Norm-one rank 1; upper unipotent GL₂ and transpose; noncommuting product | Conjugate-inverse is identity in rank 1; transpose reverses products | R01 foundation owner |
| 2.3 `besselMultiplicity_adjacent_le_one` | U(0)⊂U(1); ramified Q₂; GL₂(R)⊃GL₁(R) | No temperedness or compactness inadvertently used | R01 foundation owner |
| 2.4 `besselHom_nonarchimedean_reduction` | W=0,r=1; W=H,r=1; forbidden Bernstein constituent | Auxiliary rank correct, maximality false; exclusion and unnormalized induction essential | R02 |
| 2.5 `besselHom_archimedean_injection` | S=0; dim S=2; two functionals with different convergence half-planes | Choose a common half-plane for a finite basis, then an irreducible parameter; no uniform choice for full Hom asserted | R06 exact estimate contract |
| 2.6 `besselMultiplicity_le_one` | Whittaker W=0; real line reversal; compact weight 1 negative control | Finite-subspace argument proves bound without assuming finiteness; zero multiplicity allowed | R01–R02 supporting inputs |
| 2.7 `adjacentTemperedIntegral_converges` | Compact inverse weights; noncompact split GL₂×GL₁; trivial non-tempered pair | Compact integral equals Haar mass; trivial split integral diverges; temperedness necessary | R06 analytic precision |
| 3.1 `ggpEpsilonCharacter` | Empty W-parameter; two generators; multiplicity-two summand | Epsilon of zero is 1; generator uses one copy; central coordinate uses parity of multiplicity | None |
| 3.2 `ggpEnhancement_transport` | Norm t; nonnorm t; real t=−1; two changes | Determinant multiplier and simultaneous relabeling correct | None |
| 3.3 `temperedBesselForm` | H=1 of mass a; compact nonmatching weight; r>0; whole induced representation | Ordinary adjacent integral and regularized higher integral distinguished; induction claim is for whole induction | R06 analytic precision |
| 3.4 `besselGeometricMultiplicity` | x=1; W=C,x=−1; θ=0; compact U(2) centralizer; r=1 | Moving determinant is 1 at identity and 4 at −1. For r=1, D_G=64 and D_H=4 give Δ=4; H includes its unipotent radical. Empty germ average unspecified | R04 |
| 3.5 `besselLocalTraceFormula` | W=0; real indefinite group; proper-Levi induction | Whittaker germ and induced germ factor consistent; strong cuspidality/Schwartz hypotheses present | R04, R06 inputs |
| 3.6 `besselPacketFourierIdentity` | μ=ε and μ=−ε; order-two Fourier inversion | Total mass 1 or 0; nontrivial enhancement recovered from (1,−1) | R07 ownership |
| 3.7 `besselTemperedPacket_nonarchimedean` | W=0; ramified dyadic extension; wrong enhancement | One relevant complement, not an invented second zero-dimensional form; wrong enhancement has m=0 | None beyond preceding inputs |
| 3.8 `besselRealThetaReduction` | Self-dual count 1; counts (2,1); extra paired non-self-dual characters | Correct induction measure decreases by 2; no big-theta irreducibility premise | R06 lift hypotheses |
| 3.9 `besselTemperedPacket_real` | Compact interlacing (1,0) against −1/1; negative line; U(1) over W=0 | Multiplicities 1/0; line transport and rank-one enhancement consistent | None beyond preceding inputs |
| 3.10 `splitTemperedBesselPrediction` | GL₁×GL₀; adjacent GL₂×GL₁; archimedean r>0 | Definition retains conjectural range; third Check is only status | R09 |
| 3.11 `besselSplitGeneric_nonvanishing` | GL₂×GL₁ at all places; GL₄×GL₁ finite versus real | Source's genericity and finite/infinite range preserved | R08 proof reference |
| 4.1 `globalBesselPeriod` | r=0; ν(h)=i; character nontrivial on H(F) | Correct quotient condition and right-translation sign; cuspidal decay required | None |
| 4.2 `globalPeriod_localObstruction` | One zero local Hom; two local values 2,3; reference scaled by a | Zero obstruction, factor 6, reciprocal normalization correct; no converse from local models alone | None |
| 4.3 `unitaryTensorLRepresentation` | b=0; ranks (2,1); split local algebra | Dimensions 0 and 4; two conjugate-dual factors; finite-Galois rather than Weil connected subgroup has index two | None |
| 4.4 `globalBesselConjecture` | W=0; fixed wrong inner form; zero central value with local conditions retained | L-factor becomes 1 at zero rank; fixed-pair and central conditions both retained | None |
| 5.1 `unitaryPeriodNormalizer` | n=1; split finite place q≥2; zero global central value | Δ₂=L(1,η)L(2,1); local factors finite nonzero; global numerator may vanish | R07 supplier duplication |
| 5.2 `normalizedLocalBesselPeriod` | x=0; x↦cx; compact Haar mass a; split local pair | q excludes zero, scaling correct; cited nonzero-iff proof does not cover split case | R05, R08 |
| 5.3 `normalizedLocalBesselPeriod_spherical` | Unit-volume spherical vector; Haar doubled; bad/dyadic place | q equals actual compact volume; local integral remains defined at excluded spherical-evaluation places | None |
| 5.4 `unitaryPeriod_rescaling` | Pairing doubled; two Haar factors 2,1/2; global Haar doubled | q unchanged by pairing scale; product preserved; squared period multiplies by 4 globally | None |
| 5.5 `allPlaceBesselProduct` | One zero q; all-spherical tail; move volume-2 place into S | Finite modification is coherent and preserves zero; no inverse period or central Euler product | None |
| 6.1 `globalWhittakerRelativePeriods` | n=1 Asai signs; zero W; central L-value zero; S enlarged | Signs +/−, zero functional values and leading-factor replacements correct | R06 supplier precision |
| 6.2 `unitaryGlobalRelativeCharacter` | One-dimensional realization; zero P; orthogonal basis rescaled; convolution square | Norm denominator cancels basis scale; J positivity from global square; local trace is tempered | None |
| 6.3 `starGenericRelativeContribution` | Counts (1,1)/(2,1); repeated constituent; star-generic nonrelevant support | Factors 1/4 and 1/8; exclusions and zero contribution match source | None |
| 6.4 `isolatedUnitaryRelativeComparison` | Other-form transfers zero; several realizations on one form; no supercuspidal place | Sum remains over full base-change class; transfer detection is a separate requested input | R06 precision |
| 6.5 `temperedRelativeCharacterEulerIdentity` | Local obstruction; nontrivial κ_v with product 1; three constituents | Both sides vanish without division; product-one constants and inverse group order correct | None beyond supporting gaps |
| 7.1 `unitaryAdjacentGlobalNonvanishing` | n=1; endoscopic constituents; prescribed versus existential h | Source supports existential h without temperedness; no every-inner-form conclusion | None |
| 7.2 `unitaryStableGlobalNonvanishing` | Two cuspidal constituents total; n=1 boundary; bad places | Stable n>1 specialization correct; 7.1 separately handles n=1 | None |
| 7.3 `harrisRefinedUnitaryConjecture` | Counts (1,1)/(2,1); zero vector; zero mixed pairing | Coefficients correct; polarization clears norms and does not divide by a mixed pairing | R08 |
| 7.4 `ggp8UnitaryPeriodIdentity` | Zero central value; vector/pairing scales; Haar factors; endoscopic count | Displayed endpoint agrees with bpcz Theorem 1.1.6.1, including completed factors and Tamagawa normalization | R08; preceding input repairs |

### Duplication and supplier audit

The object search covered the pinned libraries, main active/completed roadmaps and the board's designs. It included sesquilinear forms and orthogonal complements, isometries/unitary groups, tensor representations and intertwiners, smooth/distribution carriers, Bessel/Whittaker models, epsilon factors, Langlands enhancements, relative characters, Rankin–Selberg/Asai factors, Tamagawa measures and spectral multipliers. Bessel special functions and Bessel's Hilbert-space inequality were not confused with Bessel models.

| Object | Existing owner inspected | Result |
| --- | --- | --- |
| Sesquilinear symmetry/nondegeneracy/orthogonal submodule | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:191`, `:595`; `Orthogonal.lean:48` | Native `LinearMap.IsSymm`, `LinearMap.Nondegenerate`, `Submodule.orthogonalBilin` exist. The relative pair is additional data, not a duplicate generic form. |
| Hermitian matrices and standard unitary group | `Mathlib/LinearAlgebra/SesquilinearForm/Star.lean:43`; `Mathlib/LinearAlgebra/UnitaryGroup.lean`; `TauCeti/Analysis/Matrix/HermitianSignature.lean:223` | Standard Gram matrix and real/complex signature APIs do not supply arbitrary quadratic-étale U(h), Witt theory and representability. No competing Bessel target found. |
| Tensor action, dual, equivariant linear maps | `Mathlib/RepresentationTheory/Basic.lean:618`, `:670`; `Intertwining.lean:36`, `:53` | Cited carriers and extensionality are present. Smooth dual/continuity are correctly separated from the algebraic dual. |
| Functor of points | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150` | Cited functor is present, with convolution on algebra homomorphisms and postcomposition maps. |
| Groups, parabolics, forms | `TauCetiRoadmap/ReductiveGroups/README.md:129`, `:234`, `:443`, `:631`; `RepresentationTheory/ClassicalGroups/README.md:310`; `OrthogonalSpinGroups/README.md:63` | Generic algebraic infrastructure and finite-dimensional branching remain with their owners. Parabolic citation drift is R03; orthogonal Witt theory is not Hermitian Witt theory. |
| Adeles and restricted products | `TauCetiRoadmap/GlobalNumberFields/README.md:412`, `:423`, `:433`, `:470`; `Completed/RestrictedProducts/README.md:248`, `:268`, `:305`, `:361` | Cited sections exist and stop before Tamagawa quotients. Landed `TauCeti.restrictedProductMap`, `TauCeti.awayDecomposition`, `TauCeti.rationalDiagonal` were also checked in `TauCeti/Topology/Algebra/RestrictedProduct/Map.lean:49`, `Away/Decomposition.lean:73`, `Diagonal.lean:62`. |
| General spectral isolation | `packages/AutomorphicSpectralTheoryPartII/design/README.md:3` and SM.0–SM.5 | Existing continuation owns this theory; the design does not reproduce its multiplier targets. The declared placement contract remains conditional. |
| Automorphic descent and arithmetic consumers | `packages/TwistedAutomorphicDescents/design/README.md:41`; SelmerIwasawaCohomologyPartII §8.1 | They do not supply this roadmap's GGP theorem. The period-witness premise and existential-inner-form limitation are correctly kept distinct. |
| Relative normalizer and actual-packet identities | Design 5.1 and the three contracts identified in R07 | Overlapping supplier requests need repair; no second library implementation was found. |

The seven specified new-roadmap heads were fetched read-only and searched by these objects, with scope and candidate hits inspected: QSeriesPartitionsAndMockModularForms `8fe91e0`, K3SurfacesAndSymplecticBoundedness `b82cbb7`, CohomologyComparisonsPartII `dd8d7e6`, ColemanIntegrationPartII `bd972d9`, QWittVectors `4605fbb`, ErdosProgressionPowers `72b6157`, ArithmeticDynamics `85e78c0`. No duplicate Bessel-model, relative-character or unitary period theorem was found. ArithmeticDynamics' large README required a blob read; the board copy differed and was not substituted for the head. No existing-roadmap revision was used as a supplier.

Every gap slug occurs both in the plan and in the README, and every `gap:` prerequisite resolves to a registered entry. The following records the precision/minimality review; an unavailable requested primary section is not itself a finding.

| Gap | Assessment |
| --- | --- |
| `hermitian-unitary` | Named earlier owner; genuine missing arbitrary-form geometry on native forms; retain nondegeneracy and characteristic ≠2 from the conventions. |
| `local-categories` | Named owner; category and separate Bernstein/mirabolic theorem contracts need separation and exact statements, R06. |
| `archimedean-estimates` | Named owner; quantified family and seminorm contracts missing, R06. |
| `distribution-gk` | Unowned, R01; the general criterion must remain separate from relative symmetry. |
| `local-harmonic-analysis` | Named owner; independent analytic contracts need separation, R06. |
| `enhanced-packets` | Actual correspondence and normalization are necessary; resolve actual-character ownership with ordinary endoscopy, R07. |
| `ordinary-endoscopy` | General transfer is necessary; actual-packet identity duplication, R07. |
| `real-theta` | Named owner; nonzero-lift hypotheses and distinct oscillator/parameter contracts need precision, R06. |
| `adelic-measures` | Named owner; explicit bpcz factorization and quotient-volume contract; neither arithmetic adeles nor restricted products supplies it. |
| `automorphic-realization` | Named owner; actual cusp realization, decay and tensor factorization are distinct from this roadmap's period construction. |
| `global-parameters` | Named owner; actual discrete parameters/base change/multiplicity are retained, without period nonvanishing as an input. |
| `l-factors` | General individual-factor assertions needed; remove the already-owned C_v conclusion, R07. |
| `automorphic-spectrum` | Named owner; canonical Eisenstein/truncation inputs are distinguished from the owned relative contribution 6.3. |
| `spectral-isolation` | Named earlier base owner and explicit continuation placement requirement; no duplicate isolation targets. |
| `relative-trace` | Named owner; five independent local/global contracts need separation and exact hypotheses, R06. |

All internal `target:` edges point to earlier targets; there is no target-order cycle. The prescribed gate was run first with candidate `packages/GanGrossPrasadUnitaryGroups/README.md`. It exited 1 because that package-stage file does not exist. The decisive error, with its machine-specific prefix omitted, was:

    FileNotFoundError: [Errno 2] No such file or directory: 'packages/GanGrossPrasadUnitaryGroups/README.md'

The same gate was then run with candidate `packages/GanGrossPrasadUnitaryGroups/design/README.md`, retaining `--only GanGrossPrasadUnitaryGroups` and `merge-order/ORDER.txt`. It exited 0 and printed:

    candidate: GanGrossPrasadUnitaryGroups is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
    depcheck: 8 roadmaps, 57 edges, 0 problem(s)

There was no UPWARD or CYCLE line. The absence of the candidate from ORDER is not a finding. No target was moved or source file changed during this review. The gate establishes ordering of recognized dependencies, not truth of the supplier-section claims; R03 is therefore compatible with its clean result.

The README has the requested title/summary, scope, conventions, supplier contracts, build explanation, seven ordered layers each ending with Examples and Dependencies, consumers and references. It uses mathematical prose and Unicode rather than LaTeX delimiters. The declared-gap explanations are kept distinct from assertions that the missing sections are available.

## Not verifiable

- **Lean elaboration:** not available (this lane does not elaborate; say so in the report). No `Suggested.lean` is among this design's submitted files, and no Lean command is authorized in this lane. Consequently import discipline, explicit Lean binders, proved example mirrors, and “sorry is the only warning” cannot yet be certified. No build was run or left running.
- **Waived text:** `xue-bessel` has no readable text in the supplied cache and retains its human waiver in `packages/GanGrossPrasadUnitaryGroups/sources.toml:32`. No target depends on it. No request to reopen that source was made.
- **Supplier implementations:** the declared requested extensions are contracts, not verified implemented theorems. Their future proofs and final section locators cannot be certified here. This is separate from the ownership, precision and overlap defects R01, R06 and R07.

All required non-waived source texts were readable. No new missing-reference request is needed. Acceptance is withheld for the seven blocking findings rather than for a missing source or an unavailable build.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "18fb589c8f500beede8b32c0d048fe5e72375a63", "job": "REV-DESIGN-GanGrossPrasadUnitaryGroups", "model": "gpt-6-astra", "worker": "chris-4"} -->
