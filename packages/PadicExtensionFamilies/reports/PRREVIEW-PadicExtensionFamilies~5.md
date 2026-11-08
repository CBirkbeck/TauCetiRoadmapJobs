# Review of PadicExtensionFamilies (pull request #1713 at 25a7dd4)

**Verdict:** needs changes

Incremental re-review of 93 changed lines since 4cf9622 (36 insertions, 57 deletions, all in `README.md`). The change deletes §0.6 (the classification of degree-`n` extensions by their unramified part) and cites it from EtaleMassFormula Layer 1 instead, adds a convention and a supplier-contract entry for that roadmap, and repoints the `*Needs:*` lines of §§6.3, 6.5 and 6.7. The deletion and the citations are correct and resolve at the supplier's open head; one P3 style defect was introduced by the new convention. No P1 or P2.

## R01 (P3) — Conventions list numbered out of order

**Location:** `README.md:237` ("13. **Extensions by their unramified part**, as in EtaleMassFormula §1.1: …") placed before `README.md:242` ("12. **Indices of inseparability** use Heiermann's definition …").

**Claim:** The Conventions list runs 1–11, 13, 12.

**Witness:** Markdown renders an ordered list by position (the numbers after the first item are disregarded), so the new convention displays as 12 and the inseparability convention as 13. `README.md:1138` cites "(Convention 12)" for `e_L = v_L(p) ∈ ℕ∞` of Heiermann's definition; on the rendered page that number now names the unramified-part convention.

**Repair:** Move the new item after the inseparability item so the list reads 1–13 in order (the new convention then is 13 in both source and rendering, and the reference at line 1138 stays correct). Equivalently, renumber the two items 12, 13 in their present order and change line 1138 to "Convention 13".

## Previous findings

