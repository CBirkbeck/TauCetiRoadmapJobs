# Review of GeometricTopology (pull request #903 at 8bd9871)

**Verdict:** accepted

Incremental re-review of the 22 lines changed since `69d384f` (`README.md` only: the Kauffman citation at `README.md:6020–6022` and the References bullet at `README.md:13430–13476`; `Suggested.lean` and every file outside the folder are unchanged). Every changed locator was opened in the cached texts and is right. The gate passes on my run, the dependency check reports no problem, the file elaborates with `sorry` as the only warning, and no finding remains: the one finding carried from the previous review (the pull-request description's order against #1517, #1791 and #1797) is settled by the repair reports, as explained under `## Previous findings`.

## Previous findings

- R01 — not repaired, settled: the description at `8bd9871` is byte-identical to the one at `69d384f` (65,465 characters; `grep -E '#[0-9]{3,4}'` prints nothing). The repair report of 2026-11-08 05:51 answers it with the reason "the pull-request description is not a file of the roadmap folder and this repair job may edit nothing outside `README.md` and `Suggested.lean`", and the report of 13:21 (H01–H04) states on the pull request the facts the finding asked for: #1517's change is covered by *Conventions* (`README.md:205–210`); #1791's three sentences hand material to the dropped names SurfaceTopology and PlanarTopology; #1797 at `a285fd7` replaces the folder; TeichmullerGeometry (#1169, Layer 3.1) and MordellLawrenceVenkatesh (#1231, LV.5 §§5.9, 5.11) still define `Mod` and the Dehn twist. The reason is right: nothing in the folder can carry that paragraph, and I cannot say why it fails, so the finding is not raised again. The human who approves reads the order from those comments; moving the paragraph into the description remains the author's edit, not a defect of the folder.

## Verified sound

**Gate and tools (my runs on `8bd9871`).**
- **Gate** (the brief's command): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate on this head also reports `build=0`.
- **Dependency check** (the brief's `--depcheck … --movable` command): `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @TauCetiRoadmap.GeometricTopology.<name>` appended for all 18 theorems: exit 0 in 16 s, exactly 18 `declaration uses sorry` warnings and 18 printed types, no other output. `git diff 69d384f..HEAD -- Suggested.lean` is empty, so the types are the ones the previous two reviews compared with the README (`annulus_conjecture : ∀ n, TauCeti.AnnulusConjecture n`, `rado_triangulation : TauCeti.TriangulationConjecture 2`, `moise_triangulation : TauCeti.TriangulationConjecture 3`, `manolescu_triangulation_conjecture_false : ∀ n, 5 ≤ n → ¬TauCeti.TriangulationConjecture n`, `alexander_sphere_bounds_ball : TauCeti.IsSphereBoundsBall ↑(Metric.sphere 0 1)`, and the rest), and the padding probe and headline list of the previous reviews stand.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GeometricTopology'` prints nothing; `changes.md` lists no file outside the folder.
- **Citations and overlaps:** `roadmaps resolve` finds no cross-roadmap citation and no Lean name found nowhere. The worker's `overlaps.md` at this head: no id this README cites is dropped by an open pull request; none is defined only by an open revision; the three anchors other roadmaps link to (`#layer-1-…`, `#layer-4-…`, `#the-smoothing-and-triangulation-comparison-far-horizon`) are mapped at `README.md:554–563`, as the previous review verified; the three conflicting heads are the subject of R01 above.

**The changed passages, checked against the texts.** The diff adds no object, target, section, Lean name or supplier: it changes one in-text citation and one References bullet. Each new locator was opened in the cache.
- **`README.md:6020–6022`, Kauffman's state-model paper (cache `dfbbafce`, the linked copy).** Proposition 2.5 is at lines 137–140 and states the curl factor `(−A³)` with `B = A⁻¹`, `d = −A² − A⁻²`; the proof of Theorem 2.6 (line 158) invokes it. The README's 4.5.4 computes the same factor from its own algebra: `ac + b = a(−a² − a⁻²) + a⁻¹ = −a³` and `bc + a = −a⁻³` (`README.md:5890`), and the writhe factor `(−a³)^(−e)` at `:5605`. Lemmas 2.3–2.4 (lines 116, 129), Proposition 2.7 (162) and Theorem 2.8 (179) are as the previous review verified. Journal data: the cached page 5 is headed 399, so the paper starts on page 395; Topology 26 (1987), 395–407 is right.
- **`README.md:13430–13434`, FYHLMO (cache `bf76c6c1`).** Printed page = cache page + 238: page 3 is headed 241 (line 84) and opens "The Freyd–Yetter approach" (line 88); page 4 is 242 (line 128) with "The Hoste approach" at line 150; page 5 is 243 (line 174) with "The Lickorish and Millett approach" at line 197; page 6 is 244 (line 222) with mutation (line 231), the pretzel permutation remark (line 234) and the two-tangle composition formula (line 240). So "pp. 241–244 (the three existence proofs, with the descending diagrams of pp. 242–243) and p. 244 (mutation, pretzel permutations and the composition formula)" is exact, and it agrees with the in-text "printed pp. 241–244" at `:6763`, "(pp. 242–243)" at `:6883` and "p. 244" at `:7136`.
- **`README.md:13434–13437`, Kauffman, *An invariant of regular isotopy*.** The in-text link at `:6617` is the author's page copy, which the worker's cache holds as an unreadable scan (`needs-references.toml`, `kauffman1990`), so the entry is cited by its bibliographic locator alone: Trans. Amer. Math. Soc. 318 (1990), 417–471 is the paper's published reference. The clause names what it is cited for (the skein and curl conventions), as the in-text sentence does.
- **`README.md:13438–13439`, Ng (cache `4590aeb8`).** §8.6 "Knot contact homology and other invariants" is at line 1613; lines 1627–1628 name 11a255 and 11a257 as alternating 11-crossing knots "from Conway's enumeration" with the same Kauffman polynomial, which is exactly what `:6604–6605` cites it for. Geom. Topol. 9 (2005), 247–297 is the published reference.
- **`README.md:13472–13473`, Kalfagianni (cache `c100b3de`, arXiv v3 of 10 Apr 2016, line 5).** §2 "The colored Jones polynomial" is at line 119 and Theorem 3.2 at line 232, as `:8633` cites them. Indiana Univ. Math. J. 67 (2018), 205–219 is the published reference.
- **`README.md:13474–13475`, Kolay (cache `cd8e1a35`, arXiv 1910.08044v1).** §4 "Coloring matrix" starts at line 115; Proposition 4 at lines 171–174 states that a square matrix over a commutative ring whose row sums and column sums all vanish has all its cofactors equal, which is the "all-ones dependency special case" `:7301` compares with. The arXiv number dates it to 2019.
- **`README.md:13475–13476`, Bode (cache `a5820d50`).** Title page: University of Bristol, July 2018 (lines 30–34). §2.1 "Knots and links" starts at line 440; Definition 2.2 (line 468) is isotopy by a continuous map, 2.3 (line 482) the same map smooth, 2.4 (line 487) smooth ambient isotopy, which is the continuous-versus-smooth distinction `:2704–2705` cites them for.

**Seeded sample.** Of the fifteen sampled targets (1.5, 1.7.1, 2.1, 2.3, 4.1, 4.2.7, 4.4.3, 4.4.5, 4.5.2, 4.6.5, 4.8, 4.10.3, 4.11.2, 8.3, 11.3), two cite a work the diff touches: 4.2.7 (`:2704–2705`, Bode §2.1, Definitions 2.2–2.4: verified above) and 4.6.5 (`:7135–7136`, FYHLMO p. 244: the composition formula `(1 − μ²)(S + T)_N = (S_N T_D + S_D T_N) − μ(S_N T_N + S_D T_D)` at cache line 240 is the one the section's `a = (D − μN)/(1 − μ²)`, `b = (N − μD)/(1 − μ²)` inverts). The other thirteen contain no citation of the six works and no Hatcher statement number; their locators were checked in earlier rounds and are untouched.

**Ownership and duplication.** Nothing new is owned, planned or consumed by the diff. Ownership against the open pull requests was checked through the worker's overlap index at this head and the previous reviews' `roadmaps show` of #271, #1169, #1231 and #1797; no other sibling checkout was opened this round.

**Adversarial table.** Rows for the changed passages are new, with values computed this round; the others are carried from the previous reviews (r69, r70) of statements the diff leaves untouched.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| 4.5.4 citation, Proposition 2.5 (`:6020–6022`, new) | `a = A`, `b = A⁻¹`, `c = −A² − A⁻²` | `ac + b = −A³ − A⁻¹ + A⁻¹ = −A³`; `bc + a = −A − A⁻³ + A = −A⁻³`; Kauffman lines 137–140 give `(−A³)`; right trefoil raw `−A⁵ − A⁻³ + A⁻⁷`, writhe 3: `(−A³)^{−3}·raw = A⁻⁴ + A⁻¹² − A⁻¹⁶` | right |
| References, FYHLMO pages (`:13430–13434`, new) | cache pages 3–6 | headers 241 (l.84), 242 (l.128), 243 (l.174), 244 (l.222); Freyd–Yetter l.88, Hoste l.150, Lickorish–Millett l.197, mutation l.231, pretzel l.234, composition l.240; in-text `:6763` 241–244, `:6883` 242–243, `:7136` 244 | consistent |
| References, Ng §8.6 (`:13438–13439`, new) | cache l.1613–1629 | 11a255, 11a257 from Conway's enumeration, equal Kauffman polynomials, `Aug_ab(·,7) = 1` vs `2`; `:6604–6605` cites exactly this | right |
| References, Kalfagianni (`:13472–13473`, new) | cache l.5, 119, 232 | v3; §2 colored Jones; Theorem 3.2 on a knot diagram; `:8633` cites §2 and Theorem 3.2 | right |
| References, Kolay Prop. 4 (`:13474–13475`, new) | `n × n`, row and column sums 0 | all cofactors equal (l.171–174); `:7301` "all-ones dependency special case" | right |
| References, Bode Defs 2.2–2.4 (`:13475–13476`, new) | cache l.468, 482, 487 | continuous isotopy; smooth isotopy; smooth ambient isotopy; `:2704` "continuous deformations vs smooth isotopy" | right |
| References, Kauffman 1987 data (`:13434–13436`, new) | cache page 5 header | 399 = 395 + 4; Topology 26 (1987) 395–407 | right |
| References, 3M ↔ 3Mfds clause (`:13382–13386`, r70) | every numbered statement of Ch. 1–3 | 3M 1.10/1.11–1.13/1.14–1.16 = 3Mfds 1.11/1.12–1.14/1.16–1.18; 3Mfds 1.10, Cor. 1.15 unnumbered in 3M | right |
| 4.6.3 descending convention, pp. 242–243 (`:6880–6885`, r70) | right trefoil | first encounters `O U O`, one bad crossing; switching gives an unknot, smoothing a Hopf link | right |
| `sphere_theorem`/`waldhausen_theorem` orientability (r69) | both pins | `358314d`: `Orientable` is `∃ A, IsOrientedAtlas`; `2fd255d9`: `IsOrientedAtlas.orientable` under `[IsManifold (𝓡 3) 1 M]` | equivalent at both pins |
| 8.1 Check, stereographic atlas of `S³` (r69) | `y ↦ y/|y|²` | `det = −|y|⁻⁶ < 0`; flipping `y₁` gives `+|y|⁻⁶` | right |
| 8.1 Check, `[0,1]` on `[0,∞)` (r69) | charts at `0`, `1` | increasing vs decreasing, no oriented atlas | right |
| 1.7.2 `Mod(D²)` (r69) | Alexander trick | `s f(x/s)` not `C¹` at `0`; Smale Thm 4 contraction smooth in the parameter | right |
| 3.4 Smale (r69) | Thms A, B, 4 | `smale1959` lines 8, 15, 124–129 | right |
| 11.2.1 vertex bound (r69) | `3F = 2E`, `E ≤ V(V−1)/2` | `V² − 7V + 6χ ≥ 0`: `χ = 2` gives `V ≥ 4`; `χ = 1` gives `V ≥ 6`; `χ = 0` gives `V ≥ 7` | right |
| 11.2.1 torus `Δ`-complex, octahedron (r69) | `1,3,2`; `6,12,8` | `χ = 0` not simplicial; `χ = 2` | right |
| 11.2.1 annulus twist, reflection, dimension four (r69) | `(θ + 2πsφ(t), t)`; `z ↦ −z`; `E₈` | winds once; degree `−1`; no smooth `E₈`, exotic `ℝ⁴` | right |
| 11.2.1 item 3 vs the pin (r69) | `TriangulationConjecture 2` | closed case only | right |
| 1.5 Checks (r69) | unit circle, `ε = 1`, `ε > 1`, circles `1/n` at `(3n,0)` | punctured disc `0 < |z| < 2`; `(x,−x) ↦ 0`; `9/4 < 3` | right |
| 4.4 Checks (r69) | trefoil, figure-eight, `T(2,5)` | `Δ(−1) = −3, 5, 5`; `T(2,n)`: `n` | right |
| 4.4.7 items 1–2, 5–7 (r69) | trefoil group, continuants, colourings | `φ²` conjugation by `C = xy`; `b⁵ = a²`; `C₄ = z³ + 2z`; `5₁` mod 5: `25`; antiparallel `L₄`: `∇ = −2z` | right |
| 4.4.9 Checks (r69) | `⟨x,y | xyx = yxy⟩` | `z = (xyx)²` central, `z ↦ 6`; `V(1) = 1`, `V(−1) = −3` | right |
| 4.4.9 vs 4.5.4 (r69) | right trefoil Jones | `t + t³ − t⁴`; skein with Hopf `−t^{1/2} − t^{5/2}` balances | consistent |
| 4.5.3 Clifford, Gauss sum, derivative, `W_K`, `ω`, Jones–Conway (r69) | `g_j⁸ = 1`; proper `L`; `t = 1`; `u₃ = e^{πi/3}`; `t = −1` | `(−√2)^{μ−1}(−1)^{Arf}`; `V'(1) = 0`; `W(i) = Arf`; `Δ(−1) ≡ 1, 5 mod 8`; `V(−1) = ∇(−2i)` | right |
| 4.5.4 algebra and state tables (r69) | `r₊r₋`, `(1,0,1)`, `ZMod 2`; trefoil, figure-eight, Hopf | `E ≠ I`; `c = 0`; brackets `A⁷ − A³ − A⁻⁵`, `A⁸ − A⁴ + 1 − A⁻⁴ + A⁻⁸`, `−A⁴ − A⁻⁴` | right |
| 4.6.3 Checks (r69) | `B₃` closures, kinked unknot | `a²b²`: 3 components, `(ab)²`: 1; `P(unlink₂) = −(l + l⁻¹)/m` | right |
| 4.6.5 composition formula (r69, re-read now) | `(S + T)_N`, `μ² ≠ 1` | `(1 − μ²)(S+T)_N = (S_N T_D + S_D T_N) − μ(S_N T_N + S_D T_D)`, cache l.240; kernel `{(a, −μa) : (1 − μ²)a = 0}` at `μ² = 1` | right |
| 4.7.2 Checks (r69) | `S₃`, `S₅`, `A₅` | orbit of length 3; orders `120`, `60` | right |
| 4.10.1 Checks (r69) | Conway products | `3`, `3/2`, `10/3`, `9/2`; figure-eight `5/2` | right |
| 4.15 tables (r69) | determinants, Fox factors | `3,5,5,7,9,…,21`; `T#F`: `ℤ/15`; `B`: `16`; `a₂` tree sums `3, −1` | right |
| 5.2 Checks (r69) | Hopf framings, `1/n` on `T(2,3)` | `L(5,2)`; Poincaré sphere `|π₁| = 120`; `Σ(2,3,7)` | right |
| 10.1, 11.3 Checks (r69) | Reeb, `T³`; `E8 × S¹`, `ΣP` | Reeb traps transversals; `Σ²P ≅ S⁵` | right |
| 4.2.4, 4.3.4 Checks (r69) | contraction, ears; compressions | `n − 3` ears; `g = 2`, `χ −1 → 1`, Hopf `β = 1` | right |
| Headlines (18) (r69, re-elaborated now) | `#check` types; one-tactic probe | 18 types as the README states; no statement changed | right |

**Library declarations.** None is newly cited by the diff; `Suggested.lean` and the supplier contracts are unchanged, so the previous reviews' list (`TauCeti.IsOrientedAtlas`, `TauCeti.TriangulationConjecture`, `TauCeti.IsSphereBoundsBall`, the plane-topology lemmas at `2fd255d9`, and the rest) stands, re-elaborated this round through the 18 `#check` types.

**Remarks on untouched text (no change requested).**
- The Kauffman 1990 entry carries no section or page locator, only the journal reference, because the only legal copy (the author's page) is an image scan the worker cannot read. The in-text sentence at `:6617` cites it for the skein and curl conventions, which the section computes itself.
- The pull-request description still names no conflicting pull request; the order facts live in the repair comments (see R01 above).

## Not verifiable

- **Kauffman, *An invariant of regular isotopy* (`kauffman1990`).** The cached copy from the author's page is image-only and this worker has no OCR; the entry is checked for its bibliographic data only. The manifest records it; it is listed in `needs-references.toml` by the worker.
- **Elaboration at Tau Ceti `2fd255d9`.** Lean runs only in the worktree, built at the branch pin `358314d`. `Suggested.lean` is unchanged since r69, whose static import-closure check at `2fd255d9` still applies.
- **Sources settled as uncertified or not readable legally** (Hirsch, Rourke–Sanderson, Farb–Margalit, Kauffman 1987 by DOI, and the rest): none is cited by a changed passage except Kauffman 1987, which was read in the linked copy.

## Source issues

- none
