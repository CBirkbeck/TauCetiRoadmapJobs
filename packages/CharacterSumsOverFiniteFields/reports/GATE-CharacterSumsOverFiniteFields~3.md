# GATE-CharacterSumsOverFiniteFields~3: answers to the human review of 417ba26

One comment (CBirkbeck, 2026-11-06T16:48:14Z), split into five points. Repairs are in commits
`a7f12ef2` (H01–H04: README 71 insertions, 53 deletions; `Suggested.lean` four docstring lines) and
`2efce540` (the gate's statement-hygiene findings, H05: README 10 insertions, 6 deletions;
`Suggested.lean` 66 insertions, 46 deletions), on top of `417ba26`, not pushed. Files:
`TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` and
`TauCetiRoadmap/CharacterSumsOverFiniteFields/Suggested.lean`.

## H01 (CBirkbeck) — applied differently

§3.6 is present and its mathematics checks out (table below), but "owned downstream by `WeilConjectures`, Layer WC.1" does not resolve: at WeilConjectures' head `029d8c2`, WC.1 (§§1.1–1.16, "Integral zeta arithmetic, masses and configurations") forms zeta series of schemes, has no `L`-function of a sheaf and never mentions this roadmap, and WeilConjectures is line 116 of the merge order against this roadmap's line 147, so it cannot own a statement about the `L(λ, T)` of 3.1. README §3.6 heading "The trace-function interpretation, owned downstream" → "(background, not a target)", its ownership paragraph now names the upstream owners of the sheaf-side facts it quotes (`DeligneWeightsAndPurity` §1.10 and §7.12, `InverseGaloisAndArithmeticFundamentalGroups` §IG.0.T3, `CongruenceSpectralGap` §4.2b) and says the identification with 3.1 is background only, and Layer 3 *Dependencies* "3.6 is owned downstream by `WeilConjectures`" → "3.6 is background and not a target"; the Scope paragraph that restated 3.6 (old lines 75–85) is now a five-line pointer to it.

## H02 (CBirkbeck) — applied differently