- R01 — not repaired, and not carried as a finding: the folder still has `README.md`, `Suggested.lean`, `metadata.toml` and no `sources.toml`. The manifest is a board-package artefact (the brief's `packages/PadicExtensionFamilies/sources.toml`), not a roadmap-folder file: none of the 127 roadmap folders on main carries one, and the gate's `stray-files` rule would flag it in the folder (repair "delete it; sources are the README's references"). The previous finding conflicts with that rule, so it is withdrawn rather than re-raised; the readable sources and the open limitations are recorded under *Not verifiable* as before.

## Verified sound

### The changed passages

- **The deletion of §0.6 and its replacement.** EtaleMassFormula is open pull request #1792 by `0stellensatz` (a different author, a new roadmap folder), head `4802879`, so it is an admissible supplier. At that head its `README.md` has `## Layer 1: extensions by their unramified part` (line 231) with `### 1.1 the classification` (233), `### 1.2 the automorphism count` (259) and `### 1.3 the subfield form and the orbit count` (279). Each citation at this head states what the supplier states: §1.1 the bijection from `K`-classes of degree `n` and residue degree `f` onto `𝒯(K_f, n/f)/Gal(K_f/K)` with the transport action `τ · [L]` through `τ⁻¹`, inseparable extensions included, and the separable classes being those of `σ_{K_f}(n/f)` (`README.md:77–83`, `234–247`, `291–297`); §1.2 the exact sequence `Aut_{K_f}(L) → Aut_K(L) → Stab([L])`, the count `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])`, the orbit size `f/#Stab([L])` and the mass identity in `ℝ≥0∞` "likewise with each class weighted by any function of its `K`-isomorphism class", which is the README's "for every weight `w` invariant under `K`-isomorphism"; §1.3 the subfield form inside `SeparableClosure K`. The Scope deferral "Layers 1–3" (`README.md:163–166`) matches EtaleMassFormula's Layers 1 (classification), 2 (transitive mass) and 3 (Bhargava's formulas).
- **No cycle.** EtaleMassFormula's Scope (its `README.md:36–40`) defers Krasner's count, Monge's count and the Hou–Keating–Sinclair families to PadicExtensionFamilies as a non-owner statement; it has no `*Needs:*`, supplier entry or `Needs` citation of this roadmap (grep of its README for the name finds only that deferral). Its own suppliers are MassFormula Layer 4, completed LocalFieldsRamification Layer 2 and Mathlib, all before this roadmap.
- **No shared declaration.** Its `Suggested.lean` is `namespace TauCetiRoadmap.EtaleMassFormula` (with inner `GaloisSet`); this roadmap's is `namespace TauCetiRoadmap.PadicExtensionFamilies`. No fully qualified name is declared in both.
- **Remaining "0.6" references.** `README.md:115`, `278`, `355`, `540`, `562`, `702`, `868` all name NewtonPolygons §0.6 (`ConvexPolygon.FiniteSlopeData`, on main at `TauCetiRoadmap/NewtonPolygons/README.md:320`), not the deleted section. The Summary bullet (`README.md:44–46`) now ends Layer 0 at "automorphisms and subfields" (§0.5), which is the last Layer 0 subsection.
- **§6.3, §6.5, §6.7 `*Needs:*` lines** list the supplier by name and section (`README.md:1472`, `1650`, `1757`), never by pull-request number; the §6.5 prose at `1634–1635` names the two facts it uses (automorphism count and orbit size).
- **Convention 13's content** is the same action as EtaleMassFormula §1.1 (left action: `(L^τ)^σ = L^{στ}`, computed in the table).
- **Policy.** No process words, pull-request numbers, LaTeX or machine paths in the diff; `Suggested.lean` and `metadata.toml` are byte-identical to 4cf9622 (`git diff 4cf9622..HEAD` on both files is empty); no file outside the folder changed.

### Adversarial pass

Fresh rows for the changed statements:

| Statement | Instances tried | Computed values on each side | Result; change |
|---|---|---|---|
| Convention 13, transport action is a left action | `σ, τ ∈ Gal(K_f/K)` | `L^τ`: `x ∗ ℓ = τ⁻¹(x)ℓ`; `(L^τ)^σ`: `x ∗∗ ℓ = τ⁻¹(σ⁻¹(x))ℓ = (στ)⁻¹(x)ℓ`, so `σ·(τ·[L]) = (στ)·[L]`; with `τ` in place of `τ⁻¹` one gets `(τσ)·[L]`, a right action with the same orbits and stabilizers | pass; same convention as the supplier |
| Supplier entry (§1.2) weighted identity | fixed class `ℚ_2(ζ_12)` over `ℚ_4`; moved class `ℚ_2(∜−3)`; general orbit | fixed: `#Stab = 2`, `#Aut_{K_f} = 2`, `#Aut_K = 4`, orbit size `1`: `(1/2)(w/2) = w/4 = w/#Aut_K`; moved: `#Stab = 1`, `#Aut_K = 2`, orbit size `2`: `(1/2)(2·w/2) = w/2 = w/#Aut_K`; general: `(f/#Stab)·w/#Aut_{K_f} = f·w/#Aut_K`, needs `w` and `#Aut_{K_f}` constant on orbits (`Aut_{K_f}(L^τ) = Aut_{K_f}(L)` as sets) | pass; "invariant under `K`-isomorphism" is exactly the needed hypothesis |
| Supplier entry (§1.2) automorphism count on an inseparable member | `K = 𝔽_2((t))`, `L = K(√t)`, `f = 1` | `Aut_K(L) = 1`, `Aut_{K_1}(L) = 1`, `Stab = Gal(K_1/K) = 1`: `1 = 1·1`; §1.1 classifies it (inseparable included), its class is not in `σ_K(2)` | pass |
| Layer 0 Examples | `ℚ_4`, `n = 2` | `[ℚ_4ˣ : ℚ_4ˣ²] = 2^{2+2} = 16`; `15` quadratic extensions, `1` unramified, `14` ramified; Frobenius fixes `6`, swaps `8` in `4` pairs: `6 + 4 = 10` orbits `= N_2(2,2)` | pass |
| §6.3 restriction of the class–orbit bijection | `K = ℚ_2`, `f = e = 2`; `f = 1` | transport by Frobenius preserves `(ε, 1, slopes)` (the valuation of `K_f` is Frobenius-invariant); `6 + 8 = 14` relative classes, `10` absolute; `f = 1`: `Gal(K_1/K) = 1`, every orbit a singleton | pass |
| §6.4 Check, `K = ℚ_4` (seeded §6.4) | `j = 1, 2` | counts `n(q−1) = 6`, `n·q = 8`, total `14` = the ramified quadratic classes; mass `6·(1/2)·4⁻¹ + 8·(1/2)·4⁻² = 3/4 + 1/4 = 1`; Serre's `Σ q^{−j} = 6/4 + 8/16 = 2 = n` | pass; the rewritten Check no longer depends on §0.6 |
| §6.5 reduced polynomials across one `K`-class (seeded §6.5) | `[1]` over `ℚ_4`, `B = 2`, `#Aut_{K_f} = 2`; fixed and moved classes | per `K_f`-class `B/#Aut_{K_f} = 1`; fixed class (`#Aut_K = 4`): `fB/#Aut_K = 2·2/4 = 1` = one class × `1`; moved pair (`#Aut_K = 2`): `2·2/2 = 2` = two classes × `1` | pass; uses exactly §1.2's count and orbit size |
| §6.7 Monge count (seeded §6.7), fresh evaluation of the displayed formula | `K = ℚ_2`, `(e,f) = (2,2)`; `K = ℚ_4`, `(2,1)`; `K = ℚ_2`, `(2,1)` | `(2,2)`: `i ∈ {0,1}`, `e(i) = f(i) = 1`; `(e',e'') = (1,2)`: `f' = 1`: `Δ = 1, 2` → `3`; `f' = 2`: `Δ = 3, 4` → `7`; `(2,1)`: `Σ_2(2,1) = 3`, `Σ_2(4,1) = 7`; total `20`, `/f = 10`. `ℚ_4`: `3 + 4 + 7 = 14`. `ℚ_2`: `1 + 2 + 3 = 6` | pass; `10` agrees with the orbit count `6 + 4` |
| Scope deferral "Layers 1–3" | EtaleMassFormula head `4802879` | Layer 1 classification (line 231), Layer 2 transitive mass by residue degree (307), Layer 3 Bhargava's formulas (359); Layer 0 is its carrier (Galois sets) | pass |

Rows carried forward for the statements the diff leaves untouched, each as the previous report computed it ([r4](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~4.md), which in turn carried most from r3):

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.1 tame/wild split | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)`; tame cubic over `ℚ_5` | `w`: `1+1 = 2`; `ε`: `1·1 = 1`; cubic `e = 3·5⁰` | pass, carried from r4 |
| §0.3 height, mean, wild bound | `ℚ_2(i)`, `ℚ_2(√2)`, tame cubic, unramified quadratic | `(H,m) = (1,1/2),(2,1),(0,0),(0,0)`; `c = f(e−1+H)` gives `2,3,2,0`; `H ≤ v_L(e)`: `1 ≤ 2`, `2 ≤ 2` | pass, carried from r4 |
| §0.4 square class | bases `(1,√2)`, `(1,2√2)` | discriminants `8`, `32`, ratio `4 = 2²` | pass, carried from r4 |
| §0.5 tame Galois criterion | `ℚ_5(∛5)`, `ℚ_7(∛7)` | `3 ∤ 4`: not Galois, `#Aut = 1`; `3 ∣ 6`: Galois, `#Aut = 3` | pass, carried from r4 |
| §1.1 coefficient formula | `X⁴−2`; `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | `v_L(ρ_i)`: `(8,4,8,0)`; `(3,3,3,0)`; `(3,2,3,0)`; `v_L(ρ_1) = H` | pass, carried from r4 |
| §1.2 rams, slope dictionary | `X⁴−2`; `X⁴−4X²+2` | both rams `(2,4)`, Swan `[2,3]`, `c = 11` | pass, carried from r4 |
| §1.2 slope cardinality, sign, denominator | degree 1; tame cubic; `X⁴+2X+2` | `0 = 1−1` slopes; `2 = 3−1`; three slopes `−1/3`, denominator `3 ∣ 3` | pass, carried from r4 |
| §1.3 residual polynomials | `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | `z³+1`, `z³+z+1`; kernels of sizes `2`, `1` | pass, carried from r4 |
| §1.3 additivity needs positive slope | tame cubic over `ℚ_5` | `zA(z) = z³+3z²+3z` not additive | pass, carried from r4 |
| §1.4 scaling orbit | `α⁴ = 2`, `δ` of order `3` | `γ_1 = δ²`, `γ_2 = δ`; `(z²+1, z+1) ↦ (z²+δ², δ²z+δ)` | pass, carried from r4 |
| §1.5 unramified transport | `ℚ_2(ζ_3)`, uniformizers `2`, `2ζ_3` | raw lists `{−1}`, `{0}`; over `L^{ur} = L` both empty | pass, carried from r4 |
| §2.0 non-Galois Herbrand | `ℚ_2(∜2)`, `D_4` closure | `φ_{M/K}(1,3,7) = 1,2,3`; `φ_{M/L}(3) = 2`, `φ_{M/L}(7) = 4` | pass, carried from r4 |
| §2.1 orbit count | same; `S_3`, `H = C_2` | `[G:G_tH] = 1,1,2,4`; cubic `1` then `3` | pass, carried from r4 |
| §2.2 breaks and `card = w` | `ℚ_2(∜2)`; `ℚ_2(ζ_8)`; tame cubic | jumps at `u = 2, 3`, total `2 = w`; `ζ_8`: Artin `2,3`; cubic `0` | pass, carried from r4 |
| §2.3 integral | identity; unramified quadratic; tame cubic; `ℚ_2(∜2)` | `c = 0, 0, 2, 11` | pass, carried from r4 |
| §2.4 slope polygon and envelope | `ℚ_2(∜2)`; tame cubic; unramified quadratic | slopes `3,4`; `1`; `0`; sheared heights `0,2,8` | pass, carried from r4 |
| §2.5 non-normal sum formula | `σ = r²`, `σ = r` in `D_4` | `10 = 8+2`; `6 = 4+2`; rams `4, 2` with multiplicities `1, 2` | pass, carried from r4 |
| §2.6 four identities, small and tiny rams | `ζ_8`; general | `m = (1/2, 5/4)`, `r = (1,3)`, `s_2 = 2`, `c = 8`; `r_k^* = m_k − m_{k−1}` | pass, carried from r4 |
| §2.7 top slope | identity; `ℚ_2(√5)`; `ℚ_5(∛5)`; `ℚ_2(∜2)` | `0, 0, 1, 4` | pass, carried from r4 |
| §3.1 slope content degrees | `D_4`, `S_4`, `S_3`, `[]^2` | `8`, `24`, `6`, `2` | pass, carried from r4 |
| §3.2 hidden slopes | `ℚ_2(∜2)`; `X⁴+2X²+2`; `ℚ_3(∛3)` | `[2]`; `[3]`; `[]` | pass, carried from r4 |
| §3.3 weighted formula versus Jones–Roberts (2) | `[2,3,4]`; `[4/3,4/3]_3^2`; `[]_3^2`; `[]^2` | `3`; `7/6`; `2/3`; `0` | pass, carried from r4 |
| §3.4 normalizer | `S_3, H = C_2`; `C_2², H = 1` | `[N(H):H] = 1`, `4` | pass, carried from r4 |
| §3.5 splitting models | `x³−5` at `5`; `x³−7` at `7` | orders `(6,6)`; `(3,6)` | pass, carried from r4 |
| §3.6 prefix | `ℚ_2(√2)`; identity | `2.1.2.3`; `2.1.1.0` | pass, carried from r4 |
| §4.1 indices | `X⁴−2`; `X²−2`; `X²+t^mX+t` | `(8,4,0)`; `(2,0)`; `(2m−1,0)`, inseparable `(∞,0)` | pass, carried from r4 |
| §4.2 Miki | `ℚ_2(√2)`, `a = −1` | `l = 1`; levels `1, 3`; `−1` not a square | pass, carried from r4 |
| §4.2 jump sets | `p = 2, e = 2` | `T = {1,3}`, `e^* = 4`; `ρ²(1) = 4 < ρ(3) = 5` | pass, carried from r4 |
| §5.1 Ore | `ℚ_2, n = 4`; `n = 1`; `𝔽_2((t)), n = 2` | admissible `{1,3,5,6,7,8}`; `j = 0`; odd `j` | pass, carried from r4 |
| §5.2 box depths and Haar normalization | `ℚ_2, n = 2, j = 1, 2` | measures `1/16`, `1/16`; Eisenstein region `1/8` | pass, carried from r4 |
| §5.3 Krasner closed form | `ℚ_2, n = 2`; `ℚ_3, n = 3`; `𝔽_2((t)), n = 2` | `2, 4`; `6, 6, 9`; `2^m` | pass, carried from r4 |
| `krasnerCount` (Lean) | `n = 1, j = 0`; general | `1`; exponent in `ℤ` | pass, carried from r4 |
| §5.4 totals | `ℚ_2, n = 2`; `𝔽_2((t))`; `𝔽_3((t))` | `6`; `∞`; `2` | pass, carried from r4 |
| §6.2 compatibility | `ℚ_2`, `e = 2`; `[2,3]`; `𝔽_2((t))` | `1 < 2` geometric, `2 = 2` arithmetic, `3` rejected; both bands arithmetic; no bound | pass, carried from r4 |
| §6.4 point types, full-residue count, fibre, C-points, tame branch | `[1]`, `[2]`, `[2,3]`, `[1/3,1/3]`; `[]_2`, `[]_3` over `ℚ_5` | sets of size `2, 4, 32, 1`; C-counts `1, 2, 2/4, 0`; tame classes `2`, `1`, mass `1` | pass, carried from r4 |
| §6.4 interval counts (nine band tests) | `[1]`, `[2]`, `[2,3]`, `[1/3,1/3]`, `p = 3` `[1/8,1/8]`, `ε = 3` | counts `1, 2, 2, 4, 0, 1, 0, 1, 1` as `⌈εp^k s_k⌉ − ⌈εp^k m_k⌉` | pass, carried from r4 |
| §6.5 Serre comparison | `ℚ_2, e = 2`; `𝔽_2((t))` | `1·2⁻¹ + 2·2⁻² = 1`; partial sums `1 − 2^{−M}` | pass, carried from r4 |
| §6.6 packets | `X⁴−2` vs `X⁴−4X²+2`; `X⁴+2X³+2` vs `X⁴+2X³+2X²+2` | `D_4` vs `C_4`; `{z³+1}` vs `{z³+z+1}` | pass, carried from r4 |
| §6.7 Lean transcription | `mongeSigma`, `mongeDelta`, `mongeCount` | (6), (7), Theorem 1 with `N' = n_0 n(i) e' f'` | pass, carried from r4 |
| §6.8 completeness | `n = 1`; dyadic quadratics; `𝔽_3((t))`; wild equal characteristic | `1`; `0`; `2/4 + 4/8 = 1`; both sides false | pass, carried from r4 |
| `totallyRamifiedHeight`, `mass_completeness` (Lean) | member `E`; infinite `E`; two isomorphic members | `c + 1 − n ≥ 0`; junk excluded by `hmem`; `hpair` needed | pass, carried from r4 |
| §7.1–7.3 GRD | `ℚ`; `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)` | `1`; `√5`; `8 > 2^{11/4}`; `5^{3/4}` | pass, carried from r4 |
| Boundary checks | `x²+4x+2`, `x²+2x+4`, `x²+x+2` | Eisenstein, not, not | pass, carried from r4 |
| Principal-unit supplier and §6.7 consumer | `K = ℚ_3` | `U⁰/U¹ = 2`, `U¹/U² = 3`; three quadratic norm subgroups | pass, carried from r4 |

