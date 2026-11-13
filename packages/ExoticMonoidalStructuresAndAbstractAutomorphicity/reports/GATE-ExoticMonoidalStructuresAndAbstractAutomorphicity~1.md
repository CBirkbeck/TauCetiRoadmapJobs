# GATE-ExoticMonoidalStructuresAndAbstractAutomorphicity~1: answers to the human review of `aa1db54`

One review comment (CBirkbeck, 2026-11-13T11:30:30Z) was unanswered. It makes one finding (F01) with a five-part repair and two notes for the human reviewers, numbered H01–H08 below. Repairs are in commit `a3426464`, which changes only `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md`.

## H01 (CBirkbeck) — applied
The witness is correct: old Layers 0–9 follow Dor23 §§2.2, 2.1/2.3, 3.2–3.3, 3.4, 3.5, 3.6, 4.1–4.3, 4.4–4.5, 4.6 and Appendix A (contents at Dor23 lines 22–62), and old Layers 10–11 follow Dor21 Parts B and C (Dor21 lines 30–60). The README now has 13 layers grouped by consumers in the Needs graph (old → new table below), with section bodies unchanged except for internal § numbers; under the map the renumbered dependency graph is isomorphic to the old one, and no Needs line points to a later section (checked mechanically).

## H02 (CBirkbeck) — applied differently
Merging Layers 0–1 would join pieces with different consumers. Old §1.1 (threefold Bernstein balance, used by §§2.2, 3.2, 3.3) becomes §0.5 in the kernel layer; old §0.5 and §§1.2–1.4, used only by old §§1.5 and 5.4, become Layer 1, "Kirillov spectral identification of the kernel". The zeta unit is applied as Layer 12 (old §1.5 → §12.1, old §6.5 → §12.2), after the theta multiplication (§8.2) it needs; it needs nothing from old Layer 7.

## H03 (CBirkbeck) — applied differently
The three proposed units cannot be ordered as layers:
- Whittaker and coherence depend on each other: §2.5 (Whittaker) needs §2.3 (coherence), and §§4.4 and 5.2 (coherence) need §§3.4–3.5 (Whittaker).
- Spherical and coherence also depend on each other: §5.5 and Layer 9 (spherical) need §5.2 and §7.4, and §5.2 needs §4.3 (spherical).

The valid part is applied:
- Joint generation (old §4.4, used only by old §5.2) moves into the associator layer as §5.2.
- Layer 4 keeps §§4.1–4.3 as "Spherical generator, counit and comultiplication".
- Layer 3 is renamed "Whittaker image and the Bernstein centre".
- Layer 5 is "Exotic symmetric monoidal structure, trace and algebras".

## H04 (CBirkbeck) — disputed
Old §§5.3 and 8.3 have no consumer because they are end targets, like old §§6.5, 9.4 and 11.7: the `Suggested.lean` docstring lists both as not-statable headlines, and each needs its own construction (an Eilenberg–Watts coevaluation with both triangle identities; the isomorphism S⊛S(T\G) ≅ S(M₂(A))_Γ through Q), so they stay as targets in the layer of their objects, now §5.4 and §9.3. Old §5.4 (generic idempotent algebras, now §5.5) is also a listed headline, a local theorem needing only old §§1.4, 2.5 and 5.2; beside old §11.6 it would sit in a layer that works in A.

## H05 (CBirkbeck) — applied differently
- **Old Layer 10 → Layer 6.** Applied: it now sits directly after the associator, since it needs only §0.4, §2.5 and the associator (now §5.3).
- **Old §§6.3–6.4 → Layer 8.** Applied: the theta functional and theta multiplication join old Layer 7 as "Theta multiplication and the automorphic algebra".
- **Old §6.2 → §7.2.** Applied differently: S and S̃ use no theta, so they stay with the adelic product in Layer 7.
- **Old §§8.1–8.3 → Layer 9.** Applied differently: they join the torus category (old §11.1) as "Automorphic module categories for GL₂ and the torus". These two categories are the source and target of the induction and restriction functors in Layer 10 (old §§11.2–11.7). This avoids a single ten-section layer.

