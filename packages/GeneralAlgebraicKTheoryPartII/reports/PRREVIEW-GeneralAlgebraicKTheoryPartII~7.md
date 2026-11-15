# Review of GeneralAlgebraicKTheoryPartII (pull request #1742 at 76a08ce)

**Verdict:** needs changes

Previous review (at 04493c3): R01, the units gap, is repaired — the contract now reads "identify BGL₁R=Ω∞bgl₁(R) … with the classifier of R-lines equivalent to R". R02, process wording, is repaired — "request" no longer occurs in the README.

## R01 (P2) — the stable James splitting is taken from a roadmap that may not be cited, and §4.30c is gone

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` lines 13, 196, 1304, 1308, 1317, 1560, 1960, 1967, 1993, 2451: "Apply the reduced stable James splitting of HomotopySpheres §3B.6".

**Claim:** §§4.33 and 7.7 may take Σ∞ΩΣW≃⋁_(r≥1)Σ∞W^∧r from HomotopySpheres.

**Witness:** Gate at this head: `dropped=10 … FAIL`, one hit per line above. ChromaticHomotopyTheory (open head, README line 10) still cites "the stable James splitting of its §4.30c", which this head no longer has.

**Repair:** Restore §4.30c (The stable James splitting) as an own target in reduced form, with its Checks, e.g. from ΣJ(W)≃⋁_(r≥1)ΣW^∧r (hatcher Proposition 4I.2, p.468) and §4.30b. Point the Needs of §§4.33 and 7.7 at it. Delete the `From TauCetiRoadmap.HomotopySpheres` subsection and the ten mentions.

## R02 (P2) — Layers 7–10 keep the section order and scope of lmmt §§4.2–4.5

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` lines 1901–2447, from "### 7.4 K-theory of Morava K-theory" to the end of Layer 10.

**Claim:** The layers are worked back from the targets and are the roadmap's own arrangement.

**Witness:** §§7.4–7.8 ↔ lmmt §4.2 (4.9, 4.11, 4.12, 4.14, 4.16–4.18); §§8.6–8.9 ↔ §4.3; Layer 9 ↔ §4.4 (4.23–4.29, all, in order); Layer 10 ↔ §4.5 (4.31–4.34). No Needs line orders Layers 7–10 among themselves.

**Repair:** Place each target after what it consumes, and give an old → new table for the moved ids (keep §§4.x, 5.2, 5.5 and 6.5, which ChromaticHomotopyTheory and DGFloerPartII cite):
- §10.1 after §5.1 (it needs §§3.6, 4.45 and 5.1 only);
- §§10.2–10.5 after §5.6, as consequences of the trace comparison §5.2 and of purity;
- §§9.6–9.7 after §6.6, as the height-one limit of §5.2 (they need §6.5);
- §§7.5, 7.6, 8.6 and 8.7 in one layer of support computations fed to §§5.5 and 6.1, followed by the dévissage cases §§7.4 and 8.9 (they need §3.4);
- §§7.7–7.8 next to their inputs §§4.30b–4.33;
- Layer 8 keeps §§8.1–8.5 and 8.8; §§9.1–9.5 stay one height-one layer, whose order its Needs force.

Further sources for the main results: cmnn24 line 57, Theorem A, p.2, for §6.1; lt line 1491, Theorem A.2, manuscript p.35, for §9.2.

## R03 (P3) — six targets are run-in bold paragraphs, and Needs lines name titles that no longer exist

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` lines 2226, 2272, 2287, 2322, 2410, 2426, e.g. "**9.2 Nilinvariance, Milnor excision and cdh-descent.**"; Needs at 2241, 2285, 2320, 2335, 2424, 2439.

**Claim:** Every target is a `### k.n` subsection and every `§k.n (title)` citation names its heading.

**Witness:** `grep '^### 9\.'` finds 9.1, 9.3 and 9.6 only. Line 2285 cites "§9.3 (Flat and smooth spectral affine lines)"; the heading is "9.3 Spectral affine lines, height-one homotopy invariance and KH".

**Repair:** Make 9.2, 9.4, 9.5, 9.7, 10.4 and 10.5 `###` headings again. Restore the short titles of §§9.1, 9.3, 9.6 and 10.3 that the Needs lines use, and drop the "This section shows … consume" sentences.

