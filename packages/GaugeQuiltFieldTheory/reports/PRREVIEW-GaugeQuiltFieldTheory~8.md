# Review of GaugeQuiltFieldTheory (pull request #2577 at e5a7b31)

**Verdict:** accepted

**Summary.** Accepted. All five points of the previous review are repaired. §3.1 now states one-parameter Cerf theory on compact triads and the Gay–Kirby connected-level-set homotopy as its own targets. Their locators check out at the text (Cerf, Chapter I §3.1, p. 24; Gay–Kirby, Theorem 1.4 and Definitions 2.2–2.3), and HeegaardFloer §1.5 (M.5) supplies the closed case. The new route agrees with Wehrheim–Woodward's remarks on Theorem 2.2.11. There is one small correction (the codimension-one statement of §3.1 names its ambient space ambiguously) and one format note, none blocking. Nothing is left for a human to decide.

## C01 — The codimension-one statement of §3.1 gives its ambient space as "the union of the two strata", which can be read as the birth and crossing strata themselves

An implementer who formalizes this needs the space in which the codimension-one functions form a submanifold. In the first bullet of §3.1 (line 272), "the two strata" has no antecedent, and the nearest two classes are the birth and crossing functions. On that reading, the sentence says that a set is a codimension-one submanifold of itself. Cerf's property 1° (cerf-stratification line 744, printed p. 24) says that the codimension-one functions form a submanifold of codimension one of the excellent functions together with the codimension-one functions, an open subset of the whole function space. A possible wording: "…; together they form a submanifold of codimension one of the open set of functions of codimension at most one (the excellent functions together with these)".

## N01 — The connected-level-set target of §3.1 (line 273) names no route; Gay–Kirby prove the `[0,1]`-valued case by Lemma 4.10 (fibre-connected homotopies to ordered functions) followed by Theorem 4.5 (ordered generic homotopies, fibre-connected when `m ≥ 3`), gay-kirby-morse2 lines 1944–1953, which the bullet could name.

## Questions for the author

- This repeats a question from the previous review that the change leaves open. §4.3 (line 338) still ends with "Concatenation remains the object operation when such geometric replacement is unavailable". The repaired Check of §4.2 now reads `F_L` as concatenation throughout, as the definition in §4.2 (line 324) does. Is geometric composition ever the object operation of `F_L`? If not, that clause of §4.3 could go; if so, the definition in §4.2 should say when. I could not settle which reading the layers intend.

## Previous findings

- R01 — repaired: "The comparison of two decompositions rests on two theorems about a compact triad `(W; V₀, V₁)` … Both are targets here." The *Needs* line adds HeegaardFloer §1.5 (M.5), Cerf, Chapter I §3.1, and Gay–Kirby, Theorem 1.4.
- C01 — repaired: "If `Y` is an elementary bordism between surfaces of positive genus, a cylinder or a single one- or two-handle, restricting connections to the two ends embeds the moduli of `Y` as a compact, simply connected, relatively spin Lagrangian correspondence".
- C02 — repaired: "By concatenation it sends the length-zero object of `C(pt)` to the length-one sequence `(pt)`, a different object, so it is not the identity functor; it represents the identity of `C(pt)` in `A∞(4)/S`."
- C03 — repaired: "Theorem 1.2 is stated for spin correspondences and only remarks that the relatively spin case shifts the background class, so the relatively spin comparison is proved here, with the composed relative-spin lift of §2.4". §2.4 is added to the *Needs* line.
- N01 — repaired: "both sides of `c₁ = 2r[Ω]` vanish" (§1.4, line 111; `Ω` is defined in Conventions 3, line 15).

## Verified sound

