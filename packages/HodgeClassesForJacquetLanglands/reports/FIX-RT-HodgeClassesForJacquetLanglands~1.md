# FIX-RT-HodgeClassesForJacquetLanglands~1

Repair of red-team round 1 (passes a and b). Files changed: `packages/HodgeClassesForJacquetLanglands/README.md`,
`design/plan.json` (top-level `gaps` only), `sources.toml` (two locators). `Suggested.lean` is unchanged.
Sibling roadmaps were read at their heads through `roadmaps show` (GL2AutomorphicRepresentationsAndTransfer,
MetaplecticAutomorphicForms, PadicHodgeTheory, AutomorphicBundles, AutomorphicFormsOnReductiveGroups,
MotivesAndAlgebraicCycles, ClassicalAdicEtaleCohomology, EndoscopicTransferAndUnitaryTraceComparison) and on
main (ClassFieldTheory, ComplexComparisonPartII).

## RT-HodgeClassesForJacquetLanglands~1a/F01 (P2) — applied differently

Verified: GL2AutomorphicRepresentationsAndTransfer §R17.1.5 states both realization (`existsQuaternionRamification_iff`)
and classification by local splitting (`nonempty_quaternionAlgEquiv_of_localSplitting`). The suggested gap text
still asked for the classification and the order-two clause, which follow from §R17.1.5 with ClassFieldTheory
Layer 10. Gap narrowed to the embedding criterion only (as b/F12); §0.4 gained a proof route.

## RT-HodgeClassesForJacquetLanglands~1b/F12 (P2) — applied

Contract and plan `needs` of gap:quaternion-ramification-classification → only "E embeds in B iff no place ramified
in B splits in E". §R17.1.5 added to Scope, GL2 contract, §0.4 *Needs:*, Layer 0 Dependencies. §0.4 proof route:
invariants `1/2` on `S`, realization by §R17.1.5, `brLocalization_injective`, `S ≠ ∅` by classification. §10.2 keeps the gap.

## RT-HodgeClassesForJacquetLanglands~1a/F02 (P2) — applied

Verified PadicHodgeTheory §3.1 ("Subobjects and quotients of an admissible object are admissible", applied to
`B_dR`). Gap derham-local-system-cohomology (README and plan, section now §7.2) keeps only one-point rigidity.
§3.1 added to Scope and contract; §9.4 cites it, *Needs:* "PadicHodgeTheory §§3.1, 3.3" (gap dropped there).

## RT-HodgeClassesForJacquetLanglands~1a/F03, RT-HodgeClassesForJacquetLanglands~1b/F08 (P3) — applied

§7.10 Check "two signs … two pairings" → "`F` real quadratic, `d = 1`: `2² = 4` sign vectors, four nonzero pairings;
for `k_v = 2` at the compact place both signs give weight `0`, so four pairings are two up to scalars." Agrees with
the statement (`ε ∈ {±1}^{Σ_∞}`) and the Layer 7 Example.

## RT-HodgeClassesForJacquetLanglands~1a/F04 (P3) — applied

Layer 0 Dependencies now the union of §§0.1–0.7 *Needs:* (adds §R17.1.5, gap:vhs-hodge-decomposition,
ClassicalAdicEtaleCohomology §8.2, PadicHodgeTheory §§3.1, 3.6, 7.2 and its gap, `TauCeti.symPowerRep`). Layer 9 adds
PadicHodgeTheory §§3.1, 4.4, Mathlib `exteriorPower.map`. Pattern, by script over all layers: Layers 6, 7, 8, 10
gained their missing gaps, Mathlib/Tau Ceti names.

## RT-HodgeClassesForJacquetLanglands~1b/F01 (P1) — applied

Verified: MetaplecticAutomorphicForms uses `tilde s` only in §§3.30–3.32a, never defines it; IP23 line 2452 takes it
from Periods I. Gap quaternionic-shimizu-lift (README, plan) now first asks for the Periods-I splitting `s̃_v` (domain:
equal-multiplier pairs; trivialises `z_Y`; standard a.e.; product one). §3.32a contract, Layer 6 preamble, §6.2,
§7.4 cite the gap.

## RT-HodgeClassesForJacquetLanglands~1b/F02 (P2) — applied

Verified: MetaplecticAutomorphicForms §3.9 is orthogonal–symplectic, nonarchimedean, odd residue. New
gap:unitary-stable-range (supplier MetaplecticAutomorphicForms §3.9; README contract and plan): nonvanishing of the lift
of every character of `U(V_v)`, `V_v` Hermitian line, to the split skew-Hermitian plane, all characteristic-zero local
fields. §6.1 route and *Needs:*, Layer 6 Dependencies, Scope updated; §3.3 cited.

