# GATE-AbelianSurfacesModularity~1: answers to the review of `ce7b798`

Repairs are in commit `223e025f` (not pushed). The layers were renumbered (H04); section numbers below are new unless marked "old". Old → new: §§4.1–4.10 unchanged; §§5.1–5.3 → §§4.11–4.13; §§6.1–6.3 → §§5.1–5.3; §§7.1–7.6 → §§6.1–6.6; §8.1 unchanged; §§8.2–8.4 → §§7.1–7.3; §§8.5–8.8 → §§9.1–9.4. Old line numbers refer to `TauCetiRoadmap/AbelianSurfacesModularity/README.md` at `ce7b798`.

## H01 (CBirkbeck) — applied

The table after the §1.1 statement (old lines 312–323) and the §4.10 table (old lines 804–815) are deleted. Also deleted: the inline "In table form (good ordinary / semistable ordinary): 2C ✗/✓, …" list in the §4.10 statement (old line 800) and the caption sentence "There are nine distinct lift polynomials" (old line 325). The statements at old lines 308 and 800 already state the same data, the latter as two iff-statements whose eight and four classes match every removed row. Checks and trailing lines that spoke of table "columns", "entries" or "✓/✗" (§4.10 Checks, §5.1 Checks, the trailing lines of §§4.5 and 4.9, Worked examples) now cite §4.10.

## H02 (CBirkbeck) — applied

All three curve lists are replaced by existence statements whose witnesses come from the roadmap's own enumerations:
- §4.13 (old §5.3, old lines 870–879): each of the six nonscalar polynomials q is realized by an ordinary 3-distinguished quintic in the §4.11 enumeration. A new Check gives the counts (42, 18, 54, 54, 36, 36).
- §9.3 (old §8.7, old lines 1211–1233), at 3: each partition other than [2,2,2] is realized in the §4.11 enumeration.
- §9.3, at 2: the étale order 1, 2 or 3 is read from how the cubic form H factors in the §4.4 enumeration. Witnesses are C₃ and C₁ of §4.3 and y²+(x³+x²+1)y=1.

Recomputing the enumerations reproduces the stated counts (768 smooth and 384 ordinary equations at 2; 1296, 864 and 854 at 3). It also shows why [2,2,2] needs the Weil-restriction seed: its only two ordinary equations over 𝔽₃ have Q=(X²±2X+3)².

## H03 (CBirkbeck) — applied

The five statements are rewritten in the roadmap's own words, using its own predicates and its own order of hypotheses:

| Old line | New section | What changed |
| --- | --- | --- |
| 563 | §3.2 | uses 2-distinguished from §0.2, a mod-2 image between A₅(b) and S₅(b), and complex conjugation a double transposition |
| 649 | §4.4 | reworded |
| 923 | §5.2 | reworded |
| 981 | §6.2 | reworded |
| 997 | §6.3 | uses 3-distinguished (§0.2) and the projective Frobenius class (§1.2); the equivalent characteristic-polynomial form moves to the proof paragraph |

Each restatement has the generality it had before, because the equivalences are API facts of §§0.2 and 1.2. Counting only words of two or more letters, plus numbers, the longest run shared with BCGP25 was 10–14 words in these five lines; it is now 6–7 words, all stock phrases such as "with good ordinary reduction at 3 and".

## H04 (CBirkbeck) — applied differently

Applied:
- Layer 8 is split into three layers by its mathematics: Layer 7 (endomorphism types, old §§8.2–8.4, which use only Layer 0), Layer 8 (density, §8.1) and Layer 9 (mod-2 realization, old §§8.5–8.8).
- Layers 4 and 5 are merged into one Layer 4, "Ordinary local points at 2 and 3 in the marked genus-two moduli". The old title "Local geometry at 2" did not cover §4.1 (Weil quartics at every p) or §4.8 (moduli over any number field); they sat there only because BCGP25 §9.2 contains both. The new title covers them.
- The scope paragraph no longer defines the roadmap as "the endpoint arithmetic of BCGP25 §6.4 and §§8–10".