## R04 (P3) — two Lean docstrings state more than their statements

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/Suggested.lean` lines 133–135 and 144–145: "whose cells other than the unit are the products of cells of `W` other than the base point"; "the product topology on `J(W) × J(W)` is the CW topology".

**Claim:** `exists_cwComplex` and `continuousMul` state these facts.

**Witness:** Elaborated types: `T2Space … ∧ ∃ x, ∀ r, ∃ E, ↑E = filtration W w₀ r` and `ContinuousMul (JamesReducedProduct W w₀)`. Neither mentions the cells or a product CW structure.

**Repair:** Cut the two clauses from the docstrings (README §4.30b keeps them as the "Cells" bullet): "…`J(W)` is a Hausdorff CW complex in which the stages of the word-length filtration are subcomplexes"; "For a CW complex with countably many cells, `J(W)` is a topological monoid."

## R05 (P3) — the description says the chromatic groundwork leaves this roadmap

**Location:** pull request description, summary block: "The chromatic groundwork, from telescopes to the Bousfield–Kuhn functor, passes to ChromaticHomotopyTheory."

**Claim:** ChromaticHomotopyTheory owns §§4.1–4.11.

**Witness:** README line 7: "Layer 4 §§4.1–4.34 and Layer 6's Lubin–Tate covers (§6.1a) and chromatic field maps (§6.2) are owned here; ChromaticHomotopyTheory is downstream of this roadmap".

**Repair:** "The chromatic groundwork, from telescopes to the Bousfield–Kuhn functor, is owned here in Layer 4; ChromaticHomotopyTheory consumes it. §4.30b owns the James reduced product, which `Suggested.lean` states." Also replace "It follows Land–Mathew–Meier–Tamme:" by "Its route:".

## R06 (P3) — §1.2 anchors the definitions of Kadd and hom at the line of Proposition 3.6

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` line 342: "(lmmt line 610, Definition and discussion preceding Proposition 3.6, p.1023; …)".

**Claim:** lmmt line 610 holds the definition of Kadd and of hom_C.

**Witness:** lmmt line 610 is the statement of Proposition 3.6. Kadd and Kadd(Projω(R))≃τ≥0K(R) are at lmmt lines 595–599, hom_C at lines 600–603.