## RT-HodgeClassesForJacquetLanglands~1b/F03 (P2) — applied

Verified AutomorphicBundles §0.2 ("finite tame quotient"; infinite central kernel left to a separate argument). §0.2
now states the effective-quotient descent: `Γ̄_g = Γ_g/(Γ_g ∩ Z(ℚ))` acts freely, `Γ_g ∩ Z(ℚ) = Z(ℚ) ∩ K` acts
trivially on `X⁺` and `V` (Mil17, Lemma 5.13, pp. 57–58). Contract and Scope reworded; new Check (`ℚ(√2)`, `K(3)`).

## RT-HodgeClassesForJacquetLanglands~1b/F04 (P2) — applied

Verified MetaplecticAutomorphicForms §2.5 is nonarchimedean. §4.2 now states the real Weil representation of its
§2.4c in the Schrödinger model (`O(V)` by translation, `diag(a,a⁻¹)`, `n(b)`, Weyl element; IP23, §8.3, p. 50) and
makes proving them part of the target. §2.5 replaced by §2.4c in §4.2, Layer 4, contract, Scope.

## RT-HodgeClassesForJacquetLanglands~1b/F05 (P2) — disputed

The organisation principle allows an order the dependencies force. The Dependencies lines force 1→2→3→4→5 and
5,6→7→8→9→10; Layer 5 (IP23 §4) sits after Layer 4 (IP23 §8) because §5.4 needs §§3.4, 4.1, so the source order is
not kept where the mathematics differs. No layer is named after a source chapter: each is named by its mathematics
(the Hermitian exterior construction, harmonic Schwartz forms, …). The groupings the review contests are mathematical:
§§0.2–0.3 are in Layer 0 because the end theorems' statements (`V_i`, §0.5) need them; §8.6 (Hodge types of
coefficient cohomology) is in the Hodge-type layer; §§9.3–9.4 are the Galois inputs of §9.5; §9.1 defines the
representation of §9.2. The review's own regrouping changes no statement and no dependency. The extra sources it asks
for are not missing citations: the Vogan–Zuckerman input is consumed through AutomorphicFormsOnReductiveGroups §5.4,
which cites it, and every result attributed to IP23 is IP23's. A regrouping would also put the README out of step with
the stage ids of `design/plan.json`'s nodes, which this round may not edit. The single-article scope is in both
reviews' sections for human reviewers.

## RT-HodgeClassesForJacquetLanglands~1b/F06 (P3) — applied

Verified ComplexComparisonPartII §C6.3 (`artinComparison`, finite `Λ`) and §C6.6 (`adicArtinComparison`). Contract
now names both; §0.2 says "Artin's rational comparison … (ComplexComparisonPartII §C6.6)"; Scope, §0.2 *Needs:* and
Layer 0 Dependencies cite §C6.6 instead of "C6".

## RT-HodgeClassesForJacquetLanglands~1b/F07 (P3) — applied differently

(a) The proposed new gap is not needed: PadicHodgeTheory §3.6 gives, for `E`-valued characters agreeing with
`∏τ^{−h_τ}` on an open subgroup of units, potential crystallinity; with §3.3 (finite extensions detect de Rham) and
§3.1 (direct summand) the special-point stalk is de Rham. §0.2 now routes through these. (b) §8.1 replaced by
ClassicalAdicEtaleCohomology §8.2 (Huber's comparison, torsion levels, limit).

## RT-HodgeClassesForJacquetLanglands~1b/F09 (P3) — applied

Verified AutomorphicFormsOnReductiveGroups §2.6 has rays, raising/lowering, classification, no tensor-product statement.
§7.9 Check replaced: the lowering operator is a derivation, so a product of vectors it kills (weights `k_v`, `1`) is
killed and has weight `k_v + 1`; by §2.6 it generates the holomorphic discrete series (raising operator outside `Σ`);
negative control with weights `k_v`, `−1`.

## RT-HodgeClassesForJacquetLanglands~1b/F10 (P3) — applied

Verified MotivesAndAlgebraicCycles §2.3 is constant-coefficient Weil cohomology. §0.7 now defines `p₂,*` as the transpose
of `p₂^*` under the Poincaré duality with coefficients of §0.2 and the coefficient pairing `𝕍₁ ⊗ 𝕍₁^∨ → L`, with §2.3
as the constant-coefficient case; §0.2 added to §0.7 *Needs:*.

## RT-HodgeClassesForJacquetLanglands~1b/F11 (P3) — applied

Title → "# Roadmap: Hodge classes for the Jacquet–Langlands correspondence", matching `Suggested.lean` and the
capitalised proper names of roadmaps on main.

## Checks run

- `lake env lean packages/HodgeClassesForJacquetLanglands/Suggested.lean` (from the content checkout): exit 0; three
  `declaration uses 'sorry'` warnings (lines 70, 81, 95), no errors. The file is unchanged.
- `#check @name` for all four declarations in one scratch file, elaborated once: the four types are identical to the
  worker's signature listing (`IsExteriorStar` with `2 + 2 = finrank E U`; `existsUnique_isExteriorStar`, `comp_self`,
  `map_similitude` each carrying `[FiniteDimensional E U]`, Hermitian hypothesis and similitude hypothesis in their own
  signatures); they agree with README §§1.3, 1.4, 1.7. No change.
