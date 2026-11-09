# Review of TeichmullerGeometry (pull request #1169 at 9e49e59)

**Verdict:** needs changes

This is an incremental re-review of the 33 lines that changed since `8883653`. All of them are in `TauCetiRoadmap/TeichmullerGeometry/README.md`; `Suggested.lean` and every file outside the folder are unchanged. All four previous findings are repaired. One new P3 finding comes from the repair of the previous R01.

## R01 (P3) — §2.2 now states a coarse-map theorem that only Layers 3.3 and 8.5 can prove

**Location.** `TauCetiRoadmap/TeichmullerGeometry/README.md`:
- line 427, §2.2: "once Layer 3.3 proves proper discontinuity, the coarse forgetful map `Teich(Σ) → Teich(Σ)/Mod⁺(Σ)` is a local homeomorphism at a point exactly when its stabilizer acts trivially near it … and Layer 8.5 identifies the points of the first kind";
- line 433, §2.2 Check 3, which tests that statement;
- line 435, §2.2 *Needs:* "ComplexCurveModuli D4 item 4; ComplexCurveModuli D3 item 6; §2.1; §0.5.";
- line 467, Layer 2 Dependencies: "Layer 2 consumes Layers 0 and 1, … It supplies … to Layers 3 and 7 to 11."

**Claim.**
- **The mathematics is correct.** See row N2 of the table.
- **The statement is in the wrong place.** Its inputs are all later layers:
  - `Mod⁺(Σ)` (§3.1);
  - the coarse quotient and proper discontinuity (§3.3);
  - stabilizer = `Aut(X)` (§5.6);
  - the fixed-locus dimension (§8.4);
  - the genus-two kernel (§8.5).
- **The build order breaks.** None of these inputs is in §2.2's *Needs:* line. They cannot be added there either: Layers 3 and 8 both consume Layer 2, so adding them would create layer cycles. The README's own rule at line 114 requires every *Needs:* line to list what a target's statement uses.
- **The criterion has no other owner.** No other subsection states it:
  - §3.3 defines the coarse quotient but does not say where the quotient map is a local homeomorphism.
  - §8.5 only says "Descend the loci to the moduli groupoid and the coarse quotient."
- **Where the wording came from.** The previous report's suggested wording for this line also cited Layer 8.5 from §2.2, so the defect started there.

**Witness.** §3.3 (line 497) is where "Define the oriented moduli orbifold … and its coarse quotient" appears, after §2.2. §8.5's *Needs:* line (846) already lists §3.3, §8.4 and §5.6, which is everything the statement needs.

**Repair.**
- **Line 427:** stop the sentence after "The automorphisms of a point in this groupoid form its stabilizer." Delete "once Layer 3.3 proves … for `g = 2`".
- **§3.3, line 497:** after "the isotropy at a point is its stabilizer, identified in Layer 5.6", add: "The coarse quotient map `Teich(Σ) → Teich(Σ)/Mod⁺(Σ)` is a local homeomorphism at a point exactly when its stabilizer acts trivially on a neighbourhood of it, and is branched at every other point."
- **§8.5, line 838:** replace "Descend the loci to the moduli groupoid and the coarse quotient." with "Descend the loci to the moduli groupoid and the coarse quotient; by Layer 3.3 the coarse quotient map is a local homeomorphism exactly at the points with `Aut(X) = 1` for `g ≥ 3` and with `Aut(X) = ⟨h⟩` for `g = 2`."
- **Line 433:** move this Check to §8.5's Checks.

**Re-test.** After the move:
- §3.3 proves its sentence from its own proper discontinuity.
- §8.5 gives the same values, `1` at a genus-two point with `Aut(X) = ⟨h⟩` and `24` at the Bolza curve, with inputs its *Needs:* line already lists.
- §2.2's remaining statements need only what line 435 lists.

## Previous findings

