# GATE-LubinTateFormalModulesAndQuasiCanonicalLifts~1: answers to the review of `9147ad2`

One comment (CBirkbeck, 2026-11-15T14:47:22Z) carries 16 findings F01–F16, numbered here H01–H16 in
order. The quoted copy given to this job stops inside F10, so the full comment was read from the
pull request and all 16 are answered. Commit `5e497cd2` on top of `9147ad2`. Line numbers below are
those of `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` (README) and
`TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean` (Lean) at that commit.

## H01 (CBirkbeck) — applied

§2.3 (README 1054) now first proves that `[π]` of the module `G_LT` of VectorBundlesAndIsocrystals Layer 5 is a Lubin–Tate series for `π`, for `K` of either characteristic, as the supplier allows (its Conventions fix `E` of either characteristic, and its Layer 5 treats equal characteristic by sequences with `r_i = r_(i+1)^q`). That makes `G_LT = F_g` by §1.3 and lets §1.4 carry the supplied tower. Also added: a new `### From TauCetiRoadmap.VectorBundlesAndIsocrystals` contract (README 317), the `G_LT` sentence in the scope bullet (README 62) and in the RelativeFarguesFontaine contract, the supplier in the *Needs* of §§2.3–2.4 and the Layer 2 Dependencies, and a negative Check (README 1101). For `ℚ₃`, `π′ = −3`, `f′ = −3X + X³`, we get `[3]_(f′) = −f′ = 3X − X³` with reduction `−X³`, and first division fields `ℚ₃(√3) ≠ ℚ₃(√−3)`; the same computation over `𝔽₃((t))` gives `tX − X³`.

## H02 (CBirkbeck) — applied

§0.3 (README 681): "commutes with field embeddings and with coordinate isomorphisms over `O_K`" → "commutes with coefficient-field embeddings; for `φ : F → G` over `O_K` with linear coefficient `c`, evaluating `TauCeti.FormalGroupHom.subst_log` gives `ℓ_G(φ(x)) = c·ℓ_F(x)`, cited, not a target". The pinned statement is `subst f.toPowerSeries G.log = coeff 1 f.toPowerSeries • F.log` (`TauCeti/RingTheory/FormalGroup/Logarithm/Naturality.lean:62`). Added the Check `φ = 2X`, `x = 3`: `6 = 2·3 ≠ 3` (README 702), and the declaration to §0.3 *Needs*. No other passage asserts invariance of the logarithm (§§0.2, 2.4, 8.5, 9.1–9.3 concern point maps, characters or traces).

## H03 (CBirkbeck) — applied

New `exists_hondaType_log_of_map_zsmulSeries` (Lean 231). Its hypotheses are `O = W(𝔽_(p²))`, a fraction field `K`, `s = ±1`, a commutative `G` with `PowerSeries.map residue (G.zsmulSeries (s*p)) = X^(p²)`. Its conclusion is `∃ A, p•ℓ − s•ℓ(X^(p²)) = p•map A`, with `ℓ = (G.map (algebraMap O K)).log` (H70, Lemma 4.2, line 738, p.231, with Proposition 3.3, line 537, p.226). The docstring also called conclusion (iii) of §4.3 not statable, so `exists_strictIso_hondaLog_of_map_zsmulSeries` (Lean 250) states it too: a strict `TauCeti.FormalGroupIso G H` onto an `H` with `pℓ_H − sℓ_H(X^(p²)) = pX`. That equation determines `ℓ_s` (H70, Theorem 2, p.223). The not-statable entry now names only the criterion `vC = tu` and the left-associate classification of §4.2, which live in `O_σ[[T]]`. README §4.3 (README 1643) names both theorems; the import `TauCeti.RingTheory.FormalGroup.Logarithm.Basic` was added.

## H04 (CBirkbeck) — applied

