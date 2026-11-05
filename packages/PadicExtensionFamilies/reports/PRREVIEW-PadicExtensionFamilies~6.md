# Review of PadicExtensionFamilies (pull request #1713 at f85522c)

**Verdict:** accepted

Incremental re-review of 8 changed lines since 25a7dd4 (4 insertions, 4 deletions, all in `README.md`). The change moves the Conventions item "Indices of inseparability" before "Extensions by their unramified part", so the list reads 1–13 in order. No finding, new or carried. The gate passes on this head.

## Previous findings

- R01 — repaired: `README.md:237` "12. **Indices of inseparability** use Heiermann's definition …" now precedes `README.md:241` "13. **Extensions by their unramified part**, as in EtaleMassFormula §1.1: …"; the list runs 1–13 in source and in rendering, and `README.md:1138` "(Convention 12)" names the inseparability item.

## Verified sound

### The changed passages

- **List order.** The thirteen numbered items of `## Conventions` sit at `README.md:172, 180, 183, 192, 198, 208, 214, 220, 224, 230, 234, 237, 241` with source numbers 1, 2, …, 13 in that order, so the rendered positions coincide with the source numbers.
- **References by number.** Every "Convention N" reference in the folder: `README.md:194` (3), `369`, `490`, `491`, `706`, `1257`, `1391` (1), `533` (4), `550`, `1156`, `1403` (5), `582` (7), `767`, `780` (3), `1138` (12); `Suggested.lean:109` (7), `110` (4), `195` (12). The two references to 12 are the definition of the indices of inseparability (`README.md:1136–1140`, `Suggested.lean:195–210`), which is what item 12 now states (`e_L = v_L(p)` in mixed characteristic, `∞` in equal characteristic). No reference names item 13 by number: §§6.3, 6.5, 6.7 cite "EtaleMassFormula §1.1/§1.2" by name.
- **Content unchanged.** The two items' text is byte-identical to 25a7dd4 (the diff is a pure move). `Suggested.lean` and `metadata.toml` are byte-identical to 4cf9622 (`git diff 4cf9622..HEAD` on both is empty). The folder has `README.md`, `Suggested.lean`, `metadata.toml` and nothing else; `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Policy.** No process words, pull-request numbers, LaTeX or machine paths in the diff.

### Adversarial pass

Fresh row for the changed statement:

| Statement | Instances tried | Computed values on each side | Result; change |
|---|---|---|---|
| Conventions items 12 and 13 after the move | rendered list position versus source number; the two "Convention 12" references | positions of the items at lines 237 and 241 are 12 and 13; source numbers 12 and 13; `README.md:1138` and `Suggested.lean:195` cite 12 for `e_L = v_L(p)`, which item 12 states (witness `ℚ_2(√2)`: `e_L = v_L(2) = 2`, `ν = v_2(2) = 1`, so `i_1 = 0` is uncorrected and `i_0 = 2m−1` for the Eisenstein `X² + 2^m·u·X + 2` is corrected by `e_L = 2` when `2m−1 > 2`, i.e. `i_0 = 2` for `m ≥ 2`, as in the §4.1 row below with `(2,0)` for `X²−2`) | pass; no change |