The owner and names in the new bullet do not exist: `FourierDeligneTransform` has no folder on main (`eaf17b1`), no open pull request among the 459 indexed, no board package and no line in the merge order (it is only named in SheafConvolutionOnAbelianVarieties and in the open EtaleCohomologyFoundations revision), `artinSchreierSheaf` and `kummerSheaf` are declared by no roadmap, and EtaleCohomologyFoundations §F.0.3 on main is "Finite Tate twists on the canonical roots-of-unity sheaf" (the torsor–character construction exists only in that roadmap's open revision, which is never a dependency). The two overlapping Not-owned bullets (old lines 216–218 and 245–258) are merged into one that keeps the normalization (geometric Frobenius at `x` over `𝔽_{q^n}` has trace `ψ(Tr x)` on `ℒ_ψ`, `χ(N x)` on `ℒ_χ`), now located at SGA 4½, *Sommes trig.*, 1.4, Définition 1.7 and (1.7.6)–(1.7.7) (deligne-sga4half lines 5836, 5878, 5901, 5908–5910) and matched with the Artin–Schreier sheaf `CongruenceSpectralGap` §4.2b consumes, without the nonexistent owner, the two Lean names or the §F.0.3 citation.

## H03 (CBirkbeck) — answered

Correct, and kept in the merged bullet: `CongruenceSpectralGap` §4.2b builds `R^{k−1}mult_!(ℒ_ψ ⊠ ⋯ ⊠ ℒ_ψ)` with geometric-Frobenius trace `(−1)^{k−1}` times the raw sum, and at `k = 2` with first factor `ℒ_χ ⊗ ℒ_ψ` the fibre over `r` is `𝔾_m` with `H⁰_c = H²_c = 0` (Swan 1 at both ends), so the trace is `−∑_x χ(x) ψ(x + r/x) = −K(χ; 1, r)`. Over `𝔽_3` with `ψ_F`: `K(1; 1, 1) = −1` (trace `1`) and `K(1; 1, 2) = 2` (trace `−2`), as in §4.2b's own Checks, and `K(η; 2, 2) = i√3 = η(2)⁻¹ K(η; 1, 1)` confirms 5.1's scaling.

## H04 (CBirkbeck) — answered

Both edits are in `417ba26` (§3.6 at README line 1002, the bullet at line 245); two of their attributions did not resolve, and they are now applied as described in H01 and H02.

## H05 (CBirkbeck) — answered

The build, README-identifier, dependency and `set_option` claims hold, but at `417ba26` the gate read FAIL on `statement-hygiene=26`: 25 notes "`[Fintype k]` beside `[Field k]`" (Layers 0–5) and one `haveI` in the signature of `gaussSum_eq_moebius_mul`. All 26 are repaired in `2efce540`. Every finite-field binder `[Fintype F]`/`[Fintype E]` → `[Finite F]`/`[Finite E]`, and `Fintype.card` → `Nat.card` in the statements. Each of Layers 0–5 carries `attribute [local instance] Fintype.ofFinite`, because Mathlib's `gaussSum`, `jacobiSum` and `quadraticChar` take a `Fintype` structure (`Mathlib/NumberTheory/GaussSum.lean` line 62, `JacobiSum/Basic.lean` line 45, `LegendreSymbol/QuadraticChar/Basic.lean` line 64) and a `letI` in a signature is itself a hygiene finding; the same idiom is at `Mathlib/LinearAlgebra/Matrix/Nondegenerate.lean` line 29. The `haveI : NeZero χ.conductor` is replaced by the named instance `instNeZeroConductor` (from `DirichletCharacter.conductor_ne_zero`, `DirichletCharacter/Basic.lean` line 254). The README conventions (lines 14, 255, 431), the 7.1 paragraph and the Mathlib contract are updated to match. The gate now reads OK with every counter 0.

---

## What changed, item by item

| Place | Old | New |
|---|---|---|
| Scope and ownership, ¶ on DeligneWeightsAndPurity | eleven lines restating the sheaves of 3.6 with `L_χ`, `L_ψ` and "Frobenius" unqualified | five lines: under the hypotheses of 3.3, 4.5, 4.6, 5.4 the sums are minus geometric-Frobenius traces on `H¹_c`; background in 3.6; not a target |
| Not owned here | two bullets ("Kummer and Artin–Schreier sheaves" with `L_χ`; "Sheaf-theoretic identifications" with `ℒ_χ`, `artinSchreierSheaf`, `kummerSheaf`, `FourierDeligneTransform`, EtaleCohomologyFoundations §F.0.3) | one bullet, one notation `ℒ_χ`, `ℒ_ψ`, SGA 4½ locators, `CongruenceSpectralGap` §4.2b |
| §3.6 heading and first paragraph | "owned downstream by `WeilConjectures`, Layer WC.1" | background, not a target; upstream owners of the quoted facts named |
| §3.6 (ii) | trace formula from IG §IG.0.T3 only | determinant formula `DeligneWeightsAndPurity` §1.10 and trace formula IG §IG.0.T3 |
| §3.6 rank paragraph | "tame of rank one on `m` punctures"; "`H²_c` vanishes … which is the hypothesis on `f` or on `ψ`"; weight bound `DeligneWeightsAndPurity` without section; locators "SGA 4½, *Sommes trigonométriques*; Katz, *GKM*, Ch. 4" | `χ_c` computed per row (3.3 included, and `ψ = 1 ≠ χ`); the hypothesis killing `H²_c` named per row (3.3 also by `χ ≠ 1` when `ψ = 1`; 5.4 by `a b ≠ 0`); §7.12; SGA 4½ 1.4, Déf. 1.7, (1.7.6)–(1.7.7), Scholie 1.9, (3.2.1), Ex. 3.5, Prop. 4.2, Thm 7.4 |
| §3.6 Checks | — | new Check pinning Deligne's sign `τ(χ, ψ) = −g(χ⁻¹, ψ)` with a computed `𝔽_7` witness |
| Layer 3 *Dependencies* | "3.6 is owned downstream by `WeilConjectures`" | "3.6 is background and not a target" |
| Downstream consumers | "(Scope and ownership)" | "(3.6) … (Scope and ownership)" |
| References | — | SGA 4½, *Sommes trig.*, with the locators above |
| `Suggested.lean` module docstring | "Recorded in `README.md` but owned downstream" | "Recorded in `README.md` as background and not a target" |
| `Suggested.lean` Layers 0–5 (`2efce540`) | `[Field F] [Fintype F]`, `[Field E] [Fintype E]` in 6 `variable` lines, 7 definitions and 4 theorems' `∀` binders; `Fintype.card F`/`E` in 13 statements | `[Finite F]`, `[Finite E]`; `Nat.card F`/`E`; `attribute [local instance] Fintype.ofFinite` once per layer; `kloostermanSum` keeps `[CommRing R] [Fintype R]` (not a field, not flagged) |
| `Suggested.lean` Layer 7 (`2efce540`) | `haveI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩` in the signature of `gaussSum_eq_moebius_mul` | instance `instNeZeroConductor` (any `CommMonoidWithZero R`, `[NeZero N]`) before it; the theorem's signature has no local instance |
| `Suggested.lean` module docstring (`2efce540`) | "`[Field F] [Fintype F]`" | "`[Field F] [Finite F]`, `q = Nat.card F`", plus one sentence on `Fintype.ofFinite` and `Fintype.subsingleton` |
| README Summary line 14, Conventions line 255, Layer 0 line 431 (`2efce540`) | `[Fintype F]`, `q = Fintype.card F` | `[Finite F]`, `q = Nat.card F`; line 255 adds that sums read `F` through `Fintype.ofFinite F` and agree with any other `Fintype` structure |
| README 7.1 and From Mathlib (`2efce540`) | — | 7.1 says `τ(χ^∗)` is read on `ZMod f`, `f ≠ 0`, through `instNeZeroConductor`; the contract adds `DirichletCharacter.conductor_ne_zero`, `Fintype.ofFinite`, `Fintype.subsingleton`, `Nat.card` |

The Katz *GKM* citation is dropped from §3.6: the sources service found no legal copy and the operator's
local sources do not hold it; the twisted rank-two count it supported follows from (3.2.1). The
References entry for Katz (equidistribution boundary only) is unchanged and now agrees with the text.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope: under the hypotheses of 3.3/4.5/4.6/5.4 the sums are `−tr(Frob \| H¹_c)` | `𝔽_3`: `χ = η`; `χ = 1 ≠ ψ`; `ψ = 1 ≠ χ`; `χ = ψ = 1` | `g(η) = i√3`, eigenvalue `−i√3`; `g(1, ψ) = −1`, eigenvalue `1` on `H¹_c(𝔾_m, ℒ_ψ)`; `g(χ, 1) = 0`, `H¹_c = 0`; `χ = ψ = 1`: `g = 2 = −1 + 3` needs `H²_c`, excluded by 3.3 | holds on its hypotheses only | "under the hypotheses of 3.3, 4.5, 4.6 and 5.4" added |
| Normalization `tr(Frob_x \| ℒ_ψ) = ψ(Tr x)`, `tr(Frob_x \| ℒ_χ) = χ(N x)` | `𝔽_3`, `x = 1`; `𝔽_9`, `x = 1` | `ψ(1) = ζ = e(1/3)`; over `𝔽_9`, `Tr 1 = 2`, trace `ζ²` (agrees with `CongruenceSpectralGap` §4.2b's Checks); SGA (1.7.6) `F*_x = χ(f₀(x))` after the `χ⁻¹` push-out of Déf. 1.7 | holds | located at SGA 4½ |
| `k = 2` twisted convolution trace `−K(χ; 1, r)` | `𝔽_3`, `χ ∈ {1, η}`, `r ∈ {1, 2}` | `K(1;1,1) = −1`, `K(1;1,2) = 2`, `K(η;1,1) = e(2/3) − e(1/3) = −i√3` | holds | kept |
| 5.1 scaling `K(χ; a, b) = χ(a)⁻¹ K(χ; 1, ab)` | `𝔽_3`, `χ = η`, `a = b = 2` | `K(η;2,2) = e(1/3) − e(2/3) = i√3`; `η(2)⁻¹ K(η;1,1) = (−1)(−i√3) = i√3` | holds | kept |
| 3.6 rank, row 3.3 | `ψ ≠ 1`; `ψ = 1 ≠ χ` | `χ_c = 1·0 − 1 = −1` → rank 1 (`L = 1 + i√3 T` over `𝔽_3`); `χ_c = 0`, `H²_c = 0` → `L = 1` (3.2's `k = 0` Check) | holds | made explicit |
| 3.6 rank, row 4.5 | `𝔽_7`, `f = X² − X`, `η`; `f = c` constant | `χ_c(U_f) = 2 − 3 = −1`, rank `1`, `∑ η(x² − x) = 1 − 1 − 1 − 1 + 1 = −1`, `L = 1 − T`; constant `f`: `H²_c ≠ 0`, `L = (1 − χ(c) q T)⁻¹`, excluded as `c · 1^d` | holds | "`m` punctures" (there are `m + 1`) → `χ_c(U_f) = 1 − m` |
| 3.6 rank, row 4.6 | `f = X`; `f = X^p − X` over `𝔽_p` | `χ_c = 0`, `L = 1` (4.6's Check); `p ∣ n`: sheaf constant, `H²_c ≠ 0`, excluded | holds | hypothesis named |
| 3.6 rank, row 5.4 | `𝔽_3`, `a = b = 1`; `b = 0` | `χ_c = 0 − 2 = −2`, `L = 1 − T + 3T²`, `K_9 = −(1 − 6) = 5`; `b = 0`: `χ_c = −1`, rank 1 (a Gauss sum), excluded by `a b ≠ 0` | holds | hypothesis named |
| Weight bound `\|ω_i\| ≤ √q` from `H¹_c` weights `≤ 1` | row 4.5 over `𝔽_7` | `ω = 1 ≤ √7` (weight 0, so "≤", not "=") | holds | §7.12 cited |
| Deligne-sign Check | `𝔽_7`, cubic `χ`, `χ(3) = e(1/3)` | `g(χ) = 2.3705 − 1.1751 i`, `\|g\|² = 7.0000`; `−g(χ) = −2.3705 + 1.1751 i`; `τ(χ, ψ) = −g(χ⁻¹) = −2.3705 − 1.1751 i` | holds; the conjugate is the plausible wrong reading | Check added |
| Carrier `[Field F] [Finite F]`, `q = Nat.card F` (every Layer 0–5 statement) | `ZMod 3`; `ZMod 2`; `ℚ` as a negative control | `Nat.card (ZMod 3) = 3 = Fintype.card (ZMod 3)` (`Nat.card_eq_fintype_card`); `ZMod 2`: `Nat.card − 1 = 1`, no natural-subtraction junk since a field has `q ≥ 2`; `ℚ`: `Nat.card ℚ = 0` would turn the Weil bounds into `‖∑‖ ≤ 0`, but `ℚ` has no `Finite` instance and `∑ x : ℚ` does not elaborate | the `[Finite F]` binder is load-bearing and admits exactly the finite fields, as `[Fintype F]` did | binders changed |
| Sums through `Fintype.ofFinite F` against a native instance | `g(η)` over `ZMod 3` | `ζ − ζ² = i√3` under `ZMod.fintype 3` and under `Fintype.ofFinite (ZMod 3)` (`Fintype.subsingleton` makes the two `Finset.univ` equal) | holds | — |
| 5.2 with `(Nat.card F − 1 : ℂ)⁻¹` | `𝔽_3`, `χ = 1`, `a = b = 1`; `𝔽_2` | left `ψ(2) + ψ(1) = −1`; right `½ (g(1)² + g(η)²) = ½ (1 − 3) = −1`; over `𝔽_2` the factor is `(2 − 1)⁻¹ = 1`, never a zero denominator | holds | `Fintype.card` → `Nat.card` |
| `instNeZeroConductor` and 7.1 | `1_12`, `1_7`, a primitive `χ` mod `5`; `N = 0` | conductors `1`, `1`, `5`; `τ(1_12) = μ(12) · 1 · τ(1_1) = 0` and `τ(1_7) = μ(7) · 1 · 1 = −1`, where `τ(1_1) = 1` on `ZMod 1` (its only element is a unit); README 7.1 Checks give `0` and `−1`; `N = 0` excluded by `[NeZero N]` | holds | `haveI` → named instance |
| 3.6 ownership sentence "none of those roadmaps consumes `L(λ, T)`" | WeilConjectures (#1208), DeligneWeightsAndPurity (#929), InverseGaloisAndArithmeticFundamentalGroups (#850), CongruenceSpectralGap (#1504) at their heads | `CharacterSums` occurs in none of the four READMEs | holds | — |

## Elaborated signatures

`a7f12ef2` changed no declaration. Its check: I compared the 50 elaborated types in `signatures.md`
with the README statements. Its two leads, `crtFactorLeft` and `crtFactorRight` ("looks dropped:
`(h : c₁.Coprime c₂)`"), are false positives: both elaborated types carry the explicit argument
`c₁.Coprime c₂ →`.

`2efce540` changes binders, so its check is mechanical. I temporarily appended `#check @name` for all
51 declarations (the 50 plus `instNeZeroConductor`) to `Suggested.lean`, ran the targeted build once
and restored the file before committing. In the output, every Layer 0–5 declaration on a field
carries `[Field F] [Finite F]`, and those that mention `E` also carry `[Field E] [Finite E] [Algebra F E]`.
`stepanov_kummer`, `stepanov_artinSchreier`, `stepanov_kloostermanCurve` and `kloostermanSum_lift`
carry these binders inside their `∀`. No `Fintype` binder remains on a field. Every cardinality is
`Nat.card`. `kloostermanSum` is still `{R} [CommRing R] [Fintype R]`, and
`gaussSum_eq_moebius_mul` is `∀ {N} [NeZero N] (χ : DirichletCharacter ℂ N), gaussSum χ
ZMod.stdAddChar = …` with no local instance. No section binder was lost: each statement keeps every
hypothesis it had, with `Fintype` replaced by `Finite`. The Layer 7 types are unchanged apart from
`gaussSum_eq_moebius_mul`.

## Ownership, overlap and direction

- My repair removes two owner attributions (WeilConjectures WC.1, FourierDeligneTransform) and adds
  none; every roadmap the new text cites is earlier in the merge order (InverseGaloisAndArithmeticFundamentalGroups
  line 44, DeligneWeightsAndPurity line 78, CongruenceSpectralGap line 146; this roadmap line 147).
- Ownership of the Artin–Schreier and Kummer sheaves was searched by object (`roadmaps grep` for
  Artin–Schreier sheaf, Kummer sheaf, `ℒ_ψ`, `L_ψ`, Lang torsor) on main and at the open heads: only
  CongruenceSpectralGap §4.2b uses `ℒ_ψ` (consumed through a contract); no roadmap owns `ℒ_χ`. The
  README now says that neither is a target here and names no owner.
- Ids that only an open revision defines: none (the removed §F.0.3 attribution was the only one).
- If WeilConjectures is to own the identification of sheaf `L`-functions with the `L`-series of 3.1,
  it has to come after this roadmap in the merge order and consume 3.1, or state it for its own
  carrier; that is a decision for the WeilConjectures design, not an edit here.
- Depcheck after `2efce540`: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)` (no UPWARD, CYCLE or
  moved line). The new instance `instNeZeroConductor` has no owner elsewhere: no `NeZero` instance
  for `DirichletCharacter.conductor` exists at the pinned Mathlib or Tau Ceti (Tau Ceti's
  `NumberTheory/DirichletCharacter/PrimeToPart.lean` line 70 makes a local `have` only).

## Sources

- `deligne-sga4half` (Deligne, SGA 4½, LNM 569; institutional copy from the IAS, fetched through the
  sources service): read at lines 5836–5945 (1.4–1.9), 6349–6451 (3.1–3.5), 6552–6600 (4.1–4.4) and
  7284–7350 (7.1–7.5). Not recorded in a manifest: this roadmap folder has no `sources.toml` and
  this job may edit only the README and `Suggested.lean`.
- Katz, *Gauss Sums, Kloosterman Sums, and Monodromy Groups*: no legal copy found; it is no longer
  cited for 3.6, so no `needs-references.toml` request was written.

## Untrusted text

The comment refers to issue #1888 and to an earlier note; #1888 was read as data (it plans a
FourierDeligneTransform roadmap that does not exist yet). Nothing in either asks for commands,
credentials or work outside this job.

## Build and gate

- `lake build TauCetiRoadmap.CharacterSumsOverFiniteFields.Suggested` at `2efce540`:
  `Build completed successfully (18239 jobs).` The only warnings are the 32 `declaration uses 'sorry'`.
- Gate, after the commit `2efce540`:

      gate CharacterSumsOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  At `a7f12ef2` the same line read `statement-hygiene=26 … FAIL`. The 26 findings are repaired in
  `2efce540` (H05).