- R01 — repaired: line 419 now gives the count as "`|Aut(X)/K_X|`-to-one", with `K_X = ⟨h⟩` in genus two and trivial for `g ≥ 3`. Line 433 now reads "the coarse forgetful map is injective near the point, `h` fixing every point of `Teich(S_2)`". The repair introduced the new R01 above.
- R02 — repaired: line 110 now reads "§10B (for a nonempty connected compact Riemann surface `X`: the divisor Riemann–Roch formula `χ(𝒪(D)) = deg D + 1 − g_an` … the equality of `g_an` with the topological genus)". Lines 30, 39 and 451 now cite "ModularForms §10B".
- R03 — repaired: lines 994–998 now read "Three objects that consumers of this roadmap use with it are supplied elsewhere and only read here:", followed by the `Isom(ℍ)`, `Γ(O)` and `π/21` bullets. The `T0`–`T10` and "Layer 4.1" bullets are gone.
- R04 — repaired: line 1007 now reads "Theorem 6.4 a) (… p. 101; the statement asks orientation preservation of the plane and the open and closed cylinders and needs it of the closed disc as well … so the roadmap applies it only to closed surfaces …)".

## Verified sound

### Mechanical checks at `9e49e59`

- **Gate.** The brief's gate command exits 0:

  ```text
  gate TeichmullerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run of the gate also reports `build=0`.
- **Dependency check.** The brief's command exits 0 and prints no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. Its only diagnostics are 21 "declaration uses `sorry`" warnings.
- **`#check @name`.** One scratch file checked all 52 declarations; it exits 0 with no error. `signatures.md` has 55 entries, but three of them, `groups`, `group` and `and`, are docstring words. `Suggested.lean` is byte-identical to `8883653`, so the previous report's binder comparison and padding probe still apply. Nothing in the file was changed.
- **Folder contents.** No files changed outside the folder. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Overlaps.** `overlaps.md` reports no dropped ids and no conflicting pull request. The 15 entries under "Lean names found nowhere" in `citations.md` are this roadmap's own names, all declared in `Suggested.lean`; the previous report checked them.

### Changed passages checked

- **§2.1 Check 1 (line 419).**
  - The orbit identification and the `|Aut(X)/K_X|` count are correct.
  - So is the identification of `K_X` from §§8.4–8.5. An element acting trivially on an open set has a fixed locus of full dimension, which §8.5 shows lies in the kernel: trivial for `g ≥ 3`, `⟨h⟩` for `g = 2`.
  - Its use of Layer 8.5 is a test value, not an input to §2.1's statements. Values are in row N1.
- **§2.2 (line 427).**
  - The criterion holds in both directions (row N2).
  - The identification follows from §8.4's dimension formula and §8.5's kernel.
  - Its placement is R01.
- **ModularForms §10B on main.** The citation at lines 30, 39, 110 and 451 resolves:
  - the heading is at line 1173, with "nonempty connected compact Riemann surface" at line 1175;
  - divisor Riemann–Roch with `g_an = dim H¹(X, 𝒪)` is at lines 1206–1207;
  - the perfect residue pairing `H¹(X,L)×H⁰(X,K⊗L⁻¹)→ℂ` is at lines 1213–1214;
  - `g_an` equals the topological genus at line 1228.
  - ComplexCurveModuli D0 item 2 (main, line 48) consumes "ModularForms10B's already owned cohomological divisor RR", matching "consumed only through ComplexCurveModuli D0 item 2".
- **Epstein (§5.4 line 621; References line 1007).**
  - epstein1966 lines 604–607, printed p. 101: Theorem 6.4 asks orientation preservation only of a plane, a closed cylinder or an open cylinder.
  - Theorem 6.3 is at lines 533–535, p. 99. Its proof runs through line 603, p. 101.
  - Line 637, p. 102, reduces 6.4 to 6.3 for compact surfaces with empty boundary.
  - The paraphrase "on a closed surface is Theorem 6.3 with empty boundary, pp. 99–101, and asks no orientation hypothesis" is therefore exact.
  - The claimed scope is accurate. 6.4 a) is used at line 180 (§0.0d, closed surfaces) and at line 621 (§5.4). Line 257 (§0.0h) uses it through the PL isotopy theorem, whose inputs are already isotopic to the identity.