**Repair:** "(lmmt line 595, the two remarks opening §3.3, p.1023; hs line 3711, …)".

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.1 (sample) | q=id; q:D→0 | fibers 0 and K(D^ω); bgt line 1622 is Proposition 5.14, pp.777–778 | sound |
| §1.2 (sample) | Perf(k) additively; C=0 | Kadd π₀=⊕_jℤ against stable ℤ; Kadd(0)=0; hs line 3711 is Corollary 8.1.3 | sound; locator R06 |
| §4.1 (sample) | p=2, H𝔽₃ | S[1/2]⊗H𝔽₃=H𝔽₃≠0; Hℚ⊗H𝔽₃=0; lmmt line 263 fixes T(0)=S[1/p] | sound |
| §4.2 (sample) | Hℤ, n≥1 | colim_r π_(k+rd)Map(V,Hℤ)=0, since d>0 and Hℤ is bounded above | sound |
| §4.3 (sample) | Hℚ | (Hℚ)_p^∧=0 while T(0)⊗Hℚ=Hℚ, so completion is not a T(0)-equivalence; lmmt Lemma 2.2(v),(vi) | sound |
| §4.4 (sample) | H𝔽_q, q≠p | T(0)⊗H𝔽_q=H𝔽_q≠0, K(0)⊗H𝔽_q=0; hopkins-smith lines 89, 129, 166 are Theorems 3, 7, 11 | sound |
| §4.7 (sample) | S/q, q≠p | L_n^(p,f)(S/q)=S/q; L_n^f(S/q)=0; lmmt line 378 is consequence (i) | sound |
| §4.12 (sample) | Hℤ→0; Σ⁻¹Hℚ→0 | Σ∞Ω∞Hℤ=⋁_ℤS, not T(n)-acyclic; Ω∞Σ⁻¹Hℚ=* while Σ⁻¹Hℚ[1/p]≠0 | sound |
| §4.15 | K(ℤ/p,n) | rank p^(binom(n,n))=p, reduced rank p−1≥1 (csy line 3655), so m≥n+1; lmmt Proposition 2.11 has m≥2 | sound |
| §4.31 (sample) | p=2; p=3 | unit 1−2=−1; S³⟨4⟩ has π₃=0, π₄=ℤ/2; at 3 the sign map is null, the Thom spectrum retracts to S_(3), π₃=ℤ/3≠0 | sound |
| §4.32 | p=3, m=2, i=1; p=5 | slopes 1/16 and 1/4, difference 3/16; 1/48 and 1/8, difference 5/48 | sound |
| §4.39 | m=n=0 | I⊗_A J is (m+n)-connective, μ is (m+n+1)-connective, the suspended fiber gives m+n+2=2 | sound |
| §4.46 Theorem A | A=Hℤ, n=1 | L₁^(p,f)Hℤ=Hℤ[1/p]; the fiber of K(ℤ)→K(ℤ[1/p]) is K(𝔽_p), and L_T(1)Hℤ_p=0 | sound |
| §5.4 CMNN | n=2, 3 | m=0, 1; L_T(2)K(S[1/p])=0 by Mitchell; the trace index m+1=1 lies outside n≥2 | sound |
| §5.5 purity | A=H𝔽_p, n=1 | L_(T(0)∨T(1))H𝔽_p=0 and L_T(1)K(𝔽_p)=L_T(1)Hℤ_p=0 | sound |
| §6.1 Theorem B | H𝔽_p; Hℚ | heights −1 and 0; K(𝔽_p)[1/p]≠0 gives 0≤0; bound 1 for K(ℚ) | sound |
| §6.5 redshift | (H𝔽₂)^tC₂, p odd | R[1/p]=R≠0, T(1)⊗R=0, so ht=0; 2=0 on K(R), so T(1)⊗K(R)=0 and ht K(R)≤0≠1; excluded by R⊗Hℚ≠0 | sound |
| §6.6 | M=HA | relative K₁ of ℤ⊕A is 1+A, so the stable colimit is ΣM (π₁=A), not ΩM | sound; see Source issues |
| §6.7 (sample) | R=Hℚ, n=1; R=E₁, n=1, 2 | Hℚ: both pieces vanish (ht K≤1); E₁: nonzero at (1,2), zero at (2,3) | sound |
| §8.1 (sample) | H(ℚ/ℤ); H𝔽₂; Σ=∅ | N·(1/2N)=1/2≠0, so not ε; 2·id=0 on H𝔽₂; F=0 gives T_(ε,∅)=T; cmnn20 lines 300, 339, 356, 421, 489 | sound |
| §8.2 (sample) | KU→KO in Sp | 1↦2 on π₀, N=2, Σ={2}; cmnn20 line 798 Theorems 4.2–4.3, reduction to small C at line 801 | sound |
| §8.3 (sample) | G=1; A→A×A | identities; transfer (a,b)↦a+b sends (1,0) to 1; cmnn20 line 975 is Theorem 5.6 | sound |
| §8.4 (sample) | H=1; free rank d | X=S has rank 1; k-dimension d·\|H\|; cmnn20 line 1651 Theorem B.2, line 1664 Corollary B.3 | sound |
| §9.4 | 𝔽_p[ε]/ε² | 1+εx lies in NK₁ and (1+εx)^p=1; the K(1)-local fiber is 0 | sound |
| §10.2 (sample) | constant diagrams | colim=A in both shapes; local colimit is L_T(n−1) of the ambient one; lmmt line 1162 is Corollary 4.32 | sound |
| §10.5 | G=ℤ; S₃ | G/G is terminal for ℤ; S₃ has no cyclic terminal orbit | sound |
| Lean `existsUnique_lift` | X={x₀,a}, M=(ℕ,·) | φ(a^k)=f(a)^k is forced; the map on each power is continuous for the product topology, hence for the finer one | sound |
| Lean James theorems | w=w₀; W=S⁰ | d(w₀)=0 gives s/0=0, the constant loop of length 0, the unit; J(S⁰)=ℕ against π₀ΩS¹=ℤ, excluded by `ConnectedSpace` | sound |
| R01 | README lines 1304, 1960 | the gate reports 10 dropped-name hits; §4.30c is absent while cited at ChromaticHomotopyTheory line 10 | finding |
| R02 | Layers 7–10 | 5, 4, 7 and 4 results of lmmt §§4.2, 4.3, 4.4, 4.5 in the source's order | finding |