`existsUnique_lubinTate_intertwiner` → `exists_lubinTate_interpolation` (Lean 131). It covers every `n` and `a : Fin n → O`: existence of `H : MvPowerSeries (Fin n) O` with zero constant term, coefficient `a i` at `single i 1` and `subst H f = MvPowerSeries.subst (i ↦ subst (X i) g) H`, uniqueness over `O`, and the statement that every such series over a fraction field `K` is `MvPowerSeries.map (algebraMap O K) H`. README §1.2 (README 807) names it and keeps arity one as a specialization. A new Check (README 822) computes `H = X + Y + XY` for `f = g = 2X + X²` over `ℤ₂`, with both sides `(1+X)²(1+Y)² − 1`, against the linear candidate's `XY` coefficients `2` vs `0`. No other roadmap cites the old name.

## H05 (CBirkbeck) — applied differently

The scope bullet (README 73), the EndoscopicTransferAndUnitaryTraceComparison contract (README 341), the Layer 3 introduction and §3.6 (README 1474) now say that §12.3 is a union of components indexed by quasi-isogeny height. They identify §3.1 only with its level-zero, height-zero component. A Check (README 1502) shows that `ρ` composed with `[ϖ]` has degree `q^h` and lies in another component. The suggested "`ρ = ι`" is replaced by "`ι` or `ι⁻¹`, in the supplier's direction", because §3.1 marks `G ⊗ k ≃ G₀` while §12.3 does not fix the direction of `ρ`. The converse is given by the units of the maximal order of the division algebra of invariant `1/h`.

## H06 (CBirkbeck) — applied

The same three passages restrict the §10.2 comparison to connected `H_β`, through `BarsottiTate.equivFormalLieGroup` (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.13, added to §3.6 *Needs*). Witness: the supplier allows every `β` in `GL_n(O_r)diag(ϖ,1,…,1)GL_n(O_r)`, and its own Check treats connected height `k < n`. New Check (README 1497): `β = diag(p,1)` gives `μ_(p^∞) ⊕ ℚ_p/ℤ_p`, with one Serre–Tate parameter against none for its height-one formal completion. The existing `O_r`/`O_r[[T]]` Check now says "connected".

## H07 (CBirkbeck) — applied differently

The §2.5 route (README 1163) is reordered as proposed: unit formula first, then a kernel of exactly `π^ℤU(K,m)` by faithfulness of the §2.3 scalar action, then the kernel identified as the norm group by `TauCeti.ClassFieldTheory.artinMap_restrict` and `TauCeti.ClassFieldTheory.localArtinMap_eq_zero_iff` (`TauCeti/NumberTheory/ClassFieldTheory/Local/Reciprocity.lean:139`, added to the From Tau Ceti contract, README 281, and §2.5 *Needs*). The index is kept only as a consistency check. Unlike the suggested text, the route keeps "every uniformizer `π′` is a norm from its own tower": that is what pins `Art_K(π′)` on `K_(π′)` before the `K̂^ur` comparison of LT65 Lemma 2. The witness is a Check (README 1200): both subgroups have index `72`, and `exp(−3α) ≡ 1 − 3α ≢ 1 mod 9`.

## H08 (CBirkbeck) — applied

The four §3.2 bullets are replaced by three computed Checks (README 1338–1352), and the `𝔽_q((t))` logarithm Check is kept. First, additive vs multiplicative over `ℤ₂` give `(0,0)` vs `(1,1)`. Second, the additive module transported by `X + cX²` over `W(𝔽₄)` has `XY` coefficient `−2c` and `[a]` coefficient `c(a − a²)`; at `c = 1` the `[ζ]` coefficient `ζ − ζ²` is a unit, since `(1 − ζ)(1 − ζ²) = 3`, while `[2]` gives `−2`. Third, the multiplicative module transported by `X + 2X²` has `XY` coefficient `1 − 2c = −3` but is the same marked deformation.

## H09 (CBirkbeck) — applied

One table headed "Former numbering | Former title | Now" (README 467) closes H09 and H10. It has 61 rows: `LT.0`–`LT.9` and all 51 design identifiers, with the aliases "Analytic logarithm", "Tate module" and "Artin comparison". So `LT.7/bko-quasi-fields` → §7.3, `LT.7/ringclass-galois` → §7.4, `LT.7/lattice-neighbors` → §7.6, and `LT.8/bko-character-data`, `/quadratic-directions`, `/bko-fields`, `/field-generator-comparisons`, `/sign-generator-comparison` → §§8.1–8.5. Every form cited by AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocityPartII, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower and RelativeFarguesFontainePartII at their heads resolves.