Disputed:
- Merging Layers 1 and 2 would be wrong. They are split by residual characteristic, and neither follows the source's order: Layer 1 draws on BCGP25 §§6.4 and 9.1, Layer 2 on §§5.2.4 and 8.1–8.2. Moreover §§1.2, 1.4, 2.2 and 2.6 are statements about Galois representations or curves, not finite groups.
- Folding the switch (now Layer 5) into the modularity layer would also be wrong. It is a Hilbert-irreducibility existence theorem with no automorphic input. Its §5.3 has no consumer in Layer 6. And §6.2 needs §5.2, so the switch must come before the modularity layer.

## H05 (CBirkbeck) — applied

All fifteen headings that carried source labels now name only the mathematics; this is the thirteen counted in the review plus "Theorem A:" and "Theorem B:" (old §§7.3 and 7.5). The locators stay at the claims.

In the text, source labels used as names of the roadmap's own results are replaced by section references (§§4.2, 4.7, 4.10, 4.11, 6.2, 6.3, 6.5, 9.3, 9.4). This covers "Theorem A", "Theorem 9.5.2 applies…", "the ✓ of Theorem 9.2.3", "Table 9.2.5's second column", "Lemma 9.3.1(3) says" and "hypotheses (A2)–(A4) of Proposition 7.5.10".

Two trailing paragraphs that only restated their own section are deleted: "Remark 10.2.6: …" in §7.1, which repeated a Check, and "The residual images A₆ and S₆ are the cases advertised in §1.5 and §10" in §9.4, which repeated the statement.

## H06 (CBirkbeck) — answered

BCGP25 is cited in the version that was read: arXiv 2502.20645v1, recorded in the manifest as certified from an open repository. Every line and page locator is against that text, and if a journal version appears its numbering has to be checked against these locators.

The end theorems are BCGP25's Theorems A and B by design. The general theory they rest on is handed to named supplier roadmaps (Scope and ownership; Exact supplier contracts), so the BCGP25 locators cover only the endpoint-specific arithmetic. Whether a roadmap whose endpoints are one preprint's main theorems is in scope is a reviewers' decision.

## H07 (CBirkbeck) — answered

After H01 no table of BCGP25 is reproduced. The remaining data (class sizes and polynomials in §1.1, equation counts in §§4.4 and 4.11) are stated in prose as the content of theorems, which the review accepts at old lines 308 and 800.

KIS99, THORNE17 and FC90 are recorded in the manifest as uncertified (paywalled). They are cited by locator only: no text was read and nothing is attributed to them beyond the locator.

The LMFDB labels (§1.4, old line 384; §7.3, old line 1130) are used only as identifiers of subgroup classes and of one curve, whose equation is also given. No LMFDB data is reproduced.

## Other repairs in the same commit

- **GSp4NonregularModularityLifting citations.** The worker's citation leads were real: at the head of that roadmap's open pull request there is no "NR2.5", "NR11.2–NR11.6", "NR10" or "Proof gates and scope of the conditional conclusions". Its sections are numbered §§2.5–2.6, §§11.2–11.6 and Layers 10–11. Every occurrence is now cited by those ids, and `roadmaps resolve` reports no unresolved citation.
- **Needs lines.** §2.1 is added to §3.2, §1.2 to §5.2, and §4.3 and §4.4 to §9.3; each now matches what its statement or witnesses use.
- **No old → new table in the README.** No roadmap cites this roadmap's section ids: CurvesOverFiniteFields, GSp4NonregularModularityLifting and PotentialAutomorphyInfrastructurePartII name it without ids, and it is not on main.

## Manifest follow-up for the worker

This job may not edit `sources.toml`. Its `cited_for` fields use the old numbering:

