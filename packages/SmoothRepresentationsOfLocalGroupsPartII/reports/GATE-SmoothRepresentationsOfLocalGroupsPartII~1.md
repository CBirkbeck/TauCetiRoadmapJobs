# GATE-SmoothRepresentationsOfLocalGroupsPartII~1: answers to human review of `b197d70`

Commit `01e8ddfa` (not pushed). Only `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md` changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied

§5.28, now §5.21 *explicit-regions* (README line 1378): the two E₆/E₇/E₈ tables (26 rows in BC1's order, 53 root vectors with BC1's labels 34–120; BC1 lines 2195–2254) are deleted. In their place: the counts 2, 8 and 16 alcoves with A₀ among them, cited to BC1 §3.2 Theorem (p. 17) and §§7.2.1–7.2.3 (pp. 46–47), and the bound the roadmap actually uses. That bound is ⟨β^∨, ν⟩ < 1 on U₀^g for the maximal-level coroots, given as simple-coroot coefficient vectors in the roadmap's own numbering: E₆ (1,1,2,2,2,1); E₇ (1,1,2,2,2,1,0), (1,1,2,2,1,1,1), (1,1,1,2,2,1,1), (0,1,1,2,2,2,1); E₈ (1,2,2,4,3,2,1,0), (1,2,2,3,3,2,1,1), (1,2,2,3,2,2,2,1), (1,1,2,3,3,2,2,1). The two table-based Checks are replaced by checks on the bound. An exact computation over BC1's own lists confirms the bound: every one of the 26 regions has a "<1" coroot lying above each maximal-level coroot in the root order, and some region has a ">1" coroot below a coroot of the next level. The old §§5.20–5.22 citations by BC1 label ("labels 46–49", "89–92") went with them.

## H02 (CBirkbeck) — applied differently

Applied where the arrangement was the source's and not forced:
- §§5.14–5.22 were CH26's per-type proof of Theorem 6.14 (§§6.3–6.11), with coordinates defined by pointing at its equations (6.19)–(6.29). They are replaced by two targets grouped by outcome, as §5.16 and its consumers use them: §5.14 *half-integral-origin-only* (PGL(n) with n odd, E₆, E₈, F₄, G₂) and §5.15 *half-integral-alcove-points* (PGL(n) with n even, SO(2n+1), PSp(2n), PSO(2n), E₇). The old §§5.23–5.28 are renumbered §§5.16–5.21, and every internal reference is updated: How to read, SRU.4.3, 5.4, 5.5, 5.8–5.11, 6.2, 6.4, 7.10, 7.11, 7.13 and the Layer 5 Dependencies.
- Conventions line 25 no longer says "Root coordinates follow CH26 §§6.3–6.11". It now defines the simple coroots of every type in the roadmap's own words and cites BC1 and CH26 as using the same coordinates. "Numbering of Ciubotaru–Harris §…" in §5.16, §5.17, 6.4 and 7.10, and "(6.21)" in 7.11, now point to Conventions.
- The type bounds are now cited to the source that owns them: BC1 §3.4 Proposition (1)–(2) (p. 18) for G₂ and F₄, BC1 §3.3 Theorem (p. 18) for the classical regions, and BC1 §3.2 and §7.2 for E. This replaces the unlisted "Barbasch, Theorem 3.1" and "Ciubotaru F₄ paper Appendix B". The other listed locators were checked against the texts and need no change: BM93 Theorem 8.1 (PDF p. 24 = printed p. 634), BC3 Theorems 1.3.1 (p. 3) and 1.4.1 (p. 4) and Corollary 6.2.6 (p. 29), and Ban02 Theorem 3.1 (printed p. 678).

Disputed: merging SRU.6 into SRU.5 and moving 7.1–7.5 out of SRU.7. The *Needs* lines force both layer orders:
- Every SRU.6 target consumes SRU.5: 6.1 uses *real-satake-parameter*; 6.2 uses *barbasch-moy-unitarity*, *spherical-generic-criterion* and §5.20; 6.3 uses *generic-temperedness-test* and *fundamental-separators*; 6.4 uses *half-integral-alcove-points*. No SRU.5 target consumes SRU.6.
- Inside SRU.7, 7.6 needs 7.1 and 7.4, 7.7 needs 7.5, and 7.4 needs 7.3 and 7.5.

The rule is "an order the dependencies force is kept, whichever source shares it". The merge and the move change no dependency, only headings. The two layers are also named by their mathematics and each serves its own end theorem from the Summary. SRU.6 introduces the objects of the nonsplit reduction (τ, G^∨(τ), the split companion G(τ)) for the unramified temperedness test. SRU.7 draws on CH26 §4.2 and §5 as well as §8, and on Aub95/Aub96, Ban02, KL87, La24, CiF4 and BC1 §§1.1–1.3, so it is not one source's section.