## H10 (CBirkbeck) — applied

The same table (README 467) maps `LT.k` → Layer `k` and the four cited titles: "Finite-height torsion comparison" → §2.1, "Formal-module Tate module" → §2.2, "Lubin–Tate character" → §2.4, and "Comparison with local reciprocity"/"Artin comparison" → §2.5. No section of the README was renumbered.

## H11 (CBirkbeck) — applied

§0.3 (README 690): "(H70, §1, pp.216–219; LT65, §1, p.383)" → "(H70, Theorem 1, p.218, for the formal logarithm and `F = ℓ⁻¹(ℓ(X) + ℓ(Y))`; LT65, §1, p.383, for its evaluation on maximal ideals; convergence is from the Tau Ceti declarations named in the *Needs:* line)". Theorem 1 is H70 line 241, on text page 6 = p.218. The `sources.toml` part is not applicable here: this pull request's folder has no `sources.toml`.

## H12 (CBirkbeck) — applied

§9.3 *Needs* (README 2530): "§§9.1, 9.2, 8.4, 8.5, 5.5, 3.6, 0.3" → "§§9.1, 9.2, 8.4, 8.5, 4.4, 0.3". Layer 9 Dependencies (README 2539): "§§0.2, 0.3, 3.6, 4.4, 5.5, 8.4, 8.5" → "§§0.2, 0.3, 4.4, 8.4, 8.5", which is the union of the §§9.1–9.3 *Needs*.

## H13 (CBirkbeck) — applied differently

§3.3 keeps the degenerate `I = 0` Check and replaces the other three with computed ones (README 1382–1411). (A) `h = (1+ε)X` over `𝔽₂[ε]` gives `X + Y + (1+ε)XY` and `[2] = (1+ε)X²`, a coboundary of `ψ = X`, whereas strict `ψ` give `Δ` an `XY` coefficient `2c₂ = 0`. (B) `y² + txy + y = x³`, with `Δ = t³ − 27` and `[2] ≡ tz² + z⁴ mod (2, z⁵)`, gives a nonzero class, since coboundaries change `[2]` by `εψ([2]₀)`, of order ≥ 4. The proposed third Check (`[2] + εX` over `ℤ₂`) also violates additivity, because `[2] = F(X, X)` is forced, so it does not isolate the tangent condition. It is replaced by the ramified `ℚ₂(√2)` example with `δ_π = εX`, which is not a coboundary (those change `[π]` by `εψ(X²)`).

## H14 (CBirkbeck) — applied

§5.3 (README 1826): "The zero map corresponds to `a = 0`" → the direction Check. For `L₁ = T`, `L₂ = p⁻¹T`: `{a : aT ⊂ p⁻¹T} = p⁻¹ℤ_p ∋ 1` (the quotient isogeny, of degree `p`), with `a = p⁻¹` an isomorphism, while the reversed inclusion gives `pℤ_p ∌ 1`. The zero map lies in both sets.

## H15 (CBirkbeck) — applied

The shared `variable {K : Type} …` was removed. `finrank_adjoin_primitive_lubinTate_root` now has `{K : Type*}` with the four instances (Lean 168; elaborated `∀ {K : Type u_1} …`), and no `CharZero`, since Layer 2 covers either characteristic. The two Artin theorems keep `{K : Type}` (Lean 187, 209), each with the docstring sentence that the pinned `TauCeti.ClassFieldTheory.artinMap` is stated in universe 0 (`ArtinMap.lean:106`). The From Tau Ceti contract records this.

## H16 (CBirkbeck) — applied differently

§8.3 (README 2365): "(BKO21, §2, pp.947–948; §5, pp.955–959)" → "(BKO21, §4, p.954, for the fixed fields `Θ_n` and `Ψ_n`; §2, pp.947–948, for `G^±` and the characterization of `Ψ_∞`)". The sources are BKO21 line 516 for the definition and lines 237–249 for `G^±` and `Ψ_∞`. The proposed clause "§5.0.2 for `Ψ_s ⊂ Ψ′_(s+1)`" is left out because §8.3 states no such inclusion. §9.1 (README 2454): "(BKO21, §4, pp.954–955; §5.0.2, pp.958–959; …)" → "(BKO21, §5.0.2, p.959, … Definition 5.4 and Theorem 5.5(ii); LT65, §1, p.383)", from BKO21 lines 736–751. No `sources.toml` is in this folder.

