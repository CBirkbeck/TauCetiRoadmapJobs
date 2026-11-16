# FIX-PKG-IgusaVarietiesAndTorsionConcentrationPartII~9

Findings of REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~8: two findings, both P3. Both are correct. F02 is applied as asked, plus the same repair at one more place. F01 is applied with two additions, and one sentence of the suggested text is corrected (see F01). Only `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md` changed. `Suggested.lean`, `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged, and no source was fetched.

## F01 (P3) — applied differently

**Verified.** The gap contract gives `WD(r|_{G_w})^{F-ss} ≅ ι_ℓ⁻¹ rec(Π⁰_w|det|^{(1−n)/2})`. Getting from there to "`Π⁰_w` is the principal series induced from the matching characters" takes four inputs:

- the supercuspidal support of `π = Π⁰|det|^{(1−n)/2}`;
- additivity of the semisimple parameter over that support;
- irreducibility of the parameter of a supercuspidal of rank `≥ 2`;
- rank-one reciprocity.

Before this round the route named only local class field theory. §10.6 named nothing for this step.

I read the supplier sections at the head of EndoscopicTransferAndUnitaryTraceComparison:

- §10.20 states rank-one geometric reciprocity and the sum over the constituents of a normalized induction.
- §10.21 states that `σ_ss` is a bijection from supercuspidals onto irreducible `m`-dimensional Weil representations with finite inertia image.
- §10.26 states that forgetting `N` in `LLC_WD` and semisimplifying gives `σ_ss`.
- §10.30 states `LLC_WD = C_geo`, the classical correspondence.

**How the repair differs from the one suggested.**

1. §10.26 is added. §10.30 alone identifies `LLC_WD`, not `σ_ss`, with `rec`.
2. SmoothRepresentationsOfLocalGroups SR.3.1 «Cuspidal support» (on main) is added. It supplies the fact that `π` is a constituent of the induction of its supercuspidal support, which the suggested text assumed without a source.
3. The suggested text ends "`Π⁰_{𝔭_i}` is that principal series". In fact `Π⁰_{𝔭_i}|det|^{(1−n)/2}` is that principal series, so `Π⁰_{𝔭_i}` is the one induced from `ψ_a|·|^{(n−1)/2}`.

The route now also says why the cyclotomic character corresponds to `|·|`: `ε(Φ_geo) = q⁻¹ = |ϖ|`.

**Changed** (old → new):

- §9.6 route: "semisimple parameter … through local class field theory … therefore irreducible and generic" → the derivation above, citing §§10.30/10.26, SR.3.1, §10.20, §10.21, SR.5.2.
- §9.6 and §10.6 `*Needs:*`: added EndoscopicTransferAndUnitaryTraceComparison §§10.20, 10.21, 10.26, 10.30 and SmoothRepresentationsOfLocalGroups SR.3.1. §10.6 also gains SR.5.2.
- §10.6 route: now says "by the argument of §9.6 applied to `Π⁰_{𝔭_i} ≅ π_{𝔭_i}`", with the same citations.
- Supplier contracts: a new EndoscopicTransferAndUnitaryTraceComparison bullet for §§10.20, 10.21, 10.26 and 10.30, and an SR.3.1 «Cuspidal support» clause.
- Scope: the EndoscopicTransferAndUnitaryTraceComparison bullet now lists the semisimple local parameter.
- Layer 9 Dependencies: added §§10.20, 10.21, 10.26, 10.30 and SR.3.1. Layer 10 Dependencies: the same four sections, plus SR.3.1 and SR.5.2.

**Same pattern elsewhere.**

- §9.2 says a generic principal series "has Langlands parameter a sum of characters". Its argument goes through Jacquet modules (SR.2.2) and §10.32, not through `rec`, so it needs no change.
- §11.6 step 3 is purely Galois-theoretic (IgusaVarietiesAndTorsionConcentration §5.5).

## F02 (P3) — applied

**Verified.**

- §8.3(5) and its API assert that the `μ`-ordinary class is preserved. §8.9(3) asserts that `b₀` is `μ`-ordinary. The class is defined in the Conventions through BunGAndNewtonStrata §§1.25–1.26. I read both sections at its head: §1.25 gives the unique maximum and §1.26 the ordinary class as equality with `μ◇`.
- §11.6 step 2 compares the reduction of `r` with `ρ_{𝔪^∨}`. It knows the Frobenius polynomials of `r` only outside `S′_fin ∪ {ℓ}`, so it needs the density-one statement (ArithmeticGaloisRepresentations §1.8 Brauer–Nesbitt, §5.9 Chebotarev, both read at its head), not the uniqueness clause of §11.5.

**Changed** (old → new):

- §8.3 `*Needs:*`: "BunGAndNewtonStrata §§1.13, 1.23, 1.30" → "§§1.13, 1.23, 1.25, 1.26, 1.30".
- §8.9 `*Needs:*`: added BunGAndNewtonStrata §§1.25, 1.26.
- Layer 8 Dependencies: the same change as §8.3.
- §11.6 `*Needs:*`: added ArithmeticGaloisRepresentations §§1.8, 5.9.

**Same pattern elsewhere.** §11.6 step 4 uses "`d_{b′} ≤ d` with equality only for the `μ`-ordinary class". That is the maximum of §1.25 and the ordinary class of §1.26, so BunGAndNewtonStrata §§1.25, 1.26 are added to §11.6's `*Needs:*` and to the Layer 11 Dependencies.

I left §§9.6 and 10.6 alone. Their routes reach the `μ`-ordinary class through §9.5, whose `*Needs:*` already lists §§1.25, 1.26. §§8.5 and 8.8 already list their Chebotarev and Brauer–Nesbitt inputs.

## Checks

- **Elaboration.** `lake env lean packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, run from the content checkout, exits 0. The only output is `declaration uses 'sorry'` at lines 79:8 and 91:8. There are no `TauCeti.*` imports.
- **Signatures.** `Suggested.lean` is unchanged this round. I compared the worker's `#check @name` signatures of all four declarations with README §§8.7–8.8:
  - Each keeps `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`.
  - Both theorems keep their existential hypothesis.
  - Nothing changed.
