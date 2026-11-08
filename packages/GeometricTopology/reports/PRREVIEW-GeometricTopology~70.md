# Review of GeometricTopology (pull request #903 at 69d384f)

**Verdict:** needs changes

Incremental re-review of the 9 lines changed since `091ed17` (`README.md` only; `Suggested.lean` and every file outside the folder are unchanged). The two locator findings are repaired and the repairs are correct against the texts. The description finding is not repaired and is the only remaining finding. It is P3 and not blocking.

## R01 (P3) — The description still states no order against #1517, #1791 and #1797, nor the repointing of the 1.7.2 consumers

**Location:** the pull-request description at `69d384f` (65,465 characters; the worker's quotation is cut at 20,368, so I read the full body read-only).

**Claim:** The overlap index, rerun on this head, still finds that #1517, #1791 and #1797 each conflict with this head in `TauCetiRoadmap/GeometricTopology/README.md`, and that #1517 and #1797 also conflict with it in `Suggested.lean`. The description names none of them and gives no rebase order. It also does not say that TeichmullerGeometry (§3.1) and MordellLawrenceVenkatesh (LV.5 §§5.9–5.12) are to cite Layer 1.7.2. `README.md:139–150` makes Layer 1.7.2 the single owner of mapping class groups and Dehn twists. TeichmullerGeometry at #1169 still defines `Mod±(Σ)` itself (`TeichmullerGeometry/README.md:302–312`, *Needs:* SurfaceTopology Layer 9, PlanarTopology Layer 8). This is the previous review's R03, still unrepaired. No repair report marks it as not actionable. The fix is an edit to the description, not to the folder.

**Witness:** `grep -E '#[0-9]{3,4}'` on the full body prints nothing. `grep -i -E 'Teichm|Mordell|1\.7\.2|1517|1791|1797'` prints nothing. The single `rebase` hit (body line 23) refers to the author's own repair commit.

**Repair:** add one paragraph to the description saying:
- #1517's change is covered by this head's *Conventions*.
- #1791's GeometricTopology changes are not to be merged after this head.
- Which of #1797 and this head is rebased onto the other, and which of #1797's GeometricTopology section ids this README keeps.
- #1169 (TeichmullerGeometry §3.1) and #1231 (MordellLawrenceVenkatesh LV.5) are to cite Layer 1.7.2 with its sign convention (the `T_c⁻¹` conversion Check at `README.md:150`).

## Previous findings

- R01 — repaired: `README.md:13382–13386` "the shorter `3M.pdf` on the same page lacks Lemma 1.10 and Corollary 1.15, so its Lemma 1.10 and Propositions 1.11–1.13 are this file's Lemma 1.11 and Propositions 1.12–1.14, and its Lemmas 1.14–1.16 are this file's Lemmas 1.16–1.18".
- R02 — repaired: `README.md:6882` "Freyd–Yetter–Hoste–Lickorish–Millett–Ocneanu (pp. 242–243)"; `README.md:6020` "Kauffman, §2, Lemmas 2.3–2.4, Theorem 2.6, Proposition 2.7 and Theorem 2.8".
- R03 — not repaired: the description at `69d384f` names no conflicting pull request and no order (raised again as R01).

## Verified sound

**Gate and tools (my runs on `69d384f`).**
- **Gate** (the brief's command): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head also reports `build=0`.
- **Dependency check** (the brief's `--depcheck … --movable` command): `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean TauCetiRoadmap/GeometricTopology/Suggested.lean` exits 0 with exactly 18 `declaration uses sorry` warnings (lines 71–214) and nothing else.
- **`#check @` of all 18 declarations** in a scratch copy: every type matches the previous review's and the README. Examples:
  - `sphere_theorem` and `waldhausen_theorem` take `∃ A, TauCeti.IsOrientedAtlas (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin 3))) ↑⊤ A`.
  - `rado_triangulation : TauCeti.TriangulationConjecture 2`.
  - `moise_triangulation : TauCeti.TriangulationConjecture 3`.
  - `manolescu_triangulation_conjecture_false : ∀ n, 5 ≤ n → ¬TauCeti.TriangulationConjecture n`.

  `git diff 091ed17..HEAD -- Suggested.lean` is empty, so the padding probe and the headline list of the previous review stand.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GeometricTopology'` prints nothing.
- **Citations and overlaps:**
  - `roadmaps resolve` finds nothing unresolved.
  - `roadmaps overlaps GeometricTopology`, rerun: no id this README cites is dropped by an open pull request, and no id is defined only by an open revision.
  - The three anchors that other roadmaps link to are mapped at `README.md:554–563`. This includes `#the-smoothing-and-triangulation-comparison-far-horizon`, cited by RiemannianGeometry at #1683 (`RiemannianGeometry/README.md:923`, item 1, mapped to Layer 11.3).

**The changed passages, checked against the texts.**
- **References, Hatcher's two numberings (`README.md:13379–13386`).** I compared the cached `3M.pdf` (`hatcher-3m`) with the cached `3Mfds.pdf` (cache `c8add1a8`) statement by statement (correspondences in the table below). The clause is exact. The two statements missing from `3M.pdf` are present there only as unnumbered text: the `S¹ × D²` example at `hatcher-3m` lines 560–575, and the model fiberings at line 756.
- **Passages that depend on the clause.** Every in-text Hatcher citation is already in the `3Mfds.pdf` numbering:
  - `:12368`: Proposition 1.13 and the remark after Theorem 3.8.
  - `:12584`: Proposition 1.12.
  - `:12586`: Proposition 1.13.
  - `:12624–12632`: Theorem 1.9, Lemma 1.11, Propositions 1.13–1.14, Lemmas 1.16–1.18. The contents are right: 1.16 makes essential annuli vertical, 1.17 makes the boundary restrictions of two fiberings isotopic, and 1.18 makes an atoroidal piece with an essential annulus Seifert fibred.
  - `:12588` cites Theorem 2.3, and `:12312` and `:12395–12410` cite Theorem 1.1, Proposition 1.4, Theorem 1.5 and Proposition 1.7. These carry the same labels in both files.
- **4.6.3 FYHLMO pages (`README.md:6880–6885`).**
  - The cached page 4 is headed "242" (cache `bf76c6c1` line 128) and carries the definition of a descending pointed ordered projection (lines 165–167).
  - Page 5 is headed "243" (line 174) and carries the reduction to split descending projections (lines 185–190) and Lickorish–Millett's ascending rule, first met as an underpass (lines 202–205).
  - The sentence uses both pages, so "pp. 242–243" is right. "First encountered as an overpass … never crosses over one's own earlier path" matches the source's definition, and "ascending is the opposite" matches lines 203–205.
- **4.5.4 Kauffman labels (`README.md:6020`).** Kauffman's §2 (cache `dfbbafce`, the linked file) has Lemma 2.3 at line 116 (type II with `AB = 1`, `d = −A² − A⁻²`), Lemma 2.4 at 129 (II implies III), Proposition 2.5 at 137 (curl factor `−A³`), Theorem 2.6 at 155, Proposition 2.7 at 162 (mirror, `A ↦ A⁻¹`) and Theorem 2.8 at 179 (`V_K(t) = f[K](t^{−1/4})`). The labels as written are right. The spacing slips (`Lemmas2.3`) are also gone.

**Seeded sample.** None of the fifteen sampled targets (1.5, 1.7, 1.7.1, 4.2.2, 4.2.10, 4.3.4, 4.3.5, 4.7.7, 4.10.2, 4.11.1, 4.15, 5.4, 6.2, 7.1, 11.4) lies in a changed passage. Each section's text contains no FYHLMO or Kauffman citation and no Hatcher statement number. 4.3.4 (`README.md:3873–3874`) cites Hatcher's *Notes* §1.1 (Prime Decomposition), which is the same section in both files and so unaffected by the clause. The sampled locators were checked in the previous rounds and are untouched.

**Ownership and duplication.** The diff introduces no object, name, section or supplier: it changes two locators and one bibliographic clause. On the consumer side of R01, TeichmullerGeometry at #1169 still plans `Mod±(Σ)` in its own §3.1. This roadmap is the earlier owner (TeichmullerGeometry is at merge-order line 284), so the change belongs in #1169, and the description should say so.

**Adversarial table.** The rows for the changed passages are new, with values computed this round. The other rows are carried from the previous review (r69) of the untouched statements, unchanged at this head.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| References, 3M ↔ 3Mfds clause (`:13382–13386`, new) | every numbered statement of Ch. 1–3 in both caches | Lemma 1.10 at 3M line 576 = 3Mfds Lemma 1.11 at line 681; Prop 1.11 (606) = 1.12 (707); 1.12 (703) = 1.13 (811); 1.13 (728) = 1.14 (837); Lemma 1.14 (761) = 1.16 (884); 1.15 (778) = 1.17 (915); 1.16 (790) = 1.18 (928). 3Mfds Lemma 1.10 (656) and Corollary 1.15 (880) are unnumbered in 3M. 1.1–1.9 carry the same labels (3M 43–531, 3Mfds 57–628), as do Ch. 2–3 (Thm 2.3 at 1072/1260, Thm 2.5 1249/1436, Thm 3.8 2152/2219). The remark after Thm 3.8 cites Prop 1.12 in 3M (2160) and 1.13 in 3Mfds (2229), as the clause predicts | right |
| 8.1, 8.4, 8.5 in-text Hatcher labels (`:12368`, `:12584–12588`, `:12624–12632`, new dependency) | 3Mfds cache | Prop 1.13 (811): irreducible unless `S¹ × S²`, `S¹ ×̃ S²`, `ℝP³ # ℝP³`; Prop 1.12 (707): essential surfaces vertical or horizontal; Lemma 1.11 (681): `∂`-incompressible or `∂`-parallel annulus; Lemmas 1.16/1.17/1.18 (884/915/928); Thm 1.9 (628) | right |
| 4.6.3 descending convention, pp. 242–243 (`:6880–6885`, new) | right trefoil, standard diagram | the traversal meets crossings `c₁ c₂ c₃ c₁ c₂ c₃` with `O U O U O U`. First encounters `c₁: O`, `c₂: U`, `c₃: O`, so one bad crossing (`c₂`). Switching `c₂` gives a descending diagram, an unknot; smoothing it gives a two-component Hopf link. The ascending rule flags `c₁, c₃` instead. Page headers 242 (line 128) and 243 (line 174) | right |
| 4.5.4 Kauffman labels (`:6020`, new) | right trefoil, raw `−A⁵ − A⁻³ + A⁻⁷`, writhe `+3` | Prop 2.7: `A ↦ A⁻¹` gives `A⁷ − A³ − A⁻⁵`, the README's mirror raw bracket. Thm 2.6: `(−A)^{−9}(−A⁵ − A⁻³ + A⁻⁷) = A⁻⁴ + A⁻¹² − A⁻¹⁶`. Mirror: `−A⁹(A⁷ − A³ − A⁻⁵) = −A¹⁶ + A¹² + A⁴ = f[K](A⁻¹)`. Thm 2.8 with `A = t^{−1/4}`: `t + t³ − t⁴`. Lemma 2.3: `d = −A² − A⁻²` is the README's `c = −a² − a⁻²` | right |
| `sphere_theorem`/`waldhausen_theorem` orientability (r69) | both pins | `358314d`: `Orientable` is by definition `∃ A, IsOrientedAtlas`; `2fd255d9`: `IsOrientedAtlas.orientable` under `[IsManifold (𝓡 3) 1 M]` | equivalent at both pins |
| 8.1 Check, stereographic atlas of `S³` (r69) | `y ↦ y/|y|²` | `det = −|y|⁻⁶ < 0`; flipping `y₁` gives `+|y|⁻⁶` | right |
| 8.1 Check, `[0,1]` on `[0,∞)` (r69) | charts at `0`, `1` | increasing vs decreasing, no oriented atlas; `Orientation/Interval.lean` signs `+1`/`−1` | right |
| 1.7.2 `Mod(D²)` (r69) | Alexander trick | `s f(x/s)` not `C¹` at `0`; Smale Thm 4 contraction smooth in the parameter | right |
| 3.4 Smale (r69) | Thms A, B, 4 | `smale1959` lines 8, 15, 124–129 | right |
| 11.2.1 vertex bound (r69) | `3F = 2E`, `E ≤ V(V−1)/2` | `V² − 7V + 6χ ≥ 0`: `χ = 2` gives `V ≥ 4`; `χ = 1` gives `V ≥ 6`; `χ = 0` gives `V ≥ 7`, `C(7,2) = 21` | right |
| 11.2.1 torus `Δ`-complex, octahedron (r69) | `1,3,2`; `6,12,8` | `χ = 0` with a repeated edge pair, so not simplicial; `χ = 2` | right |
| 11.2.1 annulus twist, reflection, dimension four (r69) | `(θ + 2πsφ(t), t)`; `z ↦ −z`; `E₈` | winds once; degree `−1`; no smooth `E₈`, exotic `ℝ⁴` | right |
| 11.2.1 item 3 vs the pin (r69) | `TriangulationConjecture 2` | closed case only | right |
| 1.5 Checks (r69) | unit circle, `ε = 1`, `ε > 1`, circles `1/n` at `(3n,0)` | punctured disc `0 < |z| < 2`; `(x,−x) ↦ 0`; `9/4 < 3` | right |
| 4.4 Checks (r69) | trefoil, figure-eight, `T(2,5)` | `Δ(−1) = −3, 5, 5`; `T(2,n)`: `n` | right |
| 4.4.7 items 1–2, 5–7 (r69) | trefoil group, continuants, colourings | `φ²` conjugation by `C = xy`; `b⁵ = a²`; `C₄ = z³ + 2z`; `5₁` mod 5: `25`; antiparallel `L₄`: `∇ = −2z` | right |
| 4.4.9 Checks (r69) | `⟨x,y | xyx = yxy⟩` | `z = (xyx)²` central, `z ↦ 6`; `V(1) = 1`, `V(−1) = −3` | right |
| 4.4.9 vs 4.5.4 (r69) | right trefoil Jones | `t + t³ − t⁴`; skein with Hopf `−t^{1/2} − t^{5/2}` balances | consistent |
| 4.5.3 Clifford, Gauss sum, derivative, `W_K`, `ω`, Jones–Conway (r69) | `g_j⁸ = 1`; proper `L`; `t = 1`; `D = (1−t³)(1−t)`; `u₃ = e^{πi/3}`; `t = −1` | `(−√2)^{μ−1}(−1)^{Arf}`; `V'(1) = 0`; `W(i) = Arf`; `Δ(−1) ≡ 1, 5 mod 8`; `V(−1) = ∇(−2i)` | right |
| 4.5.4 algebra and state tables (r69) | `r₊r₋`, `(1,0,1)`, `ZMod 2`; trefoil, figure-eight, Hopf | `E ≠ I`; `c = 0`; brackets `A⁷ − A³ − A⁻⁵`, `A⁸ − A⁴ + 1 − A⁻⁴ + A⁻⁸`, `−A⁴ − A⁻⁴` | right |
| 4.6.3 Checks (r69) | `B₃` closures, kinked unknot | `a²b²`: 3 components, `(ab)²`: 1; `P(unlink₂) = −(l + l⁻¹)/m` | right |
| 4.7.2 Checks (r69) | `S₃`, `S₅`, `A₅` | orbit of length 3; orders `120`, `60` | right |
| 4.10.1 Checks (r69) | Conway products | `3`, `3/2`, `10/3`, `9/2`; figure-eight `5/2` | right |
| 4.15 tables (r69) | determinants, Fox factors | `3,5,5,7,9,…,21`; `T#F`: `ℤ/15`; `B`: `16`; `a₂` tree sums `3, −1` | right |
| 5.2 Checks (r69) | Hopf framings, `1/n` on `T(2,3)` | `L(5,2)`; Poincaré sphere `|π₁| = 120`; `Σ(2,3,7)` | right |
| 10.1, 11.3 Checks (r69) | Reeb, `T³`; `E8 × S¹`, `ΣP` | Reeb traps transversals; `Σ²P ≅ S⁵` | right |
| 4.2.4, 4.3.4 Checks (r69) | contraction, ears; compressions | `n − 3` ears; `g = 2`, `χ −1 → 1`, Hopf `β = 1` | right |
| Headlines (18) (r69, re-elaborated now) | `#check` types; one-tactic probe | types as the README states; no statement changed | right |

**Library declarations.** None is newly cited by the diff. The previous review's list (`TauCeti.IsOrientedAtlas`, `TauCeti.Orientable`, `TauCeti.TriangulationConjecture`, the plane-topology lemmas at `2fd255d9` and the rest) stands, since `Suggested.lean` and the supplier contracts are unchanged.

**Remarks on untouched text (no change requested).**
- Kauffman's *State models and the Jones polynomial*, Topology 26 (1987), 395–407, has no entry under References. The link at `:6020` is its only bibliographic trace.
- Proposition 2.5 (the curl factor `−A³`) is not among the labels at `:6020`, although 4.5.4's curl laws are its content. Those laws are computed independently in the section.

## Not verifiable

- **Elaboration at Tau Ceti `2fd255d9`.** Lean runs only in the worktree, built at the branch pin `358314d`. `Suggested.lean` is unchanged since the previous review, whose static check at `2fd255d9` (imports present, carriers unchanged) still applies.
- **Sources settled as uncertified or not readable legally** (Hirsch, Lickorish GTM 175, Rolfsen, Calegari, Lee, Munkres, Burde–Zieschang, Whitehead 1940, Rourke–Sanderson, Farb–Margalit): none is cited by a changed passage.
- **Manifest:** the three texts read for the changed passages (FYHLMO from the AMS open archive, Kauffman from Ranicki's page, Hatcher's `3Mfds.pdf` from the author's page) are in the worker's cache but have no key in the board's `sources.toml`. This review edits no manifest.

## Source issues

- none