## Build

`lake build TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts.Suggested`: exit 0, "Build completed successfully (19284 jobs)". There are exactly 8 `declaration uses 'sorry'` warnings, one per theorem, and no errors.

**Signatures.** For one build, `#check @name` lines for all 11 declarations were appended to `Suggested.lean`; they were removed before the commit. Each elaborated type was compared with its README statement. `exists_lubinTate_interpolation` keeps `[IsDomain O] [IsDiscreteValuationRing O] [Finite (ResidueField O)]` and gains `(K : Type u_2) [Field K] [Algebra O K] [IsFractionRing O K] (n) (a : Fin n → O)`. Both Honda theorems carry `[Fact p.Prime]`, `(K : Type u_1) [Field K] [CharZero K] [Algebra W K] [IsFractionRing W K]` and `[G.IsComm]`. The degree theorem is now `{K : Type u_1}`, and the two Artin theorems are `{K : Type}`. The other declarations are unchanged. No binder is lost.

## Gate

`gate LubinTateFormalModulesAndQuasiCanonicalLifts: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (exact output):

```text
depcheck: 244 roadmaps, 2233 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The new supplier VectorBundlesAndIsocrystals is line 127 of the merge order, and this roadmap is line 352. `roadmaps resolve` on the README finds no unresolved cross-roadmap citation and no unresolved Lean name.

## Adversarial pass on added and changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §2.3 `[π]_(G_LT)` is Lubin–Tate for `π` | `ℚ_p`, `G_LT = 𝔾̂_m`; `ℚ₂`; `𝔽_q((t))`; `π′ = −3` over `ℚ₃` | `(1+X)^p−1 ≡ X^p`; `2X+X² ≡ X²`; `tX+X^q ≡ X^q`; `[3]_(f′) = 3X − X³ ≡ −X³` | holds for `π`, fails for `−3`, as it must | target + Check |
| §2.3 field witness | `ℚ₃(√3)` vs `ℚ₃(√−3)`; `𝔽₃((t))(√t)` vs `(√−t)` | equal iff `−1` is a square in `ℚ₃` / `𝔽₃`: no | towers differ | Check |
| §0.3 `ℓ_G(φ(x)) = c·ℓ_F(x)` | additive `ℤ₃`, `φ = 2X`, `x = 3`; `𝔾̂_m`, `[u]`; `x = ζ_p − 1`; `x = 0` | `6 = 2·3`; `u·log(1+x)`; `0 = u·0`; `0 = 0` | true; old square false at `c = 2` | text + Check |
| `exists_lubinTate_interpolation` | `n = 0`; `n = 1`, `a = 0, 1`, `f = g`; `n = 2`, `2X + X²`, `a = (1,1)`; uniqueness over `K` | `H = 0`, both sides `0`; `0`, `X`; `X+Y+XY`, both sides `(1+X)²(1+Y)²−1`, linear candidate off by `2XY`; degree-`r` factor `π − π^r ≠ 0` | true | Lean + README |
| `exists_hondaType_log_of_map_zsmulSeries` | Honda model `ℓ_s`; `G = F_(2X+X⁴)`, `p = 2`, `s = 1`; wrong sign; additive; `𝔾̂_m` | `A = X`; `X⁴` coefficient `2(−1/14) − 1 = −8/7 ∈ 2ℤ₂`; `[−2]̄ = [−1]̄(X⁴) ≠ X⁴` (excluded); reductions `0`, `X^p` ≠ `X^(p²)` (excluded) | true; hypothesis separates signs; non-vacuous for both signs via `spX + X^(p²)` | Lean + README |
| `exists_strictIso_hondaLog_of_map_zsmulSeries` | uniqueness of `ℓ_s`; `G = F_(2X+X⁴)` | `n = 0`: `(p − s)ℓ_0 = 0`, `p ≠ s`; coefficient at `p^(2j)`: `(s/p)^j = (sp)^(−j)`; degree-4 comparison coefficient `−1/14 − 1/2 = −4/7 ∈ ℤ₂` | true (H70 Theorems 2–3) | Lean |
| §2.5 route and Check | `ℚ₃`, `m = 1`, `u = −1, 4`; `m = 0`; unramified `K/ℚ₃`, `m = 2` | `[−1]` moves `μ₃`, `[4]` fixes it, index `2`; `m = 0`: `Kˣ`; both indices `72`, `exp(−3α) ≡ 1 − 3α mod 9` | kernel is `π^ℤU(K,m)`; index does not determine it | route + Check |
| §3.2 Checks | `ℤ₂` add/mult; `W(𝔽₄)`, `h = X + cX²`; `ℤ₂`, `h = X + 2X²` | `(0,0)`/`(1,1)`; `−2c`, `c(a − a²)`, `(1−ζ)(1−ζ²) = 3`; `1 − 2c = −3`, `h̄ = X` | true | Checks |
| §3.3 Checks | `𝔽₂[ε]`, `(1+ε)X`; `E_t`; `ℚ₂(√2)` | `X+Y+(1+ε)XY`, `(1+ε)X²`, strict `ψ`: `2c₂ = 0`; `Δ = t³ − 27`, `[2] ≡ tz² + z⁴`; `[π] = εX + X²` vs `X²`, coboundary order ≥ 2 | coboundary / nonzero class / tangent condition isolated | Checks |
| §3.6 comparison | `n = 1`; `n = 2` connected; `β = diag(p,1)`; `ρ ∘ [ϖ]` | params `0/0`, `1/1`, `1/0`; degree `q^h`, height ≠ 0 | agrees only for connected, height-zero | text + 2 Checks |
| §5.3 Check | `T`, `p⁻¹T`; reversed | `p⁻¹ℤ_p ∋ 1`; `pℤ_p ∌ 1` | direction pinned | Check |