- **Dependency check**, full output:

  ```text
  depcheck: 240 roadmaps, 2273 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. Both new suppliers are already suppliers of this roadmap: EndoscopicTransferAndUnitaryTraceComparison is earlier in the merge order, and SmoothRepresentationsOfLocalGroups is on main.
- **`roadmaps resolve`** on the edited README finds no unresolved cross-roadmap citation and no unknown Lean name. The previous lead `LocallySymmetric.FrankeInput` now resolves.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §9.6 route, principal-series step | `GL_2`, `q = 7`, unramified `χ_1, χ_2` with geometric Frobenius `1, 2` | `ψ_a(ϖ) = 1, 2`; ratio `2 ∉ {7, 1/7} = {|·|^{±1}(ϖ)}`, so `ψ_1 × ψ_2` is irreducible. `Π⁰` is induced from `ψ_a|·|^{1/2}`, with Satake parameters `1/√7, 2/√7`; `q^{1/2}x_j = 1, 2` reproduces `χ_a` (§9.4 API) | holds; route rewritten |
| same, negative control | trivial and Steinberg `GL_2` | `σ_ss(1|det|^{−1/2}) = σ_ss(St|det|^{−1/2})`; geometric Frobenius `1, q`; ratio `ε^{±1}`, which (ii) excludes. The semisimple parameter cannot tell 1 from St, and only the hypothesis makes the semisimplified comparison suffice | holds; none |
| same, supercuspidal exclusion | supercuspidal of `GL_2` | `σ_ss` is irreducible of dimension 2 (§10.21) and is not `χ_1 ⊕ χ_2` | §10.21 needed; cited |
| same, degenerate | `n = 1`; `n = 3` with Frobenius `{1, 2, 4}` or `{1, 7, 3}` at `q = 7` | character; ratios `{2, 4, 2, 1/2, 1/4, 1/2}` are not `7^{±1}`, so irreducible; `7/1 = 7` is linked and excluded by (ii) | holds; none |
| cyclotomic ↔ `|·|` | geometric reciprocity `ϖ ↦ Φ_geo` | `ε(Φ_geo) = q⁻¹ = |ϖ|`; on units `ε` is trivial (`ℓ ≠ p`) and so is `|·|` | holds; sentence added |
| §10.6 route | Case 1, `B` split above `p`; definite `G_ℝ`; `n = 1` | `Π⁰_{𝔭_i} ≅ π_{𝔭_i}`, so the argument transfers; no nontrivial `i`, so the statement is vacuous; a character | holds; route cites §9.6 |
| Contract bullet §10.20/§10.21 | `GL_1`; `GL_2` | `σ_ss(χ)(Φ) = χ(ϖ)`, as in the §10.18 Check; a reducible sum of two characters is not a supercuspidal parameter, as in the §10.21 Check | agrees with the supplier |
| SR.3.1 clause | `St_2` and `1` of `GL_2(ℚ_p)` | the same cuspidal support `{|·|^{1/2}, |·|^{−1/2}}`, as in the SR.3.1 Check | agrees |
| §8.3(5) `μ`-ordinary | §8.3 Check 3 | Hodge average `((−1/2, −1), (−1/2, −1))` of `((0, −1), (−1, −1))`, pairing to `1` (§1.26) | holds; Needs updated |
| §8.9(3) | central `μ` | `μ◇ = μ⁻¹`, `d_{b₀} = 0 = d`, so `b₀` is ordinary (§1.26) | holds; Needs updated |
| §11.6 step 4 | `GL_2`, `(1,1)` | ordinary `d_b = 1`, basic `d_b = 0 < 1`; equality forces `ν` equal, so the class is equal | holds; Needs updated |
| §11.6 step 2 | places of `F` above `Spl_{𝒦/ℚ}` | degree-one places of `F` lie over primes split or ramified in `𝒦`, so the density is 1; then §5.9 and §1.8 apply | holds; Needs updated |

## Ownership

- The semisimple local parameter of `GL_m` and its identification with `rec` are owned by EndoscopicTransferAndUnitaryTraceComparison (§§10.18–10.30). The classical `rec` is owned by SmoothRepresentationsOfLocalGroups SR.5.2 *classical-llc-normalization*.
- This roadmap cites both and states nothing new about them.
- No new Lean name was added.

## For the maintainer

- No name that other roadmaps cite changed, and no section was renumbered.
- The new citations of EndoscopicTransferAndUnitaryTraceComparison §§10.20, 10.21, 10.26, 10.30 and of SmoothRepresentationsOfLocalGroups SR.3.1 add no new supplier roadmap.
- No suspicious instruction was found in the review text.