## H03 (CBirkbeck) — answered

CH26, BCP, La24 and Luo26 are cited, and their locators checked, against the arXiv versions read: CH26 v1, BCP v1, La24 v2 and Luo26 v2. References and the manifest's `version_note` state these versions. The manifest asserts no collation with a published revision. arXiv is an open repository under the sources policy. Whether a published version must be collated is the reviewers' call; nothing changed.

## H04 (CBirkbeck) — applied differently

Cas95 is on its own author's page (William Casselman's UBC page), so "author copy" is accurate and stays. Ber92 (Bernstein's lectures, notes by Rumelhart) is on that same page, which is neither author's. README line 1731 changes "author copy" → "Copy on William Casselman's UBC page". The manifest still records Ber92 as `licence_class = "author-page"`. Correcting that, and deciding whether this copy is acceptable, is for the worker and the human reviewers; this job may not edit the manifest.

## H05 (CBirkbeck) — answered

BHV is the published 2008 text deposited in the University of Geneva's institutional repository (archive-ouverte.unige.ch). The manifest records it as `licence_class = "institutional"` with the DOI 10.1017/CBO9780511542749. Institutional repositories are a legal place under the sources policy; whether the publisher permits that deposit is the human reviewers' call. Nothing changed.

## Build and gate

- `lake build TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII.Suggested`: Build completed successfully (8959 jobs). Only warnings: `declaration uses sorry` at Suggested.lean lines 78, 90, 129, 140, 153, 166 and 182.
- Gate after the commit: `gate SmoothRepresentationsOfLocalGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable --pr 1815`): `depcheck: 218 roadmaps, 1938 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean name missing anywhere.

## Consequences for other roadmaps

The renumbering affects one consumer, GlobalShtukasAndFunctionFieldLanglandsPartII, an open roadmap at its head. It cites this roadmap's §§5.23–5.27, §5.24 and §5.25; these are now §§5.16–5.20, §5.17 and §5.18, with unchanged slugs and content. Its §5.14 citation (no nonzero point for PGL₃) remains correct under the new §5.14. Its citations of §§5.1, 5.3, 5.5, 6.1–6.4, 7.1, 7.3–7.13 and 7.6–7.12 are unaffected. QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups cites §0.6 and §2.7, and ExceptionalThetaCorrespondencesForG2 cites gap names; neither changed.

No old → new table was added to the README. This roadmap has never been on main, so such a table would be process narrative. The consumer's citations should be updated when it is next revised.

## Lean signatures

`Suggested.lean` did not change, so the elaborated signatures supplied with this job still hold: 14 declarations, none with a dropped section binder. They agree with the SRU.0–SRU.1 README statements, which this job did not touch. No `#check` file was elaborated again, since the brief permits only the `lake build` command above.

## Ownership, moves, sources

- The repair adds no carrier, comparison or foundational theorem; it regroups and restates SRU.5's own targets. There is nothing new to check for ownership. The roadmap search above found no other roadmap stating the half-integral classification or the maximal-level bounds.
- No notion moved between roadmaps.
- Every text used was read from the sources cache (CH26, BC1, BM93, BC3, Ban02). Nothing was fetched and no `needs-references.toml` was written.
- No suspicious instructions appeared in the review text.

## Adversarial pass on the changed statements