Every existing Check on a changed object was recomputed against the new text. §1.2: `a = 0, 1`, `1/2`, `p = 2`, `ā^p ≠ ā` are unchanged and consistent. §2.3: degrees `1, 2` at `ℚ₂` and `2, 6` at `ℚ₃` are consistent with the bridge. §§4.1, 4.3: `ℓ_(±1)`, `2/p ∉ pO`, `−1/14` agree with the two Honda theorems. §3.6: heights `1, 2` at `O_r` now carry "connected".

## Ownership and sources

The comparison of `G_LT` with a Lubin–Tate series is stated by no other roadmap. `roadmaps grep 'G_LT'` finds only VectorBundlesAndIsocrystals' definition, so this roadmap owns the comparison: it owns the series construction and is later in the merge order. Honda types of formal group laws are owned by no other roadmap; the other "Honda" hits are Fontaine's Honda systems (FiniteFlatGroupsAndIntegralPadicHodgeTheory) and Honda–Tate theory (EndoscopicTransferAndUnitaryTraceComparison §8.3). No Lean name here is the fully qualified name of another roadmap's declaration. No new source was needed. H70 was read at lines 241, 431, 482, 537 and 738; BKO21 at lines 225–262, 514–529 and 733–751. LT65 stays uncertified and is cited by locator. Nothing was added to `needs-references.toml`.

## Notes for the maintainer

- New supplier edge: VectorBundlesAndIsocrystals Layer 5 (downward, line 127 against 352).
- Renamed Lean declaration: `existsUnique_lubinTate_intertwiner` → `exists_lubinTate_interpolation`. New: `exists_hondaType_log_of_map_zsmulSeries`, `exists_strictIso_hondaLog_of_map_zsmulSeries`. No roadmap cites the old name.
- F11 and F16 also ask for `sources.toml` edits. That manifest is not part of this pull request's roadmap folder, so the locators are changed in the README only; the board manifest still needs the H70 locator "§1, Theorem 1, p.218" and the BKO21 locator update.
- Not verified from a text: the mixed-characteristic reading of the supplier's Dieudonné normalization `F = σ/π`. The §2.3 route reads it in the supplier's variance, and the `−3` Check would catch a module for another uniformizer.
