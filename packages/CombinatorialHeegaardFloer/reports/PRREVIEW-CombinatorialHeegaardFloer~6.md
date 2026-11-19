# Review of CombinatorialHeegaardFloer (pull request #2545 at 0750758)

**Verdict:** accepted

**Summary.** Accepted: an independent full pass over this head found no false or unsupported stated result, and `Suggested.lean` elaborates with `sorry` as its only warning. There are six small corrections and one format note, none blocking. Four corrections and the note are those of the previous review, which read the same head and so are not yet repaired; two are new (the collapsed link module in §3.6, and the owner named for the connected-sum adapter in Downstream consumers). One question about arrangement is left for the human reviewers.

## C01 — The alternative grid-homology route to Torres's symmetry in §2.3 is circular as cited, and one of its inputs is a target of no section

An implementer who takes the second option of the *Needs:* line ("Torres (1953), or §3.9 on the grid-homology route", line 364) assumes what is to be proved. §3.9's Euler characteristic is stated for the symmetrized `Δ_L`, which Definition 11.5.4 obtains from Torres's theorem (OSSBOOK line 8402); and the book's proof of Theorem 11.6.1 (OSSBOOK line 8636) uses Proposition 11.5.8, whose proof ends by invoking Theorem 11.5.3 (OSSBOOK line 8566). The other input, the symmetry of multi-graded `GĤ` of links (Corollary 11.4.3, OSSBOOK line 8312), is not a target anywhere: §3.8 states the knot symmetries only.

The route closes if it stops before Torres is used. The Fox-calculus computation of Proposition 11.5.8 up to its last step (OSSBOOK lines 8548–8565, with (11.14)) gives `det M(G) ≐ ∏ⱼ (1 − tⱼ)^nⱼ · Δ_L(t₁⁻¹, …, t_ℓ⁻¹)`, hence `χ(GĤ(L)) ≐ Δ_L(t⁻¹) ∏ᵢ (1 − tᵢ)`; the `h ↦ −h` symmetry of Corollary 11.4.3 then gives `Δ_L(t⁻¹) ≐ Δ_L(t)`, the product being nonzero. Either name these two inputs on line 364 and add the link symmetry as a target (in §3.8, say), or keep Torres (1953) alone.

## C02 — The genus bounds of §3.8 and §3.9 cite §2.2 for a grid adapted to the surface, which §2.2 does not construct

The *Needs:* entries "§2.2 (to pass to a grid realizing the genus)" (line 686) and "§2.2 (to pass to a grid adapted to `F`)" (line 717) point to Cromwell's theorem, which compares two grids of one link; it does not produce a grid whose associated surface has Euler characteristic at least `χ(F)`. The proofs of Propositions 7.2.2 and 11.7.1 take that grid from Proposition 3.4.11 (OSSBOOK line 2536; for links, line 8718), and use the Euler characteristic of the associated surface (Proposition 3.4.9, line 2492) and its expression as the largest Alexander grading of a grid state (Proposition 7.2.1, line 5370). None of the three is stated in any section. Stating them as one lemma in §3.8, for knots and links, and citing it in both *Needs:* lines would close the gap.

## C03 — In §5.4, "each counted domain contributing its class" does not say which class

A domain between two different generators has no class in `H₂` on its own (line 1238). In OSS09 (lines 3290–3303) one fixes a base generator `x` in each equivalence class and, for every `y` in it, a connecting domain `D_y` from `x` to `y` with all basepoint multiplicities zero; a counted domain `D` from `y` to `z` then contributes the class of the periodic domain `D_y + D − D_z`, and independence of these choices is part of the proof of Theorem 9.4 (OSS09 line 3340). Writing the construction in that form, with the same locator, makes the definition determinate.

## C04 — In §3.6, "setting every `Vⱼ` equal gives the collapsed `𝔽[U]`-module of a link" holds for the complex, not for the homology module the sentence is about

