# Review of GSp4NonregularModularityLifting (pull request #1817 at 449f216)

**Verdict:** accepted

Incremental re-review of 147 changed lines since 11b3de3. No finding. The acceptance is conditional on the 19 declared supplier contracts, which are unchanged.

## Previous findings

- R01 — repaired: `README.md` line 11 "…are stated by AlgebraicModularFormsAndSerreWeightsPartII §§3.1–3.7, 4.1–4.3, 5.2–5.7, 6.1, 6.3, 7.3–7.6, 8.2 and 8.6–8.7; §§1.1, 3.1–3.2, 4.1–4.2, 4.4 and 4.7 keep only their specializations"; supplier heading at line 49; general constructions cut; every affected `*Needs:*` line cites it.
- R02 — repaired: the description now reads "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its docstring names the carrier each one lacks"; the `sorry`-warning sentence is gone.
- R03 — repaired: the description now reads "Among the 19 named supplier contracts are … the Klingen level comparison with its no-newforms result, the paramodular newvector and the projective Satake comparison".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 integral p-operators, now imported (supplier §§5.6–5.7, 7.6) | weight (2,2); weight (4,2) | (2,2): pT₂=−p⁻¹+X₂+Z₂+pV₂, (p+p³)S=p⁻¹+p, sum X₂+Z₂+pV₂+p ≡ Z₂+X₂; (4,2): p²X₂+Z₂+p³V₂+p³ ≡ Z₂. Supplier formula p^(j−2)X₂+Z₂+p^(j+k−3)V₂+p^(j−1): same | agrees | none |
| §4.1 reduction T≡U+Z in weight (j,2) | j=2, j=4 | supplier T=U+p^(k−2)Z+p^(j+k−3)V: k=2 gives U+Z+p^(j−1)V, exponent 1 and 3, both ≥1 | agrees | none |
| §4.1 "literal double-coset sum has more than p+1 terms" unless diag(p,1) normalizes H | e=[H:H∩gHg⁻¹] | degree e(p+1) at supplier §5.2; H finite, so e=1 exactly when gHg⁻¹=H | agrees | none |
| §3.1 Hasse shift (supplier §§4.1–4.3) | p=5, m=3; p=3, ϖ=3, m=2; ϖ²=2, m=2 | s∈25ℤ, t=100r; 4³−1=63=9·7; (1+ϖ)²−1=2ϖ+ϖ²=ϖ³+ϖ², divisible by ϖ² | agrees | none |
| §3.2 secondary Hasse (supplier §§3.1–3.7; sampled) | p=2, 3, 5 | weight p²−1 = 3, 8, 24; root weight (p²−1)/2 = 3/2 (no root, matches "for odd p"), 4, 12; lengths of k[[t]]/t, /t² = 1, 2 | agrees with supplier and P20 Remark 6.4.1 | none |
| §4.2 theta operators (supplier §§8.2, 8.6–8.7) | p=5, 7; (j,k)=(4,2), (6,2); k=2, p+1 | p=7: (4,2)→(10,10), degree 0=4−2−2; (6,2): 7>5 holds, 6<6 fails; p=5: 4≤j<4 empty; k=2: 6, p∤6 for p>3; k=p+1: (p+1)(2p+1)≡1 | agrees | none |
| §4.7 neighbor reciprocity citation (supplier §§6.1, 6.3; sampled) | Γ̄=SL₂(ℤ); general neat level | both: Δ∨={pM⁻¹}, symmetric where Δ∨=Δ, reverse correspondence kept otherwise; (pM⁻¹)·Q=P from Q=M·P, det(pM⁻¹)=p | agrees | none |
| §0.4 levels against the supplier's standing level | q=3 full level; level at p | −I₄≡2I₄≠I₄ mod 3, neat; hyperspecial at p; U, P, H levels at primes ≠p: inside "neat tame level Kᵖ" of the supplier's Conventions | supplier applies | none |
| LocalGaloisDeformationRings contract (line 127) | §§2.7, 2.17, 2.25, 6.14, 6.26 at its open head | all five headings present with the cited content; `GSp4.MinimalAt`, `GSp4.SiegelOrdinary`: 0 occurrences there, so the prose citation is the right one | agrees | none |

The rows for the untouched statements stand as in the previous review, of `11b3de3`.

- Source locators checked against the text (changed passages): 12, all correct — P20 line 1345 (§6.3.2, p.30), line 1374 (§6.3.3, p.31), line 1652 (Remark 6.4.1, p.37); CG20 line 1434 (Definition 6.1), line 1910 and line 1936 (Lemma 7.5 and proof, p.849), Lemma 8.8 (p.860), Lemma 8.12 (p.864), line 2402 and line 2417 (Proposition 8.9, p.861), line 2773 and line 2793 (Definition 8.19, Lemma 8.20, p.872); Yam14 line 1246 and line 1327 (Propositions 3.10, 3.13, pp.23, 25).
- Seeded sample: §3.2 and §4.7 fall in changed passages and are rows above; §6.3 depends on §3.2 and is consistent with it (multiplier nonzero on every component; CG20 line 1939 uses weight p²−1). The other sampled targets are untouched.
- Cross-roadmap citations resolved: AlgebraicModularFormsAndSerreWeightsPartII §§3.1, 3.4, 3.6–3.8, 4.1–4.3, 5.2–5.7, 6.1, 6.3, 7.3, 7.6, 8.2, 8.6, 8.7 read at its open head (its scope paragraph names this roadmap's §§3.2, 4.1–4.2, 4.4, 4.7 as importers, the same split); LocalGaloisDeformationRings as above. No citation of FiniteFlatGroupsAndIntegralPadicHodgeTheory, of AbelianSchemesAndArithmeticModuli A4.3 or of ShimuraCompactifications 7.12 remains after their removal.
- Shape after the cuts: Checks per changed section §1.1: 3, §3.1: 3, §3.2: 4, §4.1: 3, §4.2: 5; no layer added, removed or reordered; declared contracts 19, unchanged.
- Gate: the worker's gate at 449f216 passes every check, build included. Dependency check re-run: `depcheck: 238 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean`: no output (0 declarations; the changed docstring bullet agrees with the supplier's own list of headlines). Outside-folder diff against `origin/main`: empty.
- Description read against the head: adds a new roadmap; the supplier paragraph (AlgebraicModularFormsAndSerreWeightsPartII owner, FiniteFlatGroupsAndIntegralPadicHodgeTheory no longer direct) matches lines 11 and 49; three endpoints, p≥5, p=2 and 4≤a<p−1 as before. Remark, no change asked: the generated `depends-on` block still lists #879 and not #1822, while the generated `merge-order` block has #1822.
- Overlap check: read AlgebraicModularFormsAndSerreWeightsPartII, PadicFamiliesPartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, AbelianSurfacesModularity, AutomorphicBundlesPartII, HigherHidaAndColemanTheory, IntegralHeckeAndGaloisDeterminants (the last six as read for the previous review; their lists are unchanged); secondary Hasse section, Hasse lifts, formal operators with Q₂, neighbor reciprocity, integral H⁰ actions of T and Q₂ and theta operators: owner AlgebraicModularFormsAndSerreWeightsPartII, cited here by section; nothing else shared.
- Source independence: changed passages only; 5 passages compared with 3 sources (CG20, P20, Yam14), none shared beyond formulas; largest share CG20, 38 of 77 distinct line locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Licence.** BCGP25 carries the Layer 10–11 headlines; `README.md` References (line 1634) cites it as arXiv:2502.20645v1 with no journal reference, so whether it is refereed was not settled here.