- **Downstream consumers (lines 994–998).**
  - The searches for citations of the dropped ids find nothing. The patterns were `'Teichm(ü|u)ller[^.]{0,40}\bT(0|3|4a|5|7|8|9|10)\b'` and `'Teichm(ü|u)ller(Geometry)?[^.]{0,30}Layer 4\.1'`; both print "no match on main or in any open roadmap pull request".
  - The ids other roadmaps cite still exist here:
    - QuaternionArithmetic cites §9.1 (lines 84, 260, 1659, 1661, 1835, 2347);
    - GroupActionsOnRiemannSurfaces cites §§3.3, 5.6, 8.4 and 10.1 (lines 315, 331, 390, 1015, 1159, 1300).
  - The kept bullets resolve:
    - ArithmeticFuchsianGroups at its head `b98ed29`: §1.1 at line 375, §1.4 at 701, §3.1 at 1143 (`existsUnique_pgl_smul_eq_isometryEquiv`);
    - FuchsianOrbifolds at its head `f997c5f`: Layer 4a at line 734;
    - Tau Ceti: `TauCeti/Data/Rat/BranchDeficit.lean:116` and `:196` at the pin.

### Seeded sample

- **The sampled targets in or cited by the diff.**
  - §2.2 is in the diff. Its suppliers resolve on main: ComplexCurveModuli D4 item 4 at line 114 and D3 item 6 at line 103. Its statements are checked in rows N2 and N3.
  - §3.3 and §8.5 are cited by the new §2.2 text. Their suppliers resolve on main: ComplexCurveModuli D0 item 5 at line 51, D3 item 5 at line 98 and D0 item 2 at line 48.
  - §8.5's case analysis is row S13, carried below.
  - None of the three cites an external source.
- **The rest of the sample.** §§0.0c, 0.0g, 0.4, 4.3, 5.1, 7.2, 7.4, 7.5, 8.3, 8.4, 9.1 and 10.3 are untouched by the diff. The full review at `8883653` passed them (rows 7, 14, C1, C3, S1, S11, S12, S13 below and its source checks of hatcher2002 and takeuchi1975). I did not re-read them.

### Adversarial table