The bullet (lines 610–611) is about the link form of `GH⁻`, a module over `𝔽[V₁, …, V_ℓ]`. The collapsed homology is the homology of the quotient complex in which the variables of the different components are identified (OSSBOOK Definition 8.2.4, line 5735), and for two components the exact sequence of `0 → GC⁻ → GC⁻ → GC⁻/(V₁ − V₂) → 0` gives `0 → GH⁻/(V₁ − V₂) → cGH⁻ → ker(V₁ − V₂ on GH⁻) → 0`. So the quotient of the homology module is the collapsed module only when `V₁ − V₂` acts injectively on `GH⁻`, which nothing here proves. Smallest repair: "identifying the `Vⱼ` in the complex gives the collapsed complex, whose homology is the collapsed `𝔽[U]`-module of the link".

## C05 — Downstream consumers names GeometricTopology as owner of the connected-sum adapter and the Mazur-satellite `τ` formulas, which GeometricTopology leaves to its Part II

The sentence "GeometricTopology owns the connected-sum and descent adapter for the grid invariant and the `τ` formulas for Mazur satellites" (lines 1299–1300) sends a reader to a roadmap that says the opposite: `TauCetiRoadmap/GeometricTopology/README.md` on main lists both among the developments that "GeometricTopology, Part II" owns because they consume roadmaps downstream of it (lines 190–207). The sentence would be right with "GeometricTopology, Part II" in place of "GeometricTopology".

## C06 — The description's reason for dropping the Thurston-norm target says that no roadmap supplies the norm

The description says "no roadmap supplies the Thurston norm of a link complement". GeometricTopology on main supplies the integral surface minimum in its Layer 5.4.1 and assigns the Thurston seminorm beyond it to its Part II (its README line 208). Accurate text: "and GeometricTopology Layer 5.4.1 supplies only the integral surface minimum, leaving the Thurston seminorm to its Part II". The rest of the description matches the head: it says the roadmap is revised, maps the lanes to the layers, names the two removed and the four added `Suggested.lean` statements and the import changes, and its count of 43 Checks is the head's.

## N01 — §5.4 needs §5.5 (line 1244), so Layer 5 is not in build order. As with `HF̂_st`, the twisted complex and its invariance under nice moves could stay in §5.4 and `HF̂T(Y)` on convenient diagrams move to §5.5.

## Previous findings

The previous review read this same head and raised no finding. Its four small corrections and its format note are unrepaired, since nothing changed, and are restated above after being checked again against the sources: C01 ("or §3.9 on the grid-homology route", line 364), C02 ("§2.2 (to pass to a grid realizing the genus)", line 686), C03 ("with each counted domain contributing its class", line 1238), C06 (its C04, the description) and N01 ("*Needs:* §5.3, §5.5", line 1244).

## Verified sound

OSSBOOK, OSS09, OSS12, Zem21 and Nem07 are the cached texts of the book, of arXiv:0912.0830v3, arXiv:1206.1654v1, arXiv:2111.14962v4 and arXiv:0709.0841v1.