- Dependency check (command of the brief), output:

```
depcheck: 241 roadmaps, 2271 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. New suppliers named: ClassicalAdicEtaleCohomology (earlier in the merge order);
  the other new sections belong to suppliers already named.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `design/plan.json`: only `gaps` changed (checked by comparing the file without `gaps` before and after); 9 slugs,
  each with the same slug in a "What … must provide (gap:…)" line of the README.
- No gate failures were listed for this round. No source was fetched; `needs-references.toml` was not needed.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.4 route, `[B₁]+[B₂] = [B]` | `F` real quadratic, `Ram(B₁) = {∞₂, 𝔭}`, `Ram(B₂) = {∞₂, 𝔮}`; `F = ℚ`, `{∞,2}`, `{∞,3}`; `B₁ ≅ B₂` | invariants at `∞₂`: `1/2+1/2 = 0`; at `𝔭`, `𝔮`: `1/2`; `S = {𝔭,𝔮}`, `|S| = 2`, `S_∞ = ∅`, realizable; over `ℚ`: `S = {2,3}`, split at `∞` (matches §6.2 Check); `B₁ ≅ B₂`: `S = ∅`, class `0`, no division claimed | holds; `|S|` odd impossible since `|Ram_f(B₁)| ≡ |Ram_f(B₂)|` mod 2 |
| gap:quaternion-ramification-classification (embedding) | `B = M₂(ℚ)`; `B` ramified at `{∞,2}` with `E = ℚ(√2)`, `E = ℚ(i)` | `M₂`: no ramified place, every `E` embeds; `ℚ(√2)`: `∞` splits, no embedding (definite algebra has no real subfield); `ℚ(i)`: `∞` and `2` nonsplit, embeds (`(−1,−1)_ℚ ∋ i`) | correct both ways |
| gap:unitary-stable-range | `E_v = ℂ/ℝ` (`U(1) × U(1,1)`); `E_v = F_v × F_v` (`GL₁ × GL₂`); `W_v` anisotropic, `χ_v = 1` | split `E_v`: `χ`-equivariant Tate functional on `S(F_v²)` nonzero for every `χ`; field `E_v`: `χ`-equivariant Schwartz functions on `E_v` supported off `0` exist; anisotropic `W_v`, `χ_v = 1`: `r⁺ = 0`, `r⁻ = 2`, lift vanishes | "split" is necessary; statement true as restricted |
| gap:quaternionic-shimizu-lift, domain of `s̃_v` | `F = ℚ`, `E = ℚ(i)`, multiplier `3` at the place `3` | `3` is no norm from `ℚ₃(i)`, so the equal-multiplier group is larger than §3.24's norm-image group (README §7.4 Check) | domain stated as equal-multiplier pairs, as IP23 line 5072 |
| §0.2 effective-quotient descent | `T = Res_{ℚ(√2)/ℚ}𝔾_m`, `K(3)`, `ρ = N`, `ρ = σ₁` | `Γ = ⟨−ε⁴⟩` infinite, `Γ̄ = 1`; `N(−ε⁴) = (−1)⁴ = 1`; `σ₁(−ε⁴) = −(17+12√2) ≠ 1`, and `σ₁` is nontrivial on `Z_s = T¹`, so excluded by the factoring hypothesis | consistent with the existing Checks `(dim H⁰, dim H¹) = (1, 0)` |
| §0.2 de Rham at a special point | trivial `ρ`; Lubin–Tate type character of unramified quadratic `K/ℚ_ℓ` | trivial: unramified, crystalline; Lubin–Tate: §3.3's `ℚ_ℓ`-valued criterion does not apply (its own Check: Lie dimension two), §3.6 with all units gives crystalline | §3.6 is the needed citation |
| §0.2 Huber comparison | identity map; point | supplier's Check: identity comparison for `f = id`; torsion levels `ℤ/ℓⁿ`, finite groups, limit exact | as stated |
| §0.7 `p₂,*` | `d = 0`; `B₁ = B₂`, diagonal `ξ` | `d = 0`: finite sets, `p₂,*` sums over fibres; degrees `2d + d − 2d = d`; diagonal gives `x ↦ x` (Check) | as stated |
| §4.2 real Weil formulas | `diag(−1,−1) = w²`; additivity in `b`, multiplicativity in `a` | `ω(w)²φ(x) = i^{q−p}φ(−x) = (−1)^{(q−p)/2}φ(−x)`, `ω(diag(−1,−1))φ(x) = (−1)^{m/2}φ(−x)`, ratio `(−1)^{−p} = 1` for even `p`; `e^{πib⟨x,x⟩}e^{πib′⟨x,x⟩} = e^{πi(b+b′)⟨x,x⟩}`; `a^{m/2}a′^{m/2} = (aa′)^{m/2}`; derivatives `πi⟨x,x⟩` and `m/2 + Σx_i∂_i` preserve polynomial×Gaussian | consistent (IP23 §8.3, p. 50) |
| §6.1 route | ramified place, `χ_v ≠ 1` | conservation `r⁺ + r⁻ = 2`, `r⁺ = 1`, so `r⁻ = 1` (IP23 line 2442); §3.16 covers unitary towers (`d = 2`) | as stated |
| §7.9 Check | `k_v = 2` at `Σ`; `k_v = 4` outside `Σ`; weights `k_v`, `−1` | `2 + 1 = 3 = k_v + 1`; `−4 − 1 = −5`; `Y(fg) = (Yf)g + f(Yg) = 0`; for `k_v`, `−1`: `Y(fg) = f·Yg ≠ 0` in general | Check discriminates |
| §7.10 Check | `n = 2`, `d = 1`, `k_{∞₂} = 2` and `4` | `2² = 4` sign vectors; `k = 2`: weights `±0`, two vectors proportional, four pairings two up to scalars; `k = 4`: weights `±2`, four distinct | agrees with statement and Example |
| §9.4 subquotients | `0 → ℚ_ℓ^m → W → ℚ_ℓ → 0`, `W` de Rham | pushout along a coordinate is a quotient of `W`, de Rham by §3.1 for `B_dR` | as stated |
| Dependencies lines | all eleven layers, script over `*Needs:*` | missing items found and added in Layers 0, 6, 7, 8, 9, 10; Layers 1–5 already complete | fixed |

## Ownership

Checked by object with `roadmaps grep` over main and the open heads: no roadmap states a stable-range nonvanishing for
unitary dual pairs (only MetaplecticAutomorphicForms §3.9, orthogonal–symplectic), the generator formulas of the real
Weil representation, the Periods-I splitting, or descent of coefficient systems along an infinite central kernel
(AutomorphicBundles §0.2 leaves it to the effective-quotient argument now stated in §0.2). The first and third are asked
of MetaplecticAutomorphicForms as gaps; the second and fourth are part of targets here (§4.2, §0.2). No declaration of
`Suggested.lean` changed or shares a fully qualified name with another roadmap.

## For the maintainer

- MetaplecticAutomorphicForms receives two requests: gap:quaternionic-shimizu-lift now includes constructing the
  Periods-I splitting its §3.32a presupposes, and the new gap:unitary-stable-range (section §3.9).
- The requests to ClassFieldTheory (gap:quaternion-ramification-classification, slug kept) and PadicHodgeTheory
  (gap:derham-local-system-cohomology) are narrower. The embedding criterion left in the first gap could also be
  derived from the central-simple-algebra embedding criterion inside EndoscopicTransferAndUnitaryTraceComparison §8.3
  together with ClassFieldTheory Layers 6 and 10; it is kept as a gap, as both reviews proposed.
- New supplier: ClassicalAdicEtaleCohomology §8.2. PadicHodgeTheory §8.1 is no longer consumed; §§3.1 and 3.6 are.
- No section, layer or target id of this roadmap changed; no name other roadmaps cite changed.