## H06 (CBirkbeck) — applied differently
§5.1 now also cites the refereed instance of its argument: "Dor23 applies the same argument to the spherical generator in the proof of Claim 3.58, pp. 36–37 (Dor23 line 1825; Dor23 line 1830)." No sources are added for the classical GL(2) inputs. They are not statements of this roadmap; they are imported by name in the Needs lines, and those roadmaps carry the sources:
- MetaplecticAutomorphicForms §§0.15–0.18, 1.1, 1.3–1.4 and 2.4b–2.7 (Weil representation) behind §§0.3–0.4;
- GL2AutomorphicRepresentationsAndTransfer §§R16.2.1 and R16.2.8 (Kirillov models) behind §1.4;
- AutomorphicLFunctionsAndLocalFactors AL.2–AL.3 (Godement–Jacquet and Jacquet–Langlands integrals) behind §§12.1–12.2.

The statements §§0.3, 0.4, 1.4, 12.1 and 12.2 are themselves Dor23 results (Proposition 2.12, Construction 2.13, Theorem 2.2, Proposition 2.5, Remark 4.11), cited at exact locators.

## H07 (CBirkbeck) — answered
- **Dor23** is refereed (Forum Math. Pi 11 (2023) e20).
- **Dor21** (arXiv:2102.11820) and **Dor20Z** (arXiv:2012.03068) each have one version (v1) and no journal reference on their arXiv abstract pages. The README cites exactly those v1 texts by line.
- **What rests on them:** Layers 6 and 10 (old 10–11) rest on Dor21. Layer 6's normalization module uses Dor20Z only through the AutomorphicLFunctionsAndLocalFactors gap:normalization-module-freeness contract.
- **Open questions:** the results are Dor's own construction, and no other text states them. Whether preprint-only results may plan Layers 6 and 10 is for the human reviewers to decide. Later literature building on the theory was not searched.

## H08 (CBirkbeck) — answered
The manifest settles Arm67 as `uncertified` (paywalled; cited by locator only), and the README says so in References and uses it once, in the FunctionFieldArithmetic gap:rational-theta-characteristic contract, through Dor23 Remark A.2, p. 50 (Dor23 line 2512, checked). Existence of a rational theta characteristic is a supplier contract, not a statement proved here, so no target of this roadmap depends on reading Arm67.

## Old → new numbering

| Old | New | Old | New | Old | New |
|---|---|---|---|---|---|
| 0.1–0.4 | 0.1–0.4 | 4.4 | 5.2 | 8.1–8.3 | 9.1–9.3 |
| 0.5 | 1.1 | 5.1 | 5.1 | 9.1–9.4 | 11.1–11.4 |
| 1.1 | 0.5 | 5.2–5.5 | 5.3–5.6 | 10.1–10.5 | 6.1–6.5 |
| 1.2–1.4 | 1.2–1.4 | 6.1–6.2 | 7.1–7.2 | 11.1 | 9.4 |
| 1.5 | 12.1 | 6.3–6.4 | 8.1–8.2 | 11.2–11.7 | 10.1–10.6 |
| 2.1–3.5 | unchanged | 6.5 | 12.2 | | |
| 4.1–4.3 | unchanged | 7.1–7.5 | 8.3–8.7 | | |

Every internal reference was renumbered: Needs lines, prose, Scope and ownership, supplier contracts, How to read the build, Worked examples and References. Supplier § numbers were left as they were. One ambiguous phrase in Scope and ownership, "the quotient of §6.1", meant FunctionFieldArithmetic §6.1 ("Adelic points of affine groups over a function field", checked at its open head); it now names that roadmap. Each layer's Dependencies paragraph was regenerated from the Needs lines of its sections.

No roadmap on main or in an open pull request cites this roadmap's section ids. The only hit for the roadmap's name is FunctionFieldArithmetic's downstream note, which cites FunctionFieldArithmetic's own sections. The gate reports dropped=0.

For the worker, who maintains `sources.toml`: its `cited_for` fields still use the old numbering. In the new numbering:
- Dor21: Layers 6 and 10
- Dor20Z: 6.1
- Dor23: Layers 0–5, 7–9, 11 and 12
- GH11: 5.1 (unchanged)
- Arm67: "Exact supplier contracts, rational-theta-characteristic; 11.1"

## Adversarial pass on added or changed text