| # | Statement | Instances tried | Values computed (one side / other) | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.1 shifts, `W`, cancellation | `W` Euler characteristic; Maslov-only shift; `𝔽⟦1,1⟧` | `1 + (−1)⁻¹t⁻¹ = 1 − t⁻¹`; wrong shift `1 − 1 = 0`; `𝔽⟦1,1⟧` lives in `(−1,−1)`; series `1 + q⁻¹t⁻¹ ≠ 0` in a domain | holds | none |
| 2 | §1.3 bigraded structure theorem, uniqueness | `𝔽[U]/(U²)` vs `𝔽 ⊕ 𝔽`; tower | `dim (U^iM/U^{i+1}M)`: `1,1,0` vs `2,0,0`; tower `1,1,1,…`; Prop A.4.3 at OSSBOOK 15449 | holds | none |
| 3 | §1.4 filtered notions | `C = 𝔽a ⊕ 𝔽b`, `∂b = a`, `F₀ = 𝔽a` | `H(C) = 0`; `H(gr C) = 𝔽²`; Defs 13.1.1–13.1.9 at OSSBOOK 10296–10428, remark 10395 | holds | none |
| 4 | §3.1 rectangles | `2 × 2` grid, states differing in two points | four unit cells, two from `x` to `y`; four cells carry four markings, so `∂̃ = 0` | holds | none |
| 5 | §3.4 Euler characteristic | cone of `V` of bidegree `(−2,−1)`; unknot `n = 2, 3` | `χ(C)(1 − t⁻¹)` per variable; `1 − t⁻¹`, `(1 − t⁻¹)²` vs `χ(GĤ) = 1` | holds | none |
| 6 | §3.5 `bigradedUnblockedHomologyIsomorphic_of_movesTo`, `simplyBlockedHomology_equiv_of_movesTo` | `K = 𝔽₂`; `K` non-field of characteristic 2; zero ring | base change `− ⊗_𝔽₂ K` flat; zero ring excluded by `CharP K 2`; Thm 5.3.1 (OSSBOOK 4427), Cor 4.6.17 (3374) | holds | none |
| 7 | §3.6 link module and collapse | two components | `0 → GH⁻/(V₁−V₂) → cGH⁻ → ker(V₁−V₂) → 0`; Def 8.2.4 collapses the complex | bullet imprecise | C04 |
| 8 | §3.7 `natAbs_tau_le_unknottingNumber` | trefoil grid; `torusLink 2 3`; `u = ⊤` | `1 ≤ 1`; `3 ≤ 3`; `⊤` trivial; Thm 6.1.7 `0 ≤ τ(K₊) − τ(K₋) ≤ 1` (OSSBOOK 4731) | holds | none |
| 9 | §3.7 `unknottingNumber_toGridLink_torusLink` | `p = 0`; `(1,2)`; `(2,3)`; `(1,1)` | `0`; `1`; `3`; coprimality fails and `u = ⊤ ≠ 0`; `pq` even when `p+1, q+1` coprime, so `ℕ` division exact | holds | none |
| 10 | §3.8 symmetries, genus bound | left trefoil `(2,1),(1,0),(0,−1)` | 7.1.2 then 7.1.1: `GĤ_M(m(K),A) ≅ GĤ_{2A−M}(K,A) ≅ GĤ_{−M}(K,−A)`; `(2,1) ↔ (0,−1)`; `g ≥ 1` | holds; grid input unowned | C02 |
| 11 | §3.9 skein, thinness, Euler characteristic, link genus bound | Hopf; 2-unlink; `ℓ = 1`; connected `F` | `d = s + σ/2`; unlink `χ = 0`; `(ℓ − χ(F))/2 = g + ℓ − 1` for `χ = 2 − 2g − ℓ`; Thm 11.6.1 (8600), Prop 11.7.1 (8673) | holds | C01, C02 |
| 12 | §2.3 `Δ_L`, Torres | Hopf; 2-unlink; trefoil | `H₁(X∞) = 0`, `Δ = 1`, `(t−1)·1 ≐ t^½ − t^−½`; free rank one, `Δ = 0`; `Λ/(t² − t + 1)` | holds; second route circular | C01 |
| 13 | §3.10 normal form, slice-genus bound | `T_{3,4}`; figure-eight | `τ = 3 = g_s`; `τ = 0 < 1`; Prop B.5.1 (OSSBOOK 16985), Def 2.6.10 (1555), Thm 8.1.1, Cor 8.1.2 (5668) | holds | none |
| 14 | §3.11 Legendrian invariants | corners; negative stabilization; `m(5₂)` | `x⁺` NE, `x⁻` SW (OSSBOOK 9455); `φ₋(λ⁺) = λ⁺`; `λ⁺ ≠ λ⁻` vs `λ⁺ = λ⁻` (9670–9676); Tau Ceti squares named by lower-left points | holds | none |
| 15 | §3.13 filtered theory | Thm 13.2.9; §13.4; Prop A.8.1 | filtered quasi-isomorphism type invariant (OSSBOOK 10604); homotopy equivalences 11143–11180; equivalence of the two notions 15794 | holds | none |
| 16 | §4.1 blow-up headlines, weight formulas | `ε = −1`; general odd `ε`; shift by `mE_new`; zero framing; singular form | `s(s+1)/2`; `s(s−ε)/2`; `+ms` and constant `m(m−ε)/2`; band, `H₀ = 𝔽₂[U]`; `t(t+1)/2 + b`, `H₀ = 𝔽₂[U, U⁻¹]` | holds | none |
| 17 | §4.2 Némethi model | genus-one `(−1)`; genus-zero `(−1)`; singular pair | `K(E) = 1`, `χ = x(x−1)/2`, edge weight `0 + M¹(0) = 1`; `χ = x(x+1)/2`, `m_K = 0`; `χ` unbounded below | holds; Nem07 185–324, 576–583 | none |
| 18 | §4.3 spherical model | one vertex `(w, c)`; `w = c = −1`; zero framing; dictionary | exponents `max(0, ∓(c+w)/2)`; `1, 0`; faces cancel, `H₀ = H₁ = 𝔽₂[U]`; `f = −1 − x` vs native drops `max(0, ±(x+1))` | holds; OSS12 199–241, Zem21 400 | none |
| 19 | §4.4 integral model | `A₂` square; genus-one edge; zero framing | signed `∂∂ = 0`; unsigned `2U(0,0) − 2(1,0) − 2(0,1) + 2(1,1)`; exponents `1, 1`; `H₀ = ℤ[U]`, `H₁ = 0` | holds | none |
| 20 | §4.6 correction-term identity | `E₈`, canonical `K` | `(k+2l)² = k² − 8χ_k(l)` (Nem07 378); `K = 0`, `m_K = 0`, `(0 + 8)/4 = 2`; without `|V|`: `0` | holds | none |
| 21 | §4.7 Seifert plumbings | `Σ(2,3,5)` | `[2]`, `[2,2] = 3/2`, `[2,2,2,2] = 5/4`; `e = −2 + 59/30 = −1/30`; reversed sign `2 + 59/30 > 0` | holds | none |
| 22 | §5.3 `HF̂_st` of diagrams | `[𝔽,1]` vs `[𝔽²,1]`; `L(p,q)`; `S¹ × S²` | `dim V / 2^b`: `1/2` vs `1`; `p/2`; bigons cancel, `[𝔽²,1]`; Defs 1.1, 6.13, Thm 7.1, Cor 7.2 (OSS09 63, 2161, 2179, 2185) | holds | none |
| 23 | §5.5 `HF̂_st(Y)` | `S³`; `S¹ × S²` | convenient genus `≥ 2`, `|w| = 4g − 4`; `n = 1` on a diagram of `S³`; Def 1.2, Thm 1.3, 5.2, 2.3, 11.1 (OSS09 76, 80, 891, 245, 3486) | holds | none |
| 24 | §5.1 admissibility Check | basepoint in annulus; in a bigon | `B₁ − B₂` mixed signs; `2B₂ + A ≥ 0` | holds | none |
| 25 | §5.4 twisted complex | twice-pointed `S³` | `∂[x,n] = [y,n] + [y,n+1]`, `H = 𝔽` (OSS09 Ex. 9.3); class is `D_y + D − D_z` | holds | C03, N01 |
| 26 | Downstream consumers | GeometricTopology on main, lines 190–207 | adapter and Mazur `τ` formulas listed under Part II | owner misnamed | C05 |