| Source | Old `cited_for` | New |
| --- | --- | --- |
| BCGP25 | "Layers 0–8" | "Layers 0–9" |
| BCGP21 | §§1.4 and 7.1 / §8.3 / §8.7 | §§1.4 and 6.1 / §7.2 / §9.3 |
| FKRS12 | Section 8.3 | Section 7.2 |
| WHITMORE22 | Sections 1.4 and 7.1 | Sections 1.4 and 6.1 |

Entries pointing at §4.7, §2.5 and §4.8 are unchanged.

## Build, gate, dependency check

- `lake build TauCetiRoadmap.AbelianSurfacesModularity.Suggested`: `✔ [8954/8954] Built TauCetiRoadmap.AbelianSurfacesModularity.Suggested (13s)` / `Build completed successfully (8954 jobs).` The Lean file has not changed since this build.
- Gate on `223e025f`: `gate AbelianSurfacesModularity: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 218 roadmaps, 1938 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- `Suggested.lean` declares nothing; it is a namespace and docstring only. The `#check @name` comparison therefore has nothing to elaborate. Only the docstring's section references changed: §§6.2–6.3 → §§5.2–5.3, Layer 7 → Layer 6, §§8.2–8.4 → §§7.1–7.3, §§8.7–8.8 → §§9.3–9.4. "Theorem A/B" is replaced by "surjective-mod-3" and "quintic genus-two" modularity.

## Ownership and sources

- **Ownership.** No new object or construction is introduced: the repairs reword, delete, renumber, and replace example lists by finite checks inside existing targets. No target moves between roadmaps.
- **Sources.** No new source was fetched and no `needs-references.toml` was written. The new locators (BCGP25 lines 9396–9411 on p. 203; 10200–10212 on pp. 219–220; 10224–10291 on pp. 220–221; 8139–8142 on p. 177) were each checked against the page markers of the cached extraction.
- **Untrusted text.** Nothing in the review text asks for actions outside this job.

## Adversarial pass on changed and added statements

