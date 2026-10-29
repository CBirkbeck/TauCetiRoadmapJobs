# Repair report: red-team round 1 of ScholzeFunctorAndModpCohomologyOfTheLubinTateTower

Two reviews were merged. The first five finding sections (F01 to F05) answer review r1a; the next nine (F01 to F09) answer review r1b. Review r1a F02 and review r1b F03 make the same claim and were settled once; both sections record it. In the text below, a-Fnn means review r1a finding Fnn and b-Fnn means review r1b finding Fnn.

## F01 (P1) — applied

Confirmed. CDN23 line 179: W_F acts on π₀ through ν_{W_F}; on W_K this is the norm, so Gal_K shifts heights by f(K/ℚ_p). Modulo the scalar shift 2, the two components split over K only when f is even. §5.4 Check: "two copies of the half-plane over K" → geometric two components, swap by f mod 2, values 1 (K=ℚ_p) and 2 (unramified quadratic). The same wording in §5.4 Examples and the second Worked example is repaired.

## F02 (P2) — applied

Confirmed (it is the same claim as b-F03). Witness: ⊕ℕk with trivial action is not admissible, but the action extends. §1.6: "admissibility is necessary" → admissibility is sufficient, not necessary; the extension is also stated for locally admissible π (DPS23 line 1337). Added a non-admissible positive-control Check. The negative control now also says that k[t,t⁻¹] is not locally admissible.

## F03 (P3) — applied

Confirmed. AutomorphicGaloisRepresentations §3.7 (at the head of its open pull request) excludes places above the coefficient prime. HilbertModularVarietiesAndShimuraCurves R18.3.29(c) (earlier in the order) gives the comparison at v|p when the residual representation is absolutely irreducible. Contract changed: §3.7 dropped, R18.3.29(c) added with the global-residual remark; it also holds under (C) because the supercuspidal component is discrete series. Edited: §4.2 route sentence, §4.2 *Needs:* line, Scope.

## F04 (P1) — applied

Confirmed. LE19 (fetched legally and added to `sources.toml`) Theorem 1.2 (LE19 line 49) gives a smooth irreducible π for GL₂ of the unramified cubic extension of ℚ_p, p>2. Its End contains 𝔽̄_p and pI₂ acts trivially on it (LE19 line 169). The supplier MP.0/scalar-extension assumes admissibility, and MP.1/cosocle-length works over ℚ_p. §5.1: the two Hom bullets and the I₁ Check now say F=ℚ_p; the definition and its closure properties stay general. Added Le's representation as a negative-control Check, and "admissible" to the MP contract.

## F05 (P3) — applied

Confirmed. Nrd(2)=4 and δ(4)=4≠1 on Ǧ₀, while δ is trivial on the norm group 5^ℤ(1+5ℤ₅) of ℚ₅(ζ₅). §5.3 Check: added the condition that δ∘Nrd is trivial on Ǧ_n. It holds automatically for n≥1 (Nrd(Ǧ_n) is pro-p), and at n=0 it means δ is unramified. The reviewer's witness is now a negative-control Check. No other twist statement uses Ǧ_n-invariants: §4.4 twists only Gal_K-invariants.

## F01 (P1) — applied

Confirmed. PadicHodgeTheory §2.7 says the local estimates only describe the imported theorem. AInfCohomology §AI.3.1 uses SCH13 Lemmas 5.3–5.8 only inside its proof route. Added the supplier gap `gap:local-almost-finite-image` to AInfCohomology §AI.3.1 (in `design/plan.json` gaps and in a new README contract with three Checks; SCH13 line 1432, SCH18 line 505). The §1.3 *Needs:* line now cites the gap in place of PadicHodgeTheory §2.7. The PadicHodgeTheory contract was also corrected to what §2.7 actually supplies.

## F02 (P2) — applied

Confirmed. HodgeTateAndCanonicalSubgroups §6.36 (order line 233, earlier than this roadmap at line 309) proves vanishing above dimension d for qcqs rigid spaces; ℙᵣ⁻¹_C and ℙ¹_C are qcqs. Removed `gap:analytic-topology-dimension` from plan.json and from the README. Added a §6.36 contract. Updated the *Needs:* of §§1.5 and 3.2, the Layer 1 Dependencies, and the ClassicalAdicEtaleCohomology sentence. The Lean target name of §6.36 is not backticked here.

## F03 (P2) — applied

The same claim as a-F02, settled once there. I also applied b's extension to locally admissible π: it is supported by DPS23 line 1337 and needs only the colimit law of §1.2 plus uniqueness and density. The twist statement in §1.6 now has its Gal_F-equivariance for locally admissible π (repairing the same pattern).

## F04 (P3) — applied

Confirmed. CompletedCohomologyAndLocalGlobalCompatibility §1.7(c)–(d) states admissibility and K_p-injectivity of the localised module (CDN23 Proposition 4.7(a)). §4.2 now imports these. What stays proved here: the choice of λ with S≠0, preservation under `Hom_{U_p^𝔭}(λ,−)_𝔪`, and block membership (CDN23 Proposition 4.8, line 1675). The §§1.5–1.7 contract and Scope were updated to match.

## F05 (P3) — applied

Confirmed. KTheoryLowDegrees §11.5 classifies extensions with finite and profinite kernels. §2.2 now reads "finite, or more generally profinite, abelian A", and Moore's locally compact generality is kept as the source locator only. The contract sentence now says finite and profinite kernels. (design/plan.json still has Moore's wording in its non-gap nodes, which this job may not edit.)

## F06 (P3) — applied

Confirmed. §2.2 *Needs:* now names the pinned Tau Ceti declarations `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` and `TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology` (in `ContCohomology/CohomologyComparison.lean`; degree two requires local compactness, which SL₂(ℚ_p) has). It also cites ProfiniteCohomology Layer 2. Both declarations were added to the Tau Ceti contract.