Rows carried forward for the statements the diff leaves untouched, each as the previous report computed it ([r5](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~5.md), which carried most of them from r4 and r3):

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Convention 13, transport action is a left action | `σ, τ ∈ Gal(K_f/K)` | `(L^τ)^σ`: `x ∗∗ ℓ = (στ)⁻¹(x)ℓ`, so `σ·(τ·[L]) = (στ)·[L]` | pass, carried from r5 |
| Supplier entry (EtaleMassFormula §1.2) weighted identity | fixed class `ℚ_2(ζ_12)` over `ℚ_4`; moved class `ℚ_2(∜−3)` | fixed: `#Stab = 2`, `#Aut_K = 4`, `(1/2)(w/2) = w/4`; moved: `#Stab = 1`, `#Aut_K = 2`, `(1/2)(2·w/2) = w/2` | pass, carried from r5 |
| §1.2 automorphism count on an inseparable member | `K = 𝔽_2((t))`, `L = K(√t)` | `1 = 1·1` | pass, carried from r5 |
| Layer 0 Examples | `ℚ_4`, `n = 2` | `16` square classes, `15` quadratic, `6 + 4 = 10` orbits `= N_2(2,2)` | pass, carried from r5 |
| §6.3 restriction of the class–orbit bijection | `K = ℚ_2`, `f = e = 2`; `f = 1` | `6 + 8 = 14` relative, `10` absolute; `f = 1` singletons | pass, carried from r5 |
| §6.4 Check, `K = ℚ_4` | `j = 1, 2` | counts `6`, `8`; mass `3/4 + 1/4 = 1`; Serre `6/4 + 8/16 = 2` | pass, carried from r5 |
| §6.5 reduced polynomials across one `K`-class | `[1]` over `ℚ_4`, `B = 2` | fixed `2·2/4 = 1`; moved `2·2/2 = 2` | pass, carried from r5 |
| §6.7 Monge count | `ℚ_2 (2,2)`; `ℚ_4 (2,1)`; `ℚ_2 (2,1)` | `20/2 = 10`; `14`; `6` | pass, carried from r5 |
| Scope deferral "Layers 1–3" | EtaleMassFormula on main | Layer 1 (line 230), 2 (306), 3 (358) | pass, re-resolved this round on main |
| §0.1 tame/wild split | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)`; tame cubic over `ℚ_5` | `w`: `1+1 = 2`; `ε`: `1·1 = 1`; cubic `e = 3·5⁰` | pass, carried from r4 |
| §0.3 height, mean, wild bound | `ℚ_2(i)`, `ℚ_2(√2)`, tame cubic, unramified quadratic | `(H,m) = (1,1/2),(2,1),(0,0),(0,0)`; `c = 2,3,2,0`; `H ≤ v_L(e)`: `1 ≤ 2`, `2 ≤ 2` | pass, carried from r4 |
| §0.4 square class | bases `(1,√2)`, `(1,2√2)` | discriminants `8`, `32`, ratio `4 = 2²` | pass, carried from r4 |
| §0.5 tame Galois criterion | `ℚ_5(∛5)`, `ℚ_7(∛7)` | `3 ∤ 4`: `#Aut = 1`; `3 ∣ 6`: `#Aut = 3` | pass, carried from r4 |
| §1.1 coefficient formula | `X⁴−2`; `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | `v_L(ρ_i)`: `(8,4,8,0)`; `(3,3,3,0)`; `(3,2,3,0)` | pass, carried from r4 |
| §1.2 rams, slope dictionary | `X⁴−2`; `X⁴−4X²+2` | rams `(2,4)`, Swan `[2,3]`, `c = 11` | pass, carried from r4 |
| §1.2 slope cardinality, sign, denominator | degree 1; tame cubic; `X⁴+2X+2` | `0`; `2`; three slopes `−1/3`, `3 ∣ 3` | pass, carried from r4 |
| §1.3 residual polynomials | `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | `z³+1`, `z³+z+1`; kernels `2`, `1` | pass, carried from r4 |
| §1.3 additivity needs positive slope | tame cubic over `ℚ_5` | `z³+3z²+3z` not additive | pass, carried from r4 |
| §1.4 scaling orbit | `α⁴ = 2`, `δ` of order `3` | `(z²+1, z+1) ↦ (z²+δ², δ²z+δ)` | pass, carried from r4 |
| §1.5 unramified transport | `ℚ_2(ζ_3)`, uniformizers `2`, `2ζ_3` | raw lists `{−1}`, `{0}`; over `L^{ur}` both empty | pass, carried from r4 |
| §2.0 non-Galois Herbrand | `ℚ_2(∜2)`, `D_4` closure | `φ_{M/K}(1,3,7) = 1,2,3`; `φ_{M/L}(3) = 2`, `φ_{M/L}(7) = 4` | pass, carried from r4 |
| §2.1 orbit count | same; `S_3`, `H = C_2` | `[G:G_tH] = 1,1,2,4`; cubic `1` then `3` | pass, carried from r4 |
| §2.2 breaks and `card = w` | `ℚ_2(∜2)`; `ℚ_2(ζ_8)`; tame cubic | jumps `u = 2, 3`, total `2 = w`; Artin `2,3`; `0` | pass, carried from r4 |
| §2.3 integral | identity; unramified quadratic; tame cubic; `ℚ_2(∜2)` | `c = 0, 0, 2, 11` | pass, carried from r4 |
| §2.4 slope polygon and envelope | `ℚ_2(∜2)`; tame cubic; unramified quadratic | slopes `3,4`; `1`; `0`; sheared heights `0,2,8` | pass, carried from r4 |
| §2.5 non-normal sum formula | `σ = r²`, `σ = r` in `D_4` | `10 = 8+2`; `6 = 4+2` | pass, carried from r4 |
| §2.6 four identities, small and tiny rams | `ζ_8`; general | `m = (1/2, 5/4)`, `r = (1,3)`, `s_2 = 2`, `c = 8` | pass, carried from r4 |
| §2.7 top slope | identity; `ℚ_2(√5)`; `ℚ_5(∛5)`; `ℚ_2(∜2)` | `0, 0, 1, 4` | pass, carried from r4 |
| §3.1 slope content degrees | `D_4`, `S_4`, `S_3`, `[]^2` | `8`, `24`, `6`, `2` | pass, carried from r4 |
| §3.2 hidden slopes | `ℚ_2(∜2)`; `X⁴+2X²+2`; `ℚ_3(∛3)` | `[2]`; `[3]`; `[]` | pass, carried from r4 |
| §3.3 weighted formula versus Jones–Roberts (2) | `[2,3,4]`; `[4/3,4/3]_3^2`; `[]_3^2`; `[]^2` | `3`; `7/6`; `2/3`; `0` | pass, carried from r4 |
| §3.4 normalizer | `S_3, H = C_2`; `C_2², H = 1` | `[N(H):H] = 1`, `4` | pass, carried from r4 |
| §3.5 splitting models | `x³−5` at `5`; `x³−7` at `7` | orders `(6,6)`; `(3,6)` | pass, carried from r4 |
| §3.6 prefix | `ℚ_2(√2)`; identity | `2.1.2.3`; `2.1.1.0` | pass, carried from r4 |
| §4.1 indices | `X⁴−2`; `X²−2`; `X²+t^mX+t` | `(8,4,0)`; `(2,0)`; `(2m−1,0)`, inseparable `(∞,0)` | pass, carried from r4 |
| §4.2 Miki | `ℚ_2(√2)`, `a = −1` | `l = 1`; levels `1, 3` | pass, carried from r4 |
| §4.2 jump sets | `p = 2, e = 2` | `T = {1,3}`, `e^* = 4`; `ρ²(1) = 4 < ρ(3) = 5` | pass, carried from r4 |
| §5.1 Ore | `ℚ_2, n = 4`; `n = 1`; `𝔽_2((t)), n = 2` | admissible `{1,3,5,6,7,8}`; `j = 0`; odd `j` | pass, carried from r4 |
| §5.2 box depths and Haar normalization | `ℚ_2, n = 2, j = 1, 2` | measures `1/16`, `1/16`; Eisenstein region `1/8` | pass, carried from r4 |
| §5.3 Krasner closed form | `ℚ_2, n = 2`; `ℚ_3, n = 3`; `𝔽_2((t)), n = 2` | `2, 4`; `6, 6, 9`; `2^m` | pass, carried from r4 |
| `krasnerCount` (Lean) | `n = 1, j = 0`; general | `1`; exponent in `ℤ` | pass, carried from r4 |
| §5.4 totals | `ℚ_2, n = 2`; `𝔽_2((t))`; `𝔽_3((t))` | `6`; `∞`; `2` | pass, carried from r4 |
| §6.2 compatibility | `ℚ_2`, `e = 2`; `[2,3]`; `𝔽_2((t))` | `1 < 2` geometric, `2 = 2` arithmetic, `3` rejected | pass, carried from r4 |
| §6.4 point types, full-residue count, fibre, C-points, tame branch | `[1]`, `[2]`, `[2,3]`, `[1/3,1/3]`; `[]_2`, `[]_3` over `ℚ_5` | sizes `2, 4, 32, 1`; C-counts `1, 2, 2/4, 0`; tame `2`, `1`, mass `1` | pass, carried from r4 |
| §6.4 interval counts (nine band tests) | `[1]`, `[2]`, `[2,3]`, `[1/3,1/3]`, `p = 3` `[1/8,1/8]`, `ε = 3` | `1, 2, 2, 4, 0, 1, 0, 1, 1` | pass, carried from r4 |
| §6.5 Serre comparison | `ℚ_2, e = 2`; `𝔽_2((t))` | `1·2⁻¹ + 2·2⁻² = 1`; partial sums `1 − 2^{−M}` | pass, carried from r4 |
| §6.6 packets | `X⁴−2` vs `X⁴−4X²+2`; `X⁴+2X³+2` vs `X⁴+2X³+2X²+2` | `D_4` vs `C_4`; `{z³+1}` vs `{z³+z+1}` | pass, carried from r4 |
| §6.7 Lean transcription | `mongeSigma`, `mongeDelta`, `mongeCount` | (6), (7), Theorem 1 with `N' = n_0 n(i) e' f'` | pass, carried from r4 |
| §6.8 completeness | `n = 1`; dyadic quadratics; `𝔽_3((t))`; wild equal characteristic | `1`; `0`; `2/4 + 4/8 = 1`; both sides false | pass, carried from r4 |
| `totallyRamifiedHeight`, `mass_completeness` (Lean) | member `E`; infinite `E`; two isomorphic members | `c + 1 − n ≥ 0`; junk excluded by `hmem`; `hpair` needed | pass, carried from r4 |
| §7.1–7.3 GRD | `ℚ`; `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)` | `1`; `√5`; `8 > 2^{11/4}`; `5^{3/4}` | pass, carried from r4 |
| Boundary checks | `x²+4x+2`, `x²+2x+4`, `x²+x+2` | Eisenstein, not, not | pass, carried from r4 |
| Principal-unit supplier and §6.7 consumer | `K = ℚ_3` | `U⁰/U¹ = 2`, `U¹/U² = 3`; three quadratic norm subgroups | pass, carried from r4 |