Rows N1–N6 cover the changed statements, with values computed in this review. The other rows are carried from the previous report (r19, at `8883653`); their statements are unchanged at `9e49e59`. N1–N3 replace r19's row S6, and N4–N6 replace r19's rows D2, D3 and D1.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| N1 | §2.1 Check 1: the unmarked chart is `|Aut(X)/K_X|`-to-one | genus two with `Aut(X) = ⟨h⟩`; Bolza `y² = x⁵ − x`; genus-three hyperelliptic with `Aut(X) = ⟨h⟩`; generic quartic | `h` is `−1` on `H⁰(K) = ⟨dx/y, x dx/y⟩`, so `+1` on `H⁰(K²) = Sym²` (dim 3 = 3), `K_X = ⟨h⟩`, count `2/2 = 1`; Bolza `|Aut| = |GL₂(𝔽₃)| = 48`, image `S₄` on `{0,∞,±1,±i}`, count `48/2 = 24`; genus three: `x^k dx²/y²` (`k = 0..4`) span the 5-dim invariant part of the 6-dim `H⁰(K²)`, anti-invariant line `dx²/y`, count `2/1 = 2`; quartic `1/1 = 1`; counting by `|Aut|` gives `2, 48, 2, 1` | true | none |
| N2 | §2.2: the coarse map is a local homeomorphism at `x` exactly when `G_x` acts trivially near `x` | proof in both directions; `SL₂(ℤ)` on `ℍ`; genus two; genus-three hyperelliptic | (⇐) take `V` invariant under `G_x` with `gV ∩ V = ∅` for `g ∉ G_x`; `π|V` is injective and open. (⇒) for `g ∈ G_x` and `y ∈ W ∩ g⁻¹W`, `π(y) = π(gy)` forces `gy = y`; generic `τ`: `Stab = {±I}` acts trivially, local homeomorphism; at `i`: `⟨S⟩` of order 4, effective order 2, 2-to-1, branched; `⟨h⟩` in genus two: local homeomorphism; genus-three `⟨h⟩` fixes only a 5-dim locus: branched, matching "`Aut(X) = 1` for `g ≥ 3`" | true; needs §§3.1, 3.3, 5.6, 8.4 and 8.5 | R01 |
| N3 | §2.2 Check 3 | the same two genus-two points | injective near `⟨h⟩`, against an `|Aut|` count of `2`; Bolza `24` against `48` | true | moves with R01 |
| N4 | ModularForms §10B citation (lines 30, 39, 110, 451) | `ℙ¹` with `D = −2P`; genus one with `𝒪` | `χ = −2 + 1 − 0 = −1 = 0 − 1`; `χ = 0 + 1 − 1 = 0 = 1 − 1`; matches §10B's Checks (main, lines 1220–1222) | true | none |
| N5 | Epstein 6.4 a) locator and scope (lines 621, 1007) | closed disc with `z̄`; PL isotopy input `g⁻¹f` | `(1−t)z̄ + tz` stays in the disc, so the maps are homotopic; on `S¹` the degree is `−1` against `+1`, so not isotopic; `g⁻¹f`, isotopic to `id`, has local degree `+1`, so it meets the orientation hypothesis | true | none |
| N6 | Downstream consumers (lines 994–998) | searches for citations of `T0`–`T10` and "Layer 4.1"; §9.1 and §10.1 citers | 0 matches on main and at the 469 open heads; §9.1 is cited 6 times (#1722) and §10.1 several times (#1728); every kept supplier id resolves at its head | true | none |
| 1 | `image_boundary` (§0.0b) | half-plane at `0` and `(1,0)`; disc vs sphere | `0` lies on the boundary and `(1,0)` in the interior; `∂D² = S¹ ≠ ∅ = ∂S²` | true (r19) | none |
| 2 | `exists_pl_approximation_open`, `_halfPlane` | `φ = 1/(1+‖x‖)`; `φ = 1/q`; `f = (x₀, x₁+x₀²)` | `φ ≥ 1/(2+‖x‖)` on `B(x,1)`; the infimum of `1/q` is `0`, so it is excluded; `f(0,t) = (0,t)` | true (r19) | none |
| 3 | `isotopic_of_homotopic_closedSurface`, `isotopicRel_of_homotopicRel` | disc with `z̄`; Klein bottle with `(x,−y)` | on the disc both hypotheses fail; `f_t = (x+t/2, y)` commutes with `τ` | true (r19) | none |
| 4 | schema words, `StandardSurface.eulerChar` | `aa⁻¹`, `aa`, `aba⁻¹b⁻¹`, `orientable 0 2` | `χ = −2, −1, 0` by `decide`; annulus `3−4+1 = 0` | true (r19) | none |
| 5 | classification, `homeomorph_iff_invariants`, `homeomorph_unique` | `T²`, `S₂`, Klein bottle, annulus | `(0,y,0)`, `(−2,y,0)`, `(0,n,0)`, `(0,y,2)` | true (r19) | none |
| 6 | `Surface.genus`, `eulerChar_eq_two_sub_two_mul_genus` | `S²`, `T²`, `S₂`, Klein bottle | `χ = 2, 0, −2`; the Klein bottle has `χ = 0 ≠ −2` and is excluded by `ho` | true (r19) | none |
| 7 | `IsBranchedCover`, `exists_degree`, `riemannHurwitz` (§0.0g) | `zⁿ` on the sphere and disc; `S² → ℝP²` | `2 = 2n − 2(n−1)`; `1 = n − (n−1)`; `2 = 2·1` | true (r19) | none |
| 8 | `MappingClassGroupFull`, `toTop_bijective` | disc; annulus twist; tetrahedron boundary | 2 classes on the disc; PL group of order 2 against `|S₄| = 24` | true (r19) | none |
| 9 | `OuterAut` | `S₃`, `Q₈`, `ℤ`, `ℤ²` | `1`, `6`, `2`, `GL₂(ℤ)` | true (r19) | none |
| 10 | `dehn_nielsen_baer` | `T²`, `S²` | `Out(ℤ²) = GL₂(ℤ)`; orders `2` against `1` on `S²`, excluded by `1 ≤ genus` | true (r19) | none |
| 11 | `exists_diffeomorph_mapOfEq_eq` | `T²` with `[[1,0],[1,1]]` | `(x,y) ↦ (x, x+y)` | true (r19) | none |
| 12 | `baer_epstein_smooth` | Klein bottle; antipodal map of `S²` | degree `(−1)³ = −1`, so not homotopic to the identity | true (r19) | none |
| 13 | `mcg_sphere_full`, `mcg_torus_full` | `diag(1,1,−1)`, `−I₃`; shear, `−I₂`, swap | determinants `−1, −1`, composite `+1`; `−I₂` has determinant `1`; the swap has `−1` | true (r19) | none |
| 14 | `measurable_riemann_mapping` (§7.4) | `μ = a`, `0`, `z̄` | `f_z = 1/(1+a)`, `f_z̄ = a f_z`; `f_z = 0` for `z̄` | true (r19) | none |
| 15 | `nielsen_realization` | `T²` with `⟨−I⟩`; a Dehn twist | lift `{1, (½−x, −y)}`; `⟨T⟩` infinite, so no lift | true (r19) | none |
| S1 | §0.0c | tetrahedron, 3-simplex, seven-vertex torus | `2`, `1`, `0` | true (r19) | none |
| S3 | §0.1 | `g = 2` | `g = (2−0+2)/2 = 2` | true (r19) | none |
| S4 | §0.2 | `S¹`; `τ(s) = 2(s−½)²` | `π₀ = ℤ/2`; `τ(0) = τ(1) = ½`, `τ(½) = 0` | true (r19) | none |
| S5 | §0.4a | `diag(1,−1)`, `diag(−2,1)`, glide | `−z̄`; `−2z̄`; `dist(i,2i) = log 2 ≈ 0.693` | true (r19) | none |
| S8 | §2.3 | `T²` | `𝒥/Diff₀ = ℍ`; `ℍ/GL₂(ℤ)` | true (r19) | none |
| S9 | §4.5 | `K₀ = −1`, `u = 0`; genus 2 | `0 − 1 + 1 = 0`; `∫K = −4π` | true (r19) | none |
| S10 | §5.5 | chains of `2g+1` and `2g` curves | `χ = −2g`; 2 against 1 boundary circles | true (r19) | none |
| S11 | §7.4 | Beurling transform | multiplier `ξ̄/ξ`, of modulus 1 | true (r19) | none |
| S12 | §8.1 | `ML(T²)`; earthquake direction | `i([1,0],[0,1]) = 1`; the twist rises by `+ℓ` | true (r19) | none |
| S13 | §8.5 | `g = 3`; the three `g = 2` cases | codimension `1 = g+h−2`; `(1,3)` is impossible; `(2,0)` gives `|K| = 1`; `(0,6)` gives `|K| = 2` | true (r19) | none |
| S14 | §9.2 | `g = 2`; Bolza | covolume `4π`; `48·π/12 = 4π` | true (r19) | none |
| S15 | §11.1 | `g = 2`; Klein quartic | empty locus; index `336 = 168(g−1)` | true (r19) | none |
| C1 | Conventions; §4.3 | `x²`; attaching word | `Δ⁺(x²) = −2`; the word maps to `R⁻¹` | true (r19) | none |
| C2 | §10.1 | `(2,3,7)`, `(2,3,8)` | `1/42`, `1/24` | true (r19) | none |
| C3 | §§7.1, 7.5 | `B = 2 asinh 1`; `k = ½` | `≈ 1.7627`; `artanh ½ ≈ 0.5493` | true (r19) | none |

### Remarks on untouched text and supplier text (no change requested)

- FuchsianOrbifolds at its head `f997c5f`, line 814, still says that this roadmap's Layer 10 consumes the equality case of item 1. §10.1 here uses only the inequality.
- ComplexCurveModuli on main, lines 45 and 47, still cites "ModularForms10B(i)–(iv)" and "10B(v)'s `analyticGenus_eq_topologicalGenus`". Neither label exists in ModularForms. This roadmap no longer copies them.
- ArithmeticFuchsianGroups at its head `b98ed29`, line 1326, now cites this roadmap's §1.1 and §1.4 correctly. The previous report's remark on it is resolved.

## Not verifiable

- **No changed passage depends on a text I could not read.** The changed passages cite only epstein1966 (in the cache, read at lines 533–637) and roadmaps on main or at their open heads.
- **The untouched passages keep the previous report's list.** These texts are cited by locator only and were not read:
  - Farb–Margalit;
  - Douady–Earle 1986;
  - Imayoshi–Taniguchi;
  - Hubbard 2006;
  - Ahlfors–Bers 1960;
  - Wolpert 1979;
  - Moise 1977;
  - Massey 1977;
  - Munkres 1966;
  - Hirsch (uncertified);
  - Kerckhoff 1983 (waived).

## Source issues

- **Error** in epstein1966 at Theorem 6.4 a), printed p. 101: the source says a homeomorphism homotopic to the identity is isotopic to it, asking orientation preservation only on the plane and the cylinders; it should be also asked on the closed disc, where complex conjugation is homotopic but not isotopic to the identity; affects nothing.