Computations: exact rational arithmetic in Python over the root systems generated from the Conventions coroots and BC1's region descriptions (BC1 §3.3 Theorem, §3.4 Proposition, §7.2.1–7.2.3 rows). Classical maximal levels were checked by rational sampling with points on reducibility walls excluded.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: simple coroots per type | E₈, E₇, E₆ generated root systems; F₄ and G₂ Gram data; PSp(4) duality | E₈ 120 positive roots, highest (2,3,4,6,5,4,3,2); E₇ 63, highest (2,2,3,4,3,2,1); E₆ 36, highest (1,2,2,3,2,1). F₄: α₁^∨, α₂^∨ squared length 4 and α₃^∨, α₄^∨ squared length 2, products −2, −2, −1, so the diagram is 1–2⇒3–4 (Bourbaki). G₂: α₁^∨ squared length 2/3 (short), α₂^∨ squared length 2, highest (3,2) = (0,1,−1). PSp(4): ⟨ε₁, ω₂⟩ = 0 and ⟨ε₂ − ε₁, ω₂⟩ = 1 with ω₂ = ε₂ | holds | Wrong model is Bourbaki numbering for classical types, which would rename ½ωₙ as ½ω₁ for PSp(2n); excluded by the explicit α₁^∨ = ε₁ |
| §5.14 origin-only: U₀^(g,½) = {0} for PGL(n) (n odd), E₆, E₈, F₄, G₂ | PGL(3), PGL(5), PGL(7); G₂, F₄ from BC1 Proposition 3.4; E₆, E₈ from BC1 §7.2 rows | Nonzero points computed: none in each case. Surviving candidates and their highest-coroot values: G₂ ½ω₂ → 1; F₄ ½ω₁ → 1; E₆ ½ω₂ → 1; E₈ ½ω₁ → 1 and ½ω₈ → 1. PGL(3): (½,½) gives ν₁ + ν₂ = 1 | holds | The first draft said no nonzero half-integral point of PGL(n), n odd, is hermitian and generic. That is false: (3/2)ω₁ + (3/2)ω_{n−1} has every coroot value in {0, 3/2, 3}, so it is hermitian, generic and nonzero. The sentence was restricted to the fundamental-alcove candidates |
| §5.14 E₆ example: ½ω₁ satisfies the level-9 bound | (1,1,2,2,2,1) at ½ω₁ | ½ | holds | — |
| §5.15 alcove-points lists | PGL(2),(4),(6),(8); SO(5)…SO(15); PSp(4)…PSp(16); PSO(8)…PSO(16); E₇ | Computed nonzero points: ½ω_{n/2}; ½ω₁; ½ωₙ; {½ω₁, ½ω₂, ½ωₙ} for n even and {½ωₙ} for n odd; ½ω₇. Every listed point pairs to ½ with γ^∨ | holds | The first draft said every other candidate pairs to 1 with γ^∨. That is false for PGL(4): ½ω₁ pairs to ½ but is not hermitian. Changed to "is not hermitian or pairs to 1" |
| §5.15 PSp(2n) maximal level r₀ = n (n odd) or n + 1 (n even) | n = 2…6, sampled in BC1 §3.3 regions | Sampled r₀: 3, 3, 5, 5, 7 (claims 3, 3, 5, 5, 7) | holds | — |
| §5.15 PSO(2n), n even, r₀ = n − 1 | n = 4, 6 | Sampled r₀ 3 and 5 | holds | — |
| §5.15 PSO(2n), n odd, r₀ = n (new route) | n = 5, 7 on the hermitian locus ν₁ = ν₂ | Maximum over the sample at level n: 0.973 and 0.941 (< 1); at level n + 1: 1.405 and 1.294 (> 1). Reduction check: with a₁ = 0 the BC1 B/D condition equals the PSp(2n − 2) condition on a₂, …, aₙ, with matching levels (εᵢ + εⱼ has level i + j − 2 on both sides) | holds | CH26 states this case only as "a similar analysis"; the route now gives the coroots εᵢ + εₙ₊₂₋ᵢ |
| §5.15 Check PSO(10) | ν₁ = ν₂ = ½; ½ω₄; ½ω₅ | ⟨ε₂ + ε₅, ν⟩ = 1; ⟨γ^∨, ½ω₄⟩ = 1; ⟨γ^∨, ½ω₅⟩ = ½ | holds | — |
| §5.15 Check PSp(4) | ½ω₁, ½ω₂ | 2ν₁ + ν₂ = 1 at ½ω₁; ⟨ε₁ + ε₂, ½ω₂⟩ = ½ | holds | — |
| §5.15 Check D₃ = A₃ | α₃^∨ adjacency | α₁^∨·α₃^∨ = −1, α₂^∨·α₃^∨ = −1, α₁^∨·α₂^∨ = 0, so α₃^∨ is the middle node and the point is ½ω₃ | holds | — |
| §5.21 E maximal-level bound | All 2 + 8 + 16 BC1 rows | Each row's "<1" set has a coroot lying above every coroot of level 9, 9 or 15. A level-10, 10 or 16 coroot lies above a ">1" coroot in E₆ row 2, E₇ row 5 and E₈ row 4. Number of coroots of level r₀: 1, 4, 4 | holds | — |
| §5.21 Check ν = 0 | 0 | All coroot values 0 | holds | — |
| §5.21 Check levels and ½ω₄ of E₈ | Coefficient sums; ½ω₄ | 9, 9, 15 against highest-coroot levels 11, 17, 29. ½ω₄ has simple-coroot values 0 and ½ and value 2 on (1,2,2,4,3,2,1,0) | holds | The first draft said ½ω₄ pairs to ½ with every simple coroot; that is false (it is 0 off α₄^∨). Corrected |
| §5.16 assembled list | Union of §§5.14–5.15 over all quasi-simple split adjoint types A–G | Same sets as before the change | holds | Proof route and *Needs* now cite §§5.14–5.15 |
| How to read: acyclicity after renumbering | *Needs* of §5.20 and §5.21 | §5.20 cites no SRU.5 subsection; §5.21 cites only §5.20 | holds | §5.11 added to the users of §5.20, which it already cited |
| 7.10: "PSp case of SRU.5.15 for r odd" | so(r), r odd, factor of z(O^∨), with dual factor of type C | PSp(2m) list with v_r = ε_{⌊r/2⌋} = ω_{⌊r/2⌋} | holds | — |