| statement | instances tried | values computed on each side | result |
|---|---|---|---|
| §3.1 one-parameter Cerf theory (Cerf Ch. I §3.1, 1° and 2°, p. 24; GK Def. 2.3) | birth normal form in direction `x_(k+1)`; convexity of the function space | `x³ − t x`: critical points `±√(t/3)`, second derivative `±6√(t/3)`, indices `k`, `k+1`; convex combinations keep `f⁻¹(0)=V₀`, `df≠0` on `∂W` | holds; Cerf line 744: submanifold of `F⁰∪F¹` (C01) |
| §3.1 density of generic paths | Cerf's "bons chemins" (line 511) against "transversally" | Cerf: finitely many topological crossings, `C⁰`-dense (line 747); smooth transverse paths are also dense | true as stated |
| §3.1 connected level sets (GK Thm 1.4, lines 65–78) | local minimum at level `c∈(0,1)`, `V₀,V₁≠∅`; `m=2`; births in `m=3` | `f⁻¹(c)` has isolated `{p}` plus a separating component: disconnected; GK needs `m>2`; `(0,1)`, `(2,3)` births make extrema, so only `(1,2)` | holds; indefinite follows |
| §3.1 route (WW Remark 2.2.3; remarks on Thm 2.2.11) | Morse datum against GK's hypotheses | WW lines 195–202: connected level sets, distinct critical values = GK fibre-connected Morse; lines 238–239, 398–422 give each step | supports the text |
| §3.1 *Needs*: HeegaardFloer §1.5 (M.5) | main and open revision | main line 467, Layer 1 (line 215); lines 532–548: owns one-parameter Cerf theorem, `x₁³/3 ± (t−t₀)x₁ − …`, closed manifolds; revision line 566 | resolves |
| overview, elementary correspondences (§2.1) | `r=2`, one-handle `g=1→2`; sphere one-handle; two handles from genus `g` | `dim M(Q)=3=(0+6)/2`, `S³` simply connected; sphere end gives `∅`, excluded; compression bodies no longer claimed | matches §2.1 |
| §1.4 Check | `r=1` | moduli a point: `c₁=0`, `[Ω]=0`; `Ω` defined in Conventions 3 | holds |
| §4.2 rank-one Check | `F_pt` on `C(pt)`; zero functor | `()` ↦ `(pt)`, length `0→1`; isomorphic to `id` in `H⁰Fun` (§4.4, line 350); zero functor sends `id_(pt)`, a class in `HF(pt,pt)=ℤ`, to `0` | holds |
| §4.3 MWW Theorem 1.2 | spin hypothesis; handle `L₂` at `r=2, d=1, g=2→3` | mww lines 90–95 assume spin, 96–97 remark on relative spin; `w₂(L₂)≠0` (§2.3), so the relative version is needed; §2.4 lift at line 220 | holds |
| `Suggested.lean` (unchanged) | `#check @` of five declarations | `1 ≤ r`, `IsPrimitiveRoot ζ r`, `1 ≤ g` for simple connectivity, as in README §1.2 | no binder lost |

The rows for the untouched statements stand as in the previous review, of `1b98d46`.

- Source locators read at their lines: 11. cerf-stratification lines 672–679, 702–710, 731–751 and 508–513 (printed pp. 22–24, 18); gay-kirby-morse2 lines 50–78, 271–278, 288–337, 1367–1373, 921–926 and 1944–1953; ww-coprime lines 195–202, 233–239 and 383–422; mww-functors lines 90–97.
- Cross-roadmap citations resolved: HeegaardFloer §1.5 (M.5), on main and at its open revision; GaugeQuiltFieldTheory §2.4 (line 220) for the composed lift.
- Ownership of the new targets: Cerf and Gay–Kirby searched in every roadmap on main and at every open head. HeegaardFloer M.5 covers closed manifolds, and its M.5a only Morse homology of a single function on a cobordism. FourManifolds has four-dimensional pseudo-isotopy Cerf families, and CombinatorialHeegaardFloer has Heegaard-diagram moves. GeometricTopology has Cerf's `Γ₄ = 0`, and MorseTheory single functions only. No roadmap states Cerf theory on triads or the Gay–Kirby theorem.
- Overlap check: read InstantonFloerTheory, FukayaTheory, HeegaardFloer (main and its open revision), DGFloer and FourManifolds, as in the previous review, and for the new targets MorseTheory, GeometricTopology and CombinatorialHeegaardFloer. One-parameter Cerf theory on closed manifolds is HeegaardFloer's and is cited. Its compact-triad and connected-level-set forms are owned here (§3.1). Nothing else is shared.
- Automatic checks: all passed, and a rerun of the gate on this head passed every check. Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration of `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean`, unchanged since `1b98d46`: three `declaration uses sorry` warnings (lines 59, 67, 78) and nothing else.
- Pull request text: the description agrees with the head. It lists the two §3.1 targets, the M.5 contract and the repairs of §4.2 and §4.3. Its count of 39 Checks matches the head (36 on main).

Source independence: changed passages only. 9 passages were compared with 4 sources (cerf-stratification, gay-kirby-morse2, ww-coprime, mww-functors); only formulas, standard names and statements of a dozen words are shared. Cerf's density statement is restated with the README's own description of good paths, not translated clause by clause. The largest share is still ww-coprime, about three quarters of the locators, and the change adds 3 Cerf and 4 Gay–Kirby locators. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 1 is the coprime surface moduli whose rank-two case Daemi–Fukaya–Lipyanskiy (2021) use for their Atiyah–Floer comparison, consumed by InstantonFloerTheory IF9. Layers 2–5 are Wehrheim–Woodward's connected Floer field theory (arXiv 2016, v2 2018), built on Ma'u–Wehrheim–Woodward's `A∞` functors (2018) and, in §3.1, on Cerf (1970) and Gay–Kirby (2015). This rests on the README and on the sources read.

## Not verifiable

- Atiyah–Bott (1983), Theorem 9.12: paywalled; the README cites it only as cited in Wehrheim–Woodward's proof (ww-coprime line 1266).
- Drezet–Narasimhan (1989): mentioned only as cited in Wehrheim–Woodward's proof of Proposition 3.3.2 (ww-coprime line 1220).
- The theorem numbering of the published Gay–Kirby (Geom. Topol. 19, 2015) was not read. The README states that it cites the numbering of arXiv v5, which was read.

## Source issues

- none

## For the human reviewers

- none