- Source locators checked against the texts: OSSBOOK 41, OSS09 14, Nem07 12, OSS12 3, Zem21 3; every sampled target's locators were read.
- Tau Ceti at the pin, opened: `TauCeti.Bigraded.IsStablyEquiv` (Algebra/Bigraded/Stabilization.lean 172), `TauCeti.GridDiagram.XMarkingClass` (KnotTheory/Grid/Homology/NonTorsion.lean 162), `TauCeti.GridDiagram.torusLink` (KnotTheory/Grid/TorusLink/Basic.lean 106), `TauCeti.PlumbingGraph.signedLatticeDifferential` (LowDimTopology/Plumbing/Signed/Differential.lean 104, sign index counted from one, Cube/Orientation.lean 48); nine further signatures printed with `#check`.
- Cross-roadmap citations resolved on main: GeometricTopology §§4.1–4.4, 4.7.1, 5.1, 5.4.1, 6.2, 8.2 (the same headings stand at both open GeometricTopology heads); KhovanovHomology K7 (movie presentation theorem); MorseTheory Layers 1–2; HeegaardFloer §§6.1, 7.0, 7.6, 8.1–8.3, whose lane citations of this roadmap still resolve.
- Automatic checks: all pass on this head. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. Nothing outside the folder changes.
- Elaboration: `Suggested.lean` gives six `sorry` warnings and nothing else. On a copy, `simp`, `infer_instance` and `exact?` close none of the six theorems (the search returns only the file's own statements), and the pinned Alexander-graded theorem does not prove the bigraded one. The seven elaborated types match the README statements, with every binder explicit.
- Headlines: bigraded invariance of `GH⁻` and of `GĤ`, `|τ| ≤ u`, the Milnor conjecture, the two blow-up invariances are stated; the eight not statable are named in the module docstring with the missing carrier. No padding.
- Overlap check: read RibbonKnots (open), HeegaardFloer (main and its open head), GeometricTopology (main and both open heads), FourManifolds (open), KhovanovHomology (main). Cromwell's theorem and the grid edge: this roadmap (the open GeometricTopology head says so); the reconciliations with holomorphic theory: HeegaardFloer §8; link types, Seifert genus, one-variable Alexander polynomial, unknotting number, prime decomposition: GeometricTopology; movies: KhovanovHomology K7; the `E₈` plumbing and Fitting ideals: Tau Ceti; the multivariable Alexander polynomial: this roadmap only. Nothing has two owners.

Source independence: 16 passages compared with 5 sources (OSSBOOK, OSS09, OSS12, Zem21, Nem07), none shared beyond statement-forced phrases; largest share OSSBOOK, about 90 of about 180 locators (pattern count); contents compared with OSSBOOK: independent (Layer 3's sections cover Chapters 3–15 but not one to one and not in the book's order: §3.9 is Chapters 9–11 before §3.10, Chapter 8, and §3.12, Chapter 15, before §3.13, Chapters 13–14; §§3.1–3.7 are forced by their *Needs:* lines).

Research link: Layer 3 proves combinatorially the invariance and `τ` bounds of Manolescu–Ozsváth–Szabó–Thurston (2007) and Sarkar (2011), reproving Kronheimer–Mrowka's Milnor-conjecture theorem (1993); Layer 4 is Némethi's lattice cohomology (2008), identified with `HF⁻` by Zemke (2021); Layer 5 is Ozsváth–Stipsicz–Szabó's stable `HF̂` (2009). Rests on the README and the sources read.

## Not verifiable

- Torres, *On the Alexander polynomial*, Ann. of Math. 57 (1953): behind a paywall, not opened; the book attributes the theorem to it (OSSBOOK line 8397).
- arXiv:1301.0480 (sign assignments, §5.4), Manolescu–Ozsváth–Szabó–Thurston arXiv:math/0610559 (Theorems 4.2 and 6.1), Ozsváth–Szabó–Thurston arXiv:math/0611841, Gallais arXiv:0706.0089, Sarkar arXiv:1011.5265 and Juhász–Thurston–Zemke arXiv:1210.4996: outside the sample and not opened; each is cited beside a book locator that was read.

## Source issues

- **Gap** in OSSBOOK at Theorem 11.5.3, printed page 200: the source says Torres's symmetry follows from Corollary 11.4.3 and Theorem 11.6.1, but its proof of 11.6.1 uses 11.5.3 through Proposition 11.5.8; it should derive it from the unsymmetrized `det M(G)` identity and Corollary 11.4.3; affects the proof.
- **Gap** in Nem07 at Proposition 3.4.2, printed page 9: the source treats the blow-up at a smooth point and leaves the blow-up at an intersection point to the reader; it should give the retraction for the total transform adding `(x_i0 + x_j0)E_new`; affects the proof.

## For the human reviewers

- Arrangement: Layer 3's thirteen sections cover the scope of OSSBOOK Chapters 3–15 in nearly the book's order (exceptions: §3.9 before §3.10, §3.12 before §3.13). Judged below a finding: the map is not one to one and §§3.1–3.7 are forced by their *Needs:* lines.
- Licence: OSSBOOK was read from the authors' version on a Princeton author page; the README cites the AMS monograph "numbered as in the authors' version" (References, line 1550). Whether that numbering agrees with the printed volume was not checked.