## F07 (P3) — applied

Confirmed: SCH18 line 717 is Lemma 3.12 (p. 17), and line 729 is in the proof of Lemma 3.13. In §0.1, "line 729" → "line 717".

## F08 (P3) — applied differently

Confirmed in substance: DPS23 Lemma 7.4 (line 1401) allows continuous δ, and π⊗δ∘det stays smooth. But b's suggested witness is wrong: an unramified character has open kernel O_Fˣ, so it is smooth. §1.6 now states the twist for 𝔪-adically continuous δ, with the smoothness argument and the extension of δ⁻¹ to Gal_F. A Check uses a correct non-smooth example: A=ℤ₅, δ=identity on ℤ₅ˣ, δ(5)=1, with scalars 2 and 3.

## F09 (P3) — applied

Confirmed: the exclusion list in §2.1 is by representations, not blocks. The module docstring now splits this item off: SL₂(ℚ_p)-vanishing lacks absolutely irreducible smooth mod-p GL₂(ℚ_p)-representations, the Steinberg representation and Ind_B^G α with their twist classes. The Ext/reductive item keeps the derived smooth category and the reductive carrier.

## Checks run

- `lake env lean packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/Suggested.lean`: exit 0. There are three `declaration uses sorry` warnings (lines 67, 94, 113) and no errors.
- Binder check: I ran `#check @name` on all four declarations in one scratch file. The elaborated types are identical to the previous record and to the README statements. Only the docstring changed, so no binder was lost and no signature changed.
- Dependency check output, exactly: `depcheck: 56 roadmaps, 667 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name was found missing.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| Level-zero Galois action on components (§5.4 Check) | K=ℚ_p; K=ℚ_{p²}; K ramified quadratic | f=1: swap, invariants dim 1; f=2: fixed, dim 2; f=1: swap, dim 1 | Matches the norm/valuation action at CDN23 line 179 |
| Gal_F-extension for locally admissible π (§1.6) | ⊕ₘk[t,t⁻¹]/(tᵐ−1); ⊕ℕk; k[t,t⁻¹] | orbits ≤ lcm(mᵢ): extends; singletons: extends; infinite orbit: not locally admissible (no finite t-stable subspace) | Theorem consistent with all three controls |
| Twist for continuous δ (§1.6) | A=ℤ₅, δ(u)=u, π=ℤ/5; A=k (Artinian) | δ⁻¹(1)∩ℤ₅ˣ={1}, not open; π⊗δ∘det has scalar 2 at t=2; over k continuous = smooth | Smoothness of π⊗δ∘det verified; Gal_F extension via profinite Aˣ |
| §5.1 Hom/cosocle over ℚ_p only | F=ℚ_p supersingular π: End=k′ finite; LE19 π over ℚ_{p³} | dim Hom(π,π)=[k′:k]<∞; End ⊇ 𝔽̄_p, so Hom is infinite | Restriction necessary and sufficient for the supplier hypotheses |
| §5.3 twist condition | n=0, δ=residue character, K=ℚ₅(ζ₅); n=1, same δ | δ(Nrd 2)=4≠1, excluded; Nrd(1+𝔪_D)⊂1+5ℤ₅, δ trivial there, allowed | Condition separates the cases |
| gap:local-almost-finite-image | U=∅; U=V the closed disc; U the disc of radius \|p\| in the unit disc | image 0; U=V not strict (Gauss point); strict, so the estimate applies | Hypotheses are those of SCH13 Lemma 5.6(ii) at C algebraically closed of characteristic 0 |
| HodgeTate §6.36 applied | ℙ¹_C (d=1), ℙᵣ⁻¹_C (d=r−1), r=1 point | H²_an=0; H^{>r−1}_an=0; d=0 gives H^{>0}=0 | qcqs hypothesis met in every use |
| R18.3.29(c) at the supercuspidal point | r̄ irreducible; r̄ a nonsplit reducible extension | global image ⊇ SL₂(k), so absolutely irreducible in both cases; local r̄ may be reducible | Residual hypothesis is global; (C) holds too |
| Moore with finite kernels | A=𝔽₃, E=ℚ₃; A=𝔽₂, E=ℚ₂ | Hom(μ₂,𝔽₃)=0; Hom(μ₂,𝔽₂)=𝔽₂ | Unchanged values, narrower kernel class is sufficient for every use |

## Notes for the maintainer

- New supplier gap `gap:local-almost-finite-image` on AInfCohomology §AI.3.1, and one gap removed (`analytic-topology-dimension`, now supplied by HodgeTateAndCanonicalSubgroups §6.36).
- New source LE19 (arXiv:1809.10247v3, certified open-repository) in `sources.toml`. The SCH13 locator was extended to Lemma 5.6, p. 31. The sources service reordered the `doi` keys of several entries without changing their values.
- No Lean name changed. Non-gap nodes of `design/plan.json` still say Moore's "separable locally compact" generality, cite "R19.5/kisin-hilbert-coefficient-prime", and use the arithmetic "two copies" wording. This job could not edit them; the README is authoritative.
- Ownership was checked against main, the board packages and the open pull-request heads through `roadmaps show/grep` for the supplier sections cited above. No new object is owned here.

## Gate repairs

- Report headings: the finding sections are headed with the reviews' own ids (`## F01 (P1) — applied`, …), first those of review r1a, then those of review r1b, as the opening paragraph says.
- TeX-style braces in the README: the §1.6 non-admissible Check now names the direct sum over m≥1 of k[t,t⁻¹]/(tᵐ−1) and "the O_Fˣ-invariants of π" in words, and the §5.1 negative control for general F names "the field with p³ elements". The mathematics is unchanged.
