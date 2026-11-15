# Review of EllipticCurveModularityTotallyReal (pull request #2185 at 97464eb)

**Verdict:** accepted

No findings. Incremental re-review of the 46 lines changed since `7df3ef6` (four reworded passages of
`TauCetiRoadmap/EllipticCurveModularityTotallyReal/README.md`; `Suggested.lean` and `metadata.toml`
unchanged), and of the pull request's title and description. The acceptance is conditional on the
three declared supplier gaps (`gap:totally-real-weight-two-lifting`,
`gap:totally-real-solvable-residual-cohomological-weight`, `gap:cm-elliptic-endomorphism-field`);
the change touches none of their `needs` sentences.

## Previous findings

- The review of `7df3ef6` had no findings; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Summary (README lines 8–13), reworded | K=ℚ, n=15 and n=303 | M=ℚ(μ₁₅) degree 8, L degree 4, [M:L]=2; n=303: L degree φ(303)/2=100, as the worked example; δ(c)=−1 gives det(c)=−1 | same content as at `7df3ef6` | none |
| Conventions: Hodge–Tate normalisation (lines 130–132), reworded | ε_ℓ of weight −1 against weight +1 | det H¹(E)=ε⁻¹ has weight 1=0+1; V_ℓ(E) weights {0,−1}, det ε weight −1; the opposite sign gives −1≠0+1 | holds | none |
| R17.5 contract, route paragraph (lines 338–341), reworded | conditions on F′/F old against new; inertia image ⟨diag(−1,1)⟩, p odd | five conditions each side: finite, soluble, totally real, linearly disjoint from the fixed field of ker r̄, unramified at every w above p; order-2 tame image fixed by unramified extensions, killed by a ramified quadratic one | same content; gap sentence unchanged | none |
| §1.5 lattice and reduction (lines 788–799), reworded | ℓ=3, n=15; ℓ=5, n=15; ℓ∤n | ℤ_ℓ[μ_n]²⊗O=O², rank 2 also for ℓ dividing n; mod 3: η̄=1 so χ̄=ψ̄; mod 5: ψ̄=1 so χ̄=η̄; chain W_η≡_p W_χ≡_3 W_ψ≡_p W_1 and W_η≡_3 W_1 follow | holds; "ℓ dividing n" still covers both statements | none |
| `realCyclotomic_isCMField` (§1.1), cited by the Summary | k=ℚ, n=3; k=ℚ(√5), n=5 | M=ℚ(ζ₃), L=ℚ, [M:L]=2; M=k(ζ₅)=ℚ(ζ₅), L=ℚ(√5)=k, [M:L]=2; elaborated type has k totally real, 2<n, both conjuncts | holds | none |

The rows of the previous review for the untouched statements stand as in the review of `7df3ef6`.

- Source locators checked against the text in the changed passages and next to them: 9 (LeHung26 line 86, Theorem 1.1, p.2; lines 114–118; line 151; line 234, p.6; lines 243 and 246–247; OpenAI26 line 547, p.13, and line 571, p.14; BLGG13II lines 129–145, p.3; FLHS15 line 404, p.9); all agree. The seeded sample's sections are not among the changed passages.
- Wording of the four reworded passages against LeHung26 lines 114–118 and 150–152, OpenAI26 lines 135–136 and 547–553, BLGG13II lines 129–133: longest shared runs are "modularity lifting theorems over totally real fields" (a standard name), "is unramified for each place w" (forced) and "over the CM field"; no sentence follows a source clause by clause.
- Cross-roadmap citation resolved at the open head: GL2AutomorphicRepresentationsAndTransfer R17.5.14 applies Langlands–Tunnell to get the parallel-weight-one form and leaves weight-two lifts as separate inputs, as the reworded sentence says. The 16 open suppliers of the README are the 16 of the description's dependency block.
- Gate at `97464eb`: every check passed (`source-material=0`, `outside-folder=0`, `build=0`). Dependency check: `depcheck: 242 roadmaps, 2246 edges, 0 problem(s)`. No change outside the folder.
- Elaboration of `Suggested.lean`: two `sorry` warnings and nothing else; the file is identical to `7df3ef6`, so the `#check` comparison and one-tactic probes of that review stand.
- Pull request text against the head: title, summary block and prose agree with it (a new roadmap folder with README, `Suggested.lean` and `metadata.toml`; 54 headings, two declarations; uniqueness, parallel weight two, trivial central character, all local factors, CM by quadratic induction; Layer 1 and the 3–5 switch over arbitrary number fields; consumers HilbertModularForms §11.3 and ModularityAndLanglandsExtensions). The rewording changes nothing the text describes.
- Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, EllipticCurveModularityWild3Adic; nothing shared (the covers, character systems and lattices are owned by the first and imported here by name and section; no other roadmap states the reflection twist, the descended systems or the totally real endpoint).
- Source independence: 4 passages compared with 3 sources (changed passages only), none shared; largest share LeHung26, 18 of 45 locators; contents not compared again, the change adds, removes and reorders no layer.

## Not verifiable

- The published numbering of BD14, BLGG12 and BLGG13II was not compared with the arXiv versions read; the README cites the arXiv versions.

## Source issues

- **Misprint** in LeHung26 at §3.1, sentence before Proposition 3.1, p.6: the source says the lifting proposition follows from Theorem 3 of Freitas–Le Hung–Siksek; it should be Theorem 2, the lifting theorem (Theorem 3 is the seed); affects nothing.
- **Misprint** in BLGG13II at proof of Theorem 3.1.1, p.3: the source says the image lies in the scalars of characteristic p times GL₂(𝔽₃); it should be the scalars of characteristic 3, the prime of that section; affects nothing.

## For the human reviewers

- **Scope.** LeHung26, the source with the largest share (18 of 45 locators), is a discussion draft of 7 October 2026, not refereed; its Theorem 1.1 (LeHung26 line 86) assumes inputs of OpenAI26, an unrefereed preprint (README, References).
- **Scope.** LeHung26 lines 147–149 state that its first draft, apart from the introduction, was generated by an AI system and then proofread and edited.
- **Licence.** LeHung26 is read from `hexagonmath.org` and OpenAI26 from a GitHub repository at a fixed revision (README, References); no licence statement was found in the LeHung26 text, and the status of neither host was settled here.