- Source locators checked against the text: 41 lines in 10 sources (lmmt, cmnn20, thom, akq, hs, bgt, lt, csy, hopkins-smith, hatcher); the 15 sampled targets all hold, with the one line offset of R06.
- Gate at this head (the worker's run): every check 0 except `dropped=10`, `build=0`; result FAIL (R01).
- Dependency check, my run: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The outside-folder diff is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with five `sorry` warnings (lines 124, 136, 146, 156, 174) and nothing else. The elaborated types of the 12 declarations were compared with §4.30b; the seven dropped binders are `[TopologicalSpace X]` on purely algebraic definitions, and every theorem keeps its hypotheses.
- One-tactic probe on a scratch copy (`first | simp | rfl | infer_instance`): none of the five theorems closes; `ι X x₀ x₀ = 1` closes by `simp`. No padding.
- Headlines: Theorem A, CMNN vanishing, purity, Theorem B, redshift, Galois descent, height-one excision and homotopy invariance, sifted continuity and cyclic assembly need spectra or enhanced K-theory and are named in the module docstring; the James theorem is stated.
- Cross-roadmap citations resolved: the worker's resolver finds none missing; I opened RefinedTraceMethods §§4.17, 4.19, 6.1 (open head, lines 2226–2553), DGFloer Layer 1 item 2 (main, line 470), and every numbered citation of this roadmap in ChromaticHomotopyTheory and DGFloerPartII, which all resolve except §4.30c (R01). Gaps: 21 contracts for 21 declared slugs.
- Ownership against open pull requests was checked through the listed checkouts and `roadmaps grep`; no other `Suggested.lean` declares `JamesReducedProduct`.

Overlap check: read ChromaticHomotopyTheory, RefinedTraceMethods, BordismFormalGroups, StableHomotopyKTheoryPartII, StableHomotopyKTheory, EllipticCohomology; Layer 4 chromatic interfaces, §6.1a and §6.2: this roadmap (ChromaticHomotopyTheory consumes them); sharp bound m=n+1 and higher norms: ChromaticHomotopyTheory; James–Hopf maps: BordismFormalGroups F6.2; gl₁ and the J-homomorphism: EllipticCohomology E5; power operation and transfer ideal: StableHomotopyKTheoryPartII §§4.4–4.5; K of stable categories, TC and spherical lifts: RefinedTraceMethods; the James reduced product: see For the human reviewers.

Source independence: 22 passages compared with 10 sources, none shared (longest common run under 8 words; the proof routes of §§4.39 and 8.2 keep the sources' steps in other words); largest share lmmt, 90 of 194 line-anchored locators; contents compared with lmmt: Layers 0–6 independent, Layers 7–10 follow §§4.2–4.5 (R02).

## Not verifiable

- `james` (Annals of Mathematics 62, 1955): settled as uncertified; the James equivalence was read in hatcher Theorem 4J.1 (line 20284) instead.
- The locators outside the sample and the neighbouring passages above were not reread this round.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed page 1026: the source gives the stabilised relative K-theory colimit of the split square-zero extensions of S by Σ^rM as ΩM; it should be ΣM, as relative K₁ of ℤ⊕A is 1+A; affects nothing.
- **Error** in akq at §2.1, manuscript p.5: the source identifies the Thom spectrum of the sign map on Ω² of the 3-connected cover of S³ with Hℤ integrally; it should be Hℤ_(2) after 2-localization, since 3-locally it retracts onto S_(3); affects nothing.

## For the human reviewers

- HomotopySpheres is on main (§§3B.1–3B.6; its README line 3308 names this roadmap as consumer of the splitting) and on the never-cite list. §4.30b and the 12 Lean declarations plan the same James construction. Which roadmap owns it?
- `hatcher` is read from the author's page; `james` is cited by locator only (paywalled).