No statement, hypothesis, Check or proof route changed. The rows below cover every sentence the repair adds.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.1 second locator (Dor23, proof of Claim 3.58) | Dor23 lines 1790, 1825–1830; page markers at lines 1766 (p. 36) and 1815 (p. 37) | Claim 3.58 begins on p. 36 (line 1790); the a² = a³ conclusion is on p. 37 (line 1829), and line 1830 names GH11 Theorem 3.1.2 | locator correct; it states the special case P = E, matching the README wording | added |
| Layer 7 example: 1 ∈ S̃ but 1 ∉ S | F = 𝔽₃(t); det: Γ\G → F×\A×, then degree | the degree map is onto ℤ (a degree-1 idele from places of degrees 3 and 2, as in Conventions); a compact set has finitely many degree values, while the support of 1 has all of ℤ | holds; agrees with the old §6.2 Check | added |
| Layer 7 example: unramified reference vector 1M₂(Ov)·1Ov× is fixed by w² | w² = −I acts as m ↦ −m (§0.4 Check) | 1M₂(Ov)(−m) = 1M₂(Ov)(m) because M₂(Ov) = −M₂(Ov) | holds | added (from the old Layer 6 example) |
| Layer 9 example: the trivial character of T(A) is an object of Modaut(T), with unit IT, not S(T) | χ ≡ 1; rational t = diag(2,1) over 𝔽₃(t) | χ(t) = 1 for every rational t, so χ descends; a rational t ≠ 1 translates the indicator of a small compact neighbourhood of 1 to a disjoint one, so S(T) does not descend | holds; agrees with the old §11.1 Checks | added |
| Layer 12 example: s−1/2 combined with the extra y factor gives s+1/2 | y = π (\|π\| = q⁻¹), s = 0; y ∈ O× | q^(1/2) · q⁻¹ = q^(−1/2) = \|π\|^(1/2); on y ∈ O× the weight is 1 | holds; the exponents differ by one, as in old §§1.5 and 6.5 Checks | added |
| Layer 0 intro: the balance is used by the product and the centre | Needs graph | consumers of §0.5 are §§1.4, 2.2, 3.2, 3.3 | holds | added |
| Layer 1 intro: consumers are §5.5 and Layer 12 | Needs graph | §1.4 is consumed by §§5.5 and 12.1; §§1.1–1.3 are consumed only inside Layer 1 | holds | added |
| Layer 6 intro: uses only the kernel, Whittaker trace and associator; Layer 10 globalizes it | Needs graph | internal needs {0.4, 2.5, 5.3}; §10.1 needs §6.5 and §10.2 needs §6.1 | holds | added |
| Layer 8 intro: the image of the Poincaré map is I | §8.5 | §8.5 states im(eA) = I | holds | reworded from the old Layer 7 intro |
| Layer 12 intro: equalities proved on a common convergence domain, then continued | §§12.1, 12.2 | both sections state exactly this order | holds | added |
| How to read the build | Needs graph | L11 needs §§8.6, 5.6, 7.1, 4.2, 5.1; L12 needs §§1.4, 8.2; L10 needs §§6.1, 6.5, 9.2, 9.4, 8.6, 5.5 | holds | rewritten |

## Lean check

`Suggested.lean` is unchanged. It declares no names (namespace only), so there is nothing to `#check`. Its one README reference, "README §5.1", still names the idempotent coherence theorem.

## Ownership, sources and untrusted text

- **Ownership:** no construction was added and no target moved between roadmaps, so no ownership search was needed.
- **Sources:** no text was fetched through the sources service, and `needs-references.toml` was not written. H07 used the public arXiv abstract pages of Dor21 and Dor20Z.
- **Untrusted text:** the review contained nothing instructing a change outside this job.

## Build and gate

- `lake build TauCetiRoadmap.ExoticMonoidalStructuresAndAbstractAutomorphicity.Suggested`: `✔ [8954/8954] Built TauCetiRoadmap.ExoticMonoidalStructuresAndAbstractAutomorphicity.Suggested (11s)`, `Build completed successfully (8954 jobs).`
- Gate: `gate ExoticMonoidalStructuresAndAbstractAutomorphicity: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction: `depcheck: 215 roadmaps, 1901 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