The enumerations were recomputed independently. Weil quartics come from point counts over 𝔽_q and 𝔽_(q²); smoothness uses the two-chart criterion of §4.4.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 class sizes (table removed, sentence kept) | ten listed sizes | 36+540+540+1620+1440+1440+4320+6480+5184+4320 = 25920 = PGSp₄(𝔽₃)/2 = 51840/2 | holds | none |
| §4.10 iff-statements without the table | each removed row | semistable column: 8 classes (all but 4C, 12C); good column: {4D, 6H, 6I, 10A}; e.g. 2C ✗/✓, 6G ✗/✓, 4C ✗/✗ all follow | holds; table redundant | table and inline list deleted |
| §3.2 restated | conjugation trivial (order 1); a transposition (odd, ∉ A₅(b)); good supersingular at 2; good ordinary with Q a square | all four excluded by both the old and the new hypotheses (2-distinguished presupposes ordinary, by the §0.2 definition) | same generality | none |
| §4.4 restated, enumeration | all 2¹¹ pairs (h, f) over 𝔽₂ | 768 smooth, 384 ordinary; Q mod 3 in the class of 2C/6G/6H: 48 (=32+16), 6I: 48, 8A: 96, 10A: 192; non-ordinary 6G 48, 4C/12C 144, 4D 48, 8A 48, 10A 96 | matches the stated counts (the 6G/6H split needs the 27-point action and was not recomputed) | none |
| §5.2 restated | class 4C; class 6H | 4C excluded by the old wording and by "outside {4C, 12C}"; 6H allowed by both | same generality | none |
| §6.2 restated | image 3.1620.2; image 1.1.1 | excluded and allowed respectively, as before; the dropped "equivalently (x²±x+2)²" is the §1.2 API fact | same generality | none |
| §6.3 restated | E×E at 3; Frob₂ with polynomial (X²+X+2)² ≡ X⁴+2X³+2X²+X+1 | Q=Q_E² is not 3-distinguished (§0.2), so excluded by both; class 4C/12C (§1.2), so excluded by both | same generality | equivalence stated in the proof paragraph |
| §4.13 nonscalar witnesses | all 2187 f over 𝔽₃ | 854 distinguished ordinary, of which 240 quintics; q = X²+1: 42, X²−1: 18, X²−X−1: 54, X²+X−1: 54, (X+1)²: 36, (X−1)²: 36; the 10 square-Q equations have 0 rational Weierstrass points | every nonscalar class realized; scalar classes need products | new paragraph and one Check |
| §4.13 Jordan claim for square q | the 36+36 quintics with q=(X∓1)² | all have Q squarefree, so they are not among the 10 scalar ones of §4.11 | Jordan, by §4.11 | none |
| §9.3 at 3, partitions | the 864 ordinary f over 𝔽₃ by factorization type (+1 for deg 5) | distinguished: [1,1,1,1,2] 6, [1,1,1,3] 64, [1,1,2,2] 36, [1,1,4] 144, [1,2,3] 96, [1,5] 288, [2,4] 84, [3,3] 24, [6] 112, [2,2,2] 0 (sum 854); [2,2,2] has 2 ordinary, f = x⁶+x⁴+x²+1 and twice it, Q=(X²±2X+3)² | nine partitions realized; [2,2,2] needs the Weil restriction | list replaced by existence statement |
| §9.3 at 2, H-type ↔ étale order | all 768 smooth pairs | ordinary ⇔ H has 3 distinct zeros on ℙ¹ (768/768); split 16 with 4 ∣ Q(1) for all, linear·quadratic 144 with Q(1) even for all, irreducible 224 with Q(1) odd for all; none has Q ≡ (X²±X+2)² mod 3 | consistent with rational 2-torsion (ℤ/2)², ℤ/2, 0 | new paragraph and Check |
| §9.3 dyadic witnesses | C₃ mod 2, C₁ mod 2, y²+(x³+x²+1)y=1 | (N₁,N₂) = (3,3), (5,7), (2,6); Q = X⁴−X²+4, X⁴+2X³+3X²+4X+4, X⁴−X³+X²−2X+4; Q(1) = 4, 14, 3; mod 3: X⁴+2X²+1, X⁴+2X³+X+1, X⁴+2X³+X²+X+1, none equal to X⁴+2X³+2X²+X+1 or X⁴+X³+2X²+2X+1 | orders 1, 2, 3, none forbidden | none |
| §9.3 special fibre of W | split W = (ℤ/2)²⊕μ₂²; a nonsplit ordinary W | over the perfect field 𝔽₂ both special fibres are étale ⊕ Cartier dual, so they agree with J₀[2] once the étale actions agree; the extension over ℤ₂ is the extra datum | holds | wording made explicit; renamed A₀ → J₀ to avoid a clash with the Weil restriction A₀ |
| Layer 7 Dependencies "no result of Layers 1–6" | the Needs lines of §§7.1–7.3 | the only internal refs are §0.1, §7.1, §7.2 | holds | new line |
| Layer 9 Dependencies "Layers 0–2, 4 and 6" | the Needs lines of §§9.1–9.4 | §§0.2, 0.3, 1.2, 2.1, 2.2, 4.1–4.4, 4.8, 4.11, 6.2, 6.3 | holds | new line |
| Layer 5 Dependencies "Layers 0–2 and 4" | the Needs lines of §§5.1–5.3 after adding §1.2 | §§0.2, 1.2, 2.1, 2.2, 4.8, 4.10, 4.13 | holds | edited |
| Internal references after renumbering | every §/Section reference into Layers 4–9 | each resolves to the heading intended before renumbering; supplier ids with coinciding numbers (e.g. AbelianVarietiesOverFiniteFields §§6.1–6.3, ArithmeticGaloisRepresentations §7.6, ShimuraCompactifications §6.4) are left unchanged | holds | 89 references renumbered |