### Source sample

The diff touches no sampled target: it moves two Conventions items. The locator checks of the seeded sample (§§0.3, 0.5, 1.2, 1.4, 2.1, 2.2, 2.7, 3.1, 3.4, 3.5, 5.1, 5.2, 5.3, 6.1, 7.3) are carried from r3, r4 and r5, whose passages are unchanged at this head. No source text was opened this round.

### Suppliers, pins and ownership

- **EtaleMassFormula** is on main since the previous round (merged as commit `c1d94ec3`), so the citations are resolved on main rather than at an open head: `## Layer 1: extensions by their unramified part` at its `README.md:230`, `### 1.1 the classification` at 232 (transport action through `τ⁻¹` at 238), `### 1.2 the automorphism count` at 258 (`#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])`, orbit of size `f / #Stab([L])`, identity in `ℝ≥0∞`, lines 261–263), `### 1.3 the subfield form and the orbit count` at 278, Layers 2 and 3 at 306 and 358. These are the sections Convention 13, the supplier contract, Scope ("Layers 1–3") and the `*Needs:*` lines of §§6.3, 6.5, 6.7 cite. Its only mention of this roadmap is the Scope deferral at its line 39; it has no `*Needs:*` line on PadicExtensionFamilies, so there is no cycle.
- The open pull requests #1818 and #1820 revise EtaleMassFormula; a revision of an existing roadmap is never a dependency, and the README cites the roadmap by name and section only.
- The dependency check, run with the candidate order, the content checkout and `--movable`:

```text
depcheck: 234 roadmaps, 2161 edges, 0 problem(s)
```

  No UPWARD or CYCLE line.
- The worker's `citations.md` lists no cross-roadmap citation found nowhere; its 22 Lean-name leads are the same 20 LMFDB knowl identifiers in the References and the 2 NewtonPolygons contract names resolved in r4; none is a claim about `Suggested.lean`.
- Ownership against open pull requests: unchanged since r5 (the classification by unramified part is owned by EtaleMassFormula, now on main; this roadmap does not state it).

### Gate and Lean acceptance test

- The worker's gate at this head: every check passed (`build=0`, `OK`). My own run of the full gate command on this head:

```text
gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- `lake env lean` on `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean`: exit 0, exactly 13 warnings, all `declaration uses sorry`, nothing else.
- The scratch `#check @` file for all 39 declarations elaborates (exit 0, the same 13 sorry warnings); the 39 elaborated names are identical to the worker's `signatures.md`. The file is byte-identical to the one r4 compared with the README, so the binder audit, its six benign binder-loss leads, and the one-tactic probe (13 admissions, none closed by `rfl`, `simp`, `infer_instance`, `exact le_rfl`, `exact Iff.rfl`) stand.
- Imports: `import Mathlib` plus six `TauCeti.NumberTheory.LocalField.*` modules; no `set_option`; no sorried data; no file outside the folder.

## Not verifiable

Carried from r4 and r5, whose passages are unchanged:

- The LMFDB knowls `lf.family_ambiguity`, `lf.family_invariants`, `lf.family_mass`, `lf.family_polynomial`, `lf.galois_splitting_model`, `lf.heights`, `lf.jump_set`, `lf.means`, `lf.packet`, `lf.rams`, `lf.subfamily`, `lf.top_slope`, `nf.galois_root_discriminant` remain behind the CAPTCHA limitation recorded in r3; `lf.eisenstein_diagram` and `lf.herbrand_invariant` are readable.
- Deligne's Appendix A.6 (Props. A.6.1–A.6.2) was not obtained from a legal source; the non-Galois tests in the table stand in.
- Serre's *Local Fields*, Krasner 1966, Serre 1978, Ore 1928 and Fried 1974: paywalled or not obtained; cited by locator.
- Jones–Roberts, Pagano and Heiermann were checked in the preprint versions named in the README; published numbering not compared.

## Source issues

- none