### Source sample

The seeded sample falls in the changed passages at §6.4 (the rewritten `ℚ_4` Check), §6.5 and §6.7 (the `*Needs:*` lines and the §6.5 orbit sentence); those are computed above against the supplier's §1.2 and Monge's displayed formula. No source text was opened this round: the changed lines cite a Tau Ceti roadmap, not a paper. The locator checks of the other sampled targets (§§0.1, 0.3, 0.5, 1.3, 1.5, 2.0, 3.1, 3.3, 3.4, 3.5, 4.2, 5.1) are carried from r3 and r4, whose passages are unchanged.

### Suppliers, pins and ownership

- The dependency check, run with the candidate order, the content checkout and `--movable`:

```text
depcheck: 235 roadmaps, 2063 edges, 0 problem(s)
```

  No UPWARD or CYCLE line. EtaleMassFormula is not in the merge order yet; the check places it after its last supplier (MassFormula), before this roadmap.
- Ownership against open pull requests: `roadmaps list` filtered for mass-formula and étale roadmaps shows EtaleMassFormula (#1792) as the only open roadmap building the classification by unramified part; MassFormula on main owns `σ_K(n)` and Serre's formula and does not state the orbit classification. This roadmap no longer states it.
- Cross-roadmap citations resolved this round: EtaleMassFormula §§1.1, 1.2, 1.3 and Layers 1–3 at head `4802879`; NewtonPolygons §0.6 on main (`README.md:320`); MassFormula Layers 0, 3, 4 on main (`README.md:214`, `303`, `350`, as in r4). The worker's `citations.md` lists 22 Lean names found nowhere: 20 are LMFDB knowl identifiers in the References and 2 are NewtonPolygons roadmap-contract names already resolved in r4; none is a claim about `Suggested.lean`.

### Gate and Lean acceptance test

- The worker's gate at this head: every check passed (`depcheck=0`, `build=0`, `OK`). My own run of the full gate command is recorded below.
- `lake env lean` on `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean`: exit 0, exactly 13 warnings, all `declaration uses 'sorry'`, nothing else.
- The scratch `#check @` file for all 39 declarations elaborates; its 39 names are identical to the worker's `signatures.md`, and the file is byte-identical to the one r4 compared with the README, so the binder audit and the six benign binder-loss leads of r4 stand. No declaration was added, renamed or retyped.
- The one-tactic probe of r4 (13 admissions, none closed by `rfl`, `simp`, `infer_instance`, `exact le_rfl`, `exact Iff.rfl`) is carried: the file is unchanged.
- Imports: `import Mathlib` plus six `TauCeti.NumberTheory.LocalField.*` modules, no `set_option`, no sorried data.

- My run of the full gate on this head (the targeted build was already up to date from the elaboration above):

```text
gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

  The worker's run additionally reports `build=0`. The gate passes; the sole finding is the P3 above, so the verdict is needs changes rather than accepted.

## Not verifiable

Carried from r4, whose passages are unchanged:

- The LMFDB knowls `lf.family_ambiguity`, `lf.family_invariants`, `lf.family_mass`, `lf.family_polynomial`, `lf.galois_splitting_model`, `lf.heights`, `lf.jump_set`, `lf.means`, `lf.packet`, `lf.rams`, `lf.subfamily`, `lf.top_slope`, `nf.galois_root_discriminant` remain behind the CAPTCHA limitation recorded in r3; `lf.eisenstein_diagram` and `lf.herbrand_invariant` are readable.
- Deligne's Appendix A.6 (Props. A.6.1–A.6.2) was not obtained from a legal source; the non-Galois tests in the table stand in.
- Serre's *Local Fields*, Krasner 1966, Serre 1978, Ore 1928 and Fried 1974: paywalled or not obtained; cited by locator.
- Jones–Roberts, Pagano and Heiermann were checked in the preprint versions named in the README; published numbering not compared.

## Source issues

- none
