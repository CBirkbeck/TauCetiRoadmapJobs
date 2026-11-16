# FIX-RT-IgusaVarietiesAndTorsionConcentrationPartII~1

Findings of red-team passes `RT-IgusaVarietiesAndTorsionConcentrationPartII~1a` (five) and `~1b` (two). `~1a/F05` and `~1b/F02` raise the same defect and are settled together below. Files changed: `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md` and `packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean` (docstrings only). `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no gap is added or changed, and every new locator is in `CS17`, whose manifest entry already covers §§5.4 and 6.3.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~1a/F01 (P2) — applied

§8.7: "for every prime `𝔭_i` above `u`" → "there is a place `u` of `𝒦` above `p` such that, for an `ι_p` compatible with `𝔭`, … at every `𝔭_i` above `u`", with why `ι_p` does not matter and `u` does. "Through (the same) `u`" added in Conventions, §§8.5(4), 8.7 API, 8.8, 11.6, 11.8, Worked examples. Witness added as §8.7 Check.

Verification. CS17 line 3679 (§5.4, p. 740) *fixes* a decomposition `p = uu^c`, and Theorem 6.3.1(2) (lines 4409–4413) puts "split as `p = uu^c`" inside the existential hypothesis. The README never fixed `u`. Witness recomputed: at `𝔭_1` the eigenvalues `{1, 2, 4}` give ordered ratios `2, 4, 2, 6, 3, 6`, none in `{1, 7}` (`p ≡ 7` mod `11`). At `𝔭_1^c` the eigenvalues `{1, 1, 1}` give ratio `1`. So the predicate took two values. Independence of `ι_p` checked: `g ∈ Aut(ℂ/E)` gives `S_i ↦ g⁻¹S_i`, and `p_{gτ} = p_τ` because `E` is the reflex field. Embeddings of `E` inducing the same `𝔭` differ by an element of `Gal(ℚ̄_p/ℚ_p)`, which preserves the induced primes.

Pattern. The signature half of the condition does not depend on `u`, since the set attached to `𝔭_i^c` is `{τc}` and `p_{τc}q_{τc} = q_τp_τ`. The §8.7 Check "two nontrivial embeddings in one `S_i`" now says so. Only genericity depends on `u`. Every route that uses the condition fixes the `u` it takes from the hypothesis (§11.6 step 1, and through it §§9.6 and 10.6).

## RT-IgusaVarietiesAndTorsionConcentrationPartII~1a/F02 (P3) — applied

§11.4: added "In Case 1 put `S′ = S ∪ {∞, p}`, so that `S′_fin = S ∪ {p}`, `𝕋^{S′_fin} = 𝕋^{S∪{p}}`, and `[H_c(I^b_Mant, ℚ̄_ℓ)]^{S′-ur}` is the `S ∪ {p}`-unramified part of IgusaVarietiesAndTorsionConcentration §1.8 (as in §11.5, step 3, …)".

Verification. Before the edit, `S′` was defined only for Case 2: in the Conventions ("trace layers of Case 2") and in §11.4. Layer 10 never introduces one. With the new definition, (3) uses the `K^{S∪{p}}`-invariants, which is hyperspecial level. In (4), `𝔪^∨ ∩ 𝕋^{S∪{p}} = 𝔪^∨` because `𝔪 ⊂ 𝕋^{S∪{p}}` already, and `π_f^{S′}` is defined. This agrees with §11.5 step 3. No other Case 1 use of `S′` exists. §11.8 uses `S′` as its own locally defined set.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~1a/F03 (P3) — applied

README §11.5: "Theorem 1.1(1) and Remark 1.2" → "Theorem 1.1, first assertion, and Remark 1.2". Worked examples, three times: "Theorem 1.1(2)" → "§11.7(2)", with the first occurrence also giving "the second assertion of [CS17] Theorem 1.1 (CS17 lines 92–95)". `Suggested.lean`: the docstring of `IsCompletelySplitStrongGenericPrime` now says "the hypothesis of the second assertion of CS17 Theorem 1.1, README §11.7(2)".

Verification. CS17 lines 89–95 are one unnumbered theorem. A search for `1.1(` in README and Lean now finds nothing.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~1a/F04 (P3) — applied

"AL.3 «Strong multiplicity one»" → "AL.3.7.2 «Strong multiplicity one for isobaric sums»" in the supplier contract, in the §9.3 route and in §9.3 *Needs*. "AL.3" → "AL.3.7.2" in the Layer 9 Dependencies.

Verification. At the supplier's head, `## Layer AL.3: Rankin–Selberg theory and function-field factors`. Its `#### AL.3.7.2 Strong multiplicity one for isobaric sums` says that equality of unramified components almost everywhere determines an isobaric sum. That is the statement used. AL.3.7.1 is the cuspidal case only. AutomorphicLFunctionsAndLocalFactors is line 95 of the merge order, earlier than this roadmap.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~1a/F05, RT-IgusaVarietiesAndTorsionConcentrationPartII~1b/F02 (P3) — applied

- §10.1 *Needs*: `6.23` deleted.
- §10.4 *Needs*: "§§6.8, 6.23, 6.25" → "§6.8"; its route says §§6.23, 6.25 are special cases, not steps, hence the gap.
- Layer 10 Dependencies: `6.23, 6.25` dropped.
- Contract: §6.23 cited only as a special case.
- Layer 10 Example: §6.23 stated precisely.

Verification. At the supplier's head:
- §6.23 assumes signature `(1, n−1)` and `(0, n)` elsewhere, `[F₀:ℚ]` even, and `D` split away from one pair of places.
- §6.25 opens with "Assume `[F^+:ℚ] ≥ 2`". Its combination with §6.18 asks for `G(𝔸_f) ≅ G_N(𝔸_f)`. For a Case 1 datum with `n ≥ 2`, `B` ramifies at some finite place of the totally complex `F`, so that condition fails. Only `n = 1` meets it.
- The §10.1 route uses only §§1.8, 1.16, 6.7, 7.10, 8.1, 8.21 and its own local-index argument. The §10.4 route uses §6.8 and the gap.

I followed `~1b`'s Dependencies repair and dropped §6.23. `~1a` suggested keeping "§6.23 (Examples only)". A Dependencies line lists what the targets need, and §6.23 stays cited in the Examples and in the contract.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~1b/F01 (P2) — applied differently

New §11.2(c), using neither SV3 nor the tower: every neat `K` has an open normal `K_N` with `(K_N)_q = K_q` for `q ∉ S` and `K_N^p` in a level-`N ≥ 3` Siegel congruence subgroup, `p ∤ N`; localized Hochschild–Serre transfers nonvanishing and lower vanishing. §§11.3–11.4 state small `K^p`; §§11.5–11.6 pass to `K_N`. Iwahori Example added.

Verification. PerfectoidShimuraVarieties §2.2, at its head, asks `K^p` to lie in a level-`N` subgroup of `GSp_{2g}(𝔸_f^p)` with `N ≥ 3` prime to `p`. Parent §§3.17, 4.4 and 4.5 assume "`K^p` sufficiently small". CS17 itself assumes `K` "sufficiently small" (line 4377). §11.7 is stated for every neat `K`, and that statement is true. So the route needed the reduction and the statement stays general.

Why differently. `~1b` proposed shrinking `K_S` at one prime of `S`. That does not reach a principal congruence subgroup when another component `K_{q₀}`, `q₀ ∈ S`, lies in no hyperspecial `GSp(Λ_{q₀})`, for example a paramodular stabilizer. The construction used here works in that case:
- `S ≠ ∅`, because a prime ramified in `𝒦` ramifies in `F` and so lies in `S`.
- Take `N ≥ 3` divisible exactly by the primes of `S`.
- Take a self-dual lattice `Λ` that is `K_q`-stable at each `q ∉ S` (IgusaVarietiesAndTorsionConcentration §0.11).
- Let `K_N` be the normal core in `K` of `K ∩ Γ(N)`. This equals `core_{K_S}(K_S ∩ Γ(N)_S) × K^S`.

The covering is Galois with group `K/K_N` by PELModuli §M6.1, which needs neat `K` and normal `K_N`. Hochschild–Serre is SchemeAndStackFoundations §2.15. The suggested additions of §M6.1 and §2.15 to the *Needs* of §§11.5–11.6 are carried by §11.2, which those lines cite.

## Checks run

- **Elaboration.** `lake env lean packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, run from the content checkout, prints two warnings ("declaration uses `sorry`", lines 80 and 92) and no errors. No `TauCeti.*` import, so nothing was built.
- **Signatures.** One scratch file with `#check @IsStrongGenericAt`, `#check @IsCompletelySplitStrongGenericPrime`, `#check @infinite_setOf_isCompletelySplitStrongGenericPrime` and `#check @infinite_setOf_isStrongGenericAt_degree_one` was elaborated once. Each elaborated type is identical to the one recorded in `scratch/signatures.md`. Every binder (`[NumberField F] [NumberField L] [IsGalois F L] [Field k] [Finite k] {n}`) is carried in each signature and matches README §§8.7–8.8. Only docstrings changed.
- **Dependency check** (the command of the brief):

      depcheck: 242 roadmaps, 2278 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README lists no cross-roadmap citation found nowhere and no Lean name found nowhere. The earlier lead `LocallySymmetric.FrankeInput` no longer appears.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §8.7 auxiliary pair, existential in `u` | `n = 1` | no `τ` with `p_τq_τ ≠ 0` through either `u`; condition reduces to `p ∈ Spl ∖ (S ∪ {ℓ})` | agrees with the existing `n = 1` Check; none |
| same | witness `ρ̄ = 1 ⊕ χ ⊕ χ²`, `ℓ = 11`, `p ≡ 7` | through `u`: `{1,2,4}`, ratios `{2,4,6,3}`, no ratio in `{1,7}`; through `u^c`: `{1,1,1}`, ratio `1` | auxiliary (through `u`); added as Check |
| same | `p` split completely, `ρ̄` generic above `p` | every `S_i` a singleton; genericity at all `𝔭_i` and `𝔭_i^c` | auxiliary through both `u`; API bullet updated |
| same | some `S_i ⊇ {τ, τ′}` both nontrivial | the set at `𝔭_i^c` is `{τc, τ′c}`, with `p_{τc}q_{τc} = q_τp_τ ≠ 0` | fails through both `u`; Check updated |
| same | two `ι_p` with the same embedding of `E`; then with different embeddings over `𝔭` | `S_i′ = g⁻¹S_i`, `g ∈ Aut(ℂ/E)`; count of nontrivial `τ` unchanged; `σ ∈ Gal(ℚ̄_p/ℚ_p)` keeps the primes | independent of `ι_p`; stated in §8.7 |
| §8.5(4) through the same `u` | `n = 2`, `q_v = 7`, `ℓ = 11`, roots `{1,2}` ↦ `{7,9}` | ratio sets `{2,6}` and `{2,6}`; `S_i` unchanged | holds; none |
| §11.4 `S′` in Case 1 | `n = 1`, `B = F = 𝒦 = ℚ(i)`; hyperspecial `K_p` | `S′_fin = S ∪ {p}`; `𝔪^∨ ∩ 𝕋^{S∪{p}} = 𝔪^∨`; `K^{S∪{p}}`-invariants keep the class | consistent with §11.5 step 3; none |
| §11.2(c) | `S = {2}` (`𝒦 = ℚ(i)`) | `N = 4 ≥ 3`, prime to every `p ∉ S` | exists; none |
| same | `K ⊂ Γ(N)` already | `K_N = K` | trivial; none |
| same | `d = 0` | lower-vanishing assertion is vacuous; nonvanishing assertion transfers `H^0` | holds; none |
| same | components outside `S` | `Γ(N)_q = GSp(Λ_q) ⊇ K_q` for `q ∉ S`; core `= core_{K_S}(…) × K^S` | `(K_N)_q = K_q`; none |
| same | localization against `H^a(K/K_N, −)` | finite free `ℤ[K/K_N]`-resolution gives `Hom = M^r`, and localization commutes | `E_2` localizes rowwise; none |
| Layer 11 Iwahori Example | `q₁ ∈ S` with pro-`q₁` Iwahori, others maximal compact; `N = 4`, `N = q₁²`, `N = 3·q₁` | `q₁ | N`: upper unipotent `≢ 0` mod `q₁`; `q^a ∥ N` with `q^a ≥ 3`, `q ≠ q₁`: `−1` or a generator of `ℤ_q^×` is `≢ 1` mod `q^a` | in no `Γ(N)`; added as Example |
| §10.4 sentence on §§6.23, 6.25 | `n = 1` Case 1 (`B = F`); `n = 2` Case 1 | `G = G_1`, so `G(𝔸_f) = G_1(𝔸_f)`; `B` ramified at a finite `w` (`F` totally complex), `(B_w)^× ≇ GL_2(F_w)` | "only when `n = 1`" holds; none |

## Ownership and other roadmaps

- **§11.2(c).** `roadmaps grep` for small-level reductions (`small(er) level`, `reduction to small`, `shrink the level`, principal congruence with Hochschild–Serre) finds only Shimura-curve, modular-curve and trace-formula level choices. None is a Hecke-localized reduction for compact unitary PEL data. This roadmap therefore owns the application. The general inputs are cited: PELModuli §M6.1 (Galois covering at neat level), SchemeAndStackFoundations §2.15 (Hochschild–Serre) and IgusaVarietiesAndTorsionConcentration §0.11 (self-dual lattices at hyperspecial level).
- **Lean names.** No Lean name changed. No other roadmap's citation of this one is affected.
- **Section numbers.** No section id changed. §11.2 gains part (c), and (a), (b) keep their labels.
- **Supplier heads read.** Suppliers were read at the heads that `roadmaps show` gives: AutomorphicLFunctionsAndLocalFactors, EndoscopicTransferAndUnitaryTraceComparison, PerfectoidShimuraVarieties, PELModuli, IgusaVarietiesAndTorsionConcentration. Ownership against open pull requests was checked through `roadmaps grep` at the indexed heads only.

## For the maintainer

- The auxiliary-pair condition is now existential in the place `u` of `𝒦`, as in CS17 Theorem 6.3.1(2). No Lean declaration encodes it: the module docstring names it as not statable, and now also names `u` among its missing data.
- No text in the reviews, supplier READMEs or sources asked for an action outside this job.
