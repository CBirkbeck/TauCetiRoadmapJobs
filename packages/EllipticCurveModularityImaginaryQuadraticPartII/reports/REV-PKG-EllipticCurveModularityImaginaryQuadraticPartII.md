<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17981#issuecomment-6906382749 -->
Review (claude) of 68b6dea

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The pins do have the `L`-function of an elliptic curve over a number field

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md` lines 93–99:
   "The pins supply only the Galois side of an elliptic curve … Neither library has … `L`-functions of
   elliptic curves or of automorphic representations over number fields". The same claim is in
   `Suggested.lean` lines 22–25 ("Missing: … and the `L`-functions of elliptic curves and of automorphic
   representations over number fields").

   **Claim.** Neither pinned library defines `L(E/K, s)`.

   **Witness.** Mathlib at the pin `1b1ccf4b…`,
   `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`: line 43 `WeierstrassCurve.localPolynomial`
   (on `W.minimal R`: `1 − aT + qT²`, `1 − T`, `1 + T`, `1`), line 79 `WeierstrassCurve.LFunction` for
   `[NumberField K] (W : WeierstrassCurve K)`, line 84 `WeierstrassCurve.LSeries`. Tau Ceti at the pin
   `2fd255d9…` builds on it (`TauCeti/AlgebraicGeometry/EllipticCurve/LFunction.lean`, line 76
   `isMultiplicative_LFunction`).

   **Repair.**

   1. README, `**Lean.**` paragraph: replace "The pins supply only the Galois side of an elliptic
      curve:" by "The pins supply the elliptic-curve side:", add to the list "Mathlib's
      `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries`
      (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`), the Euler product of a Weierstrass
      curve over a number field with local factors taken on a minimal model, which is the left side of
      `L(E/K, s) = L(π_E, s − 1/2)`", and replace "`L`-functions of elliptic curves or of automorphic
      representations over number fields" by "`L`-functions of automorphic representations".
   2. `Suggested.lean` docstring, first bullet: replace "and the `L`-functions of elliptic curves and of
      automorphic representations over number fields" by "and the `L`-functions of automorphic
      representations; the left side of the `L`-function identity exists at the pins as Mathlib's
      `WeierstrassCurve.LSeries`".
   3. README, `### From Mathlib`: add a bullet for `WeierstrassCurve.localPolynomial`,
      `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries` with the file above, as the carrier of
      "the finite local factor of `E`" and of `L(E/K, s)` in Theorems 2.3, 2.4 and 8.1 (the first Check
      of §2.3 computes exactly its three bad-reduction values).

   Tested on the refuting instance: after the edit, each "lacks" clause that remains was searched at
   both pins with no hit (`WeilDeligne`, `AutomorphicRep`/`AutomorphicForm`, `HodgeTate`,
   `potentially semistable`, automorphic `L`-functions: 0 files in Mathlib, 0 in Tau Ceti).

   Effect on statability, checked: Theorems 2.5 and 8.1 still need `π_E`, `r_ι(π)`, `rec^T` and
   `L(π_E, s)`, so they stay unstatable and nothing is added to the namespace. The weaker consequence
   "`W.LSeries` continues to an entire function" is statable on these carriers (compare
   EllipticCurveModularity `Suggested.lean`, `exists_entire_completed_LSeries`, over `ℚ`), but this
   README has no such target and names no supplier for the continuation of `L(π, s)`; it appears only as
   a downstream use (line 1544). Stating it would be a substitute for a headline, so it is not asked for.

2. **F02** (P3) `*Needs:*` lines and layer Dependencies omit suppliers the text says they use

   **Location.** README line 283 (contract of AutomorphicGaloisRepresentationsPartII AG2.7): "Used by
   §§1.2, 2.1, 2.2, 5.1, 6.1, 6.2, 7.4 and 7.5." README lines 1309 and 1487: "Layer 5; …" and "Layers 1
   and 6; …".

   **Claim.** Each `*Needs:*` line and each `### Dependencies` block lists what the statements and
   routes of its section or layer use.

   **Witness.** The `*Needs:*` lines of §§2.1 (541), 2.2 (578), 6.1 (1203), 6.2 (1276), 7.4 (1430) and
   7.5 (1464) do not name AG2.7, although their statements say "decomposed generic". The Dependencies
   of Layers 2, 5, 6 and 7 do not name it (§5.1 `*Needs:*`, line 1014, does). §6.1 and §7.3 need §3.3
   (lines 1203, 1399), and Layer 3 is absent from lines 1309 and 1487.

   **Repair.** Add "AutomorphicGaloisRepresentationsPartII AG2.7" to the six `*Needs:*` lines and to the
   Dependencies of Layers 2, 5, 6 and 7; change line 1309 to begin "Layers 3 and 5;" and line 1487 to
   begin "Layers 1, 3 and 6;". Tested: with these edits every "used by" list of
   `## Exact supplier contracts` equals the set of sections whose `*Needs:*` name that supplier section
   (I checked all 21 supplier subsections; AG2.7 was the only mismatch), and every direct layer edge in
   a `*Needs:*` line appears in that layer's Dependencies. The dependency check is unaffected (AG2.7 is
   already an edge).

3. **F03** (P3) Scope paragraph imports a wider range of CrystallineLocalGlobalCompatibilityCM than is used

   **Location.** README lines 72–73: "CrystallineLocalGlobalCompatibilityCM supplies the integral
   local–global compatibility, non-neat `PGL₂` complexes, prepared patching and the solvable preparation
   (§§7.5, 8.1–8.7, 9.1–9.11)."

   **Claim.** §§8.1, 9.2 and 9.3 of that roadmap are imported.

   **Witness.** The contract (lines 264–272) and every `*Needs:*` line name only §§7.5, 8.2–8.7, 9.1 and
   9.4–9.11. §4.2 (line 925) says it "replaces … CrystallineLocalGlobalCompatibilityCM §9.3 in this
   case", and that section needs an imaginary quadratic subfield (its last Check), which `ℚ(ζ₅)` lacks.

   **Repair.** Write "(§§7.5, 8.2–8.7, 9.1, 9.4–9.11)". Tested: this is the union of the contract list
   and of the Dependencies of Layers 5 and 6 (lines 1154, 1309).

Three findings: one blocking (P2), two non-blocking (P3). The mathematics of the 27 targets
survived the adversarial pass; every source locator, supplier citation and pinned declaration
resolves. The blocking finding is a false statement about the pinned Mathlib in the `**Lean.**`
paragraph and in the module docstring of `Suggested.lean`: it does not change which headlines are
statable, but the file's stated reason is wrong as written.

No previous review of the package exists; no maintainer notes were left.

## Verified sound

### Principles

No route-specific shortcut (Theorem 6.2 is stated for an arbitrary representation, §3.3–§3.5 for
every odd `p`); the parent is imported by section and not re-planned (41 backticked parent names
resolved at its open head, all present); single direction of supply (dependency check below); no
copied passage; no algorithm; `Suggested.lean` has no declaration, no `sorry`, no `set_option`.

Dependency check, output: `depcheck: 242 roadmaps, 2278 edges, 0 problem(s)`. No UPWARD, CYCLE or
`moved:` line. The roadmap is at line 206 of the merge order, after
EllipticCurveModularityImaginaryQuadratic (205); EllipticCurveModularityTotallyReal (207),
ModularityAndLanglandsExtensions and BianchiModularForms are named only as consumers or boundaries.

### Sources: the sample and the rest

All eight texts were read at the cited lines. Sampled targets:

| Target | Locator checked | Result |
|---|---|---|
| 1.1 | MilneCM lines 273–300 (Prop. 1.4, Cor. 1.5, Rem. 1.6, p. 10); LeHung26 line 357 | present; Cor. 1.5 is the composite statement, Rem. 1.6 the commutator criterion |
| 1.2 | LeHung26 lines 318–321 | the source states genericity over `K` and irreducibility on `G_D ⊂ G_{F(ζ_ℓ)}` for `A_t[5]`; the general descent lemma and its proof are the README's own (true: see table) |
| 2.4 | OpenAI26 §9.4 at line 1192, pp. 27–28; LeHung26 lines 364–366; CaptainSude26 lines 676–683 | present |
| 2.5 | LeHung26 lines 86, 342, 357 | present; the source's theorem assumes three inputs of OpenAI26, which the parent states as targets |
| 3.2 | CaptainSude26 lines 231–241 | present |
| 3.3 | CaptainSude26 lines 177–183, 533–536 | present; the source assumes `μ₅ ⊂ F_v` and `ρ̄(φ) = 1`, the README's wider definition is checked below |
| 3.4 | CaptainSude26 lines 184–220 | present (ring `O[[a, u, z]]`, the matrix of `N`, `d² = ψ(φ)/q_v`) |
| 3.5 | CaptainSude26 lines 187–226 | present |
| 4.1 | CaptainSude26 lines 227–241 | present |
| 4.2 | CaptainSude26 lines 242–263; AKT23 line 3979 (Lemma A.5, p. 86) | present; A.5 carries the projective-field clause the README replaces |
| 5.2 | CaptainSude26 lines 285–289; CN23 line 4361 | present |
| 6.2 | CaptainSude26 lines 264–498 (`μ₅ ⊂ F` at 267); CN23 lines 3849–3872 | present; clauses (1)–(5) match |
| 7.2 | CaptainSude26 lines 520–532 | present |
| 7.4 | CaptainSude26 lines 538–603; CN23 line 4574; CHT08 Lemma 4.1.2, line 5723, p. 116 | present |
| 7.5 | CaptainSude26 lines 120–125, 604 | present |

Also checked: CN23 lines 3749, 4226–4260 (data (1)–(15), pp. 81–82), 4261, 4334–4390, 4397, 4404,
4433–4509, 4513, 4545, 4562; ACC23 lines 2309–2355 (pp. 57–58), 6357 (§6.4.1), 7163–7187 (p. 178)
and §2.2.4 (lines 1035–1176) for the torus operators used in §5.3; LeHung26 lines 86, 125, 272–355;
OpenAI26 lines 1131, 1163. No author flagged a locator as unverified. Every cited work is in
`sources.toml`; its `cited_for` lists match the README (8 of 8).

### Adversarial table

Values computed by hand; matrices over the stated field, `e = E₁₂`, `h = diag(1, −1)`, `f = E₂₁`,
`U = 1 + e`, `D = Ad(U)`, `N = D − 1` or `ρ(τ) − 1` as stated.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: `Ad(U)`, Gram matrix | basis `e, h, f` | `UhU⁻¹ = [[1,−2],[0,−1]] = h − 2e`; `UfU⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram `[[0,0,1],[0,2,0],[1,0,0]]`, det `−2` | agrees | none |
| Conventions: arithmetic Frobenius witness | `q_v = 11, 7` over `𝔽₅` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3` | agrees; scalar Frobenius possible only for `q ≡ 1` | none |
| 1.1(a) | `K = ℚ(i)`, `L = ℚ(ζ₂₀)`; `K = ℚ(√−3)`, `S = {4}`; `S = {1,2}`; non-CM `K = ℚ(2^(1/3))` | `Gal(L/K) = {1, 9, 13, 17} ⊂ (ℤ/20)ˣ`, cyclic of order 4, three intermediate fields; `ℚ(√−3, i) = ℚ(ζ₁₂)`; `L = K`; `S₃` has trivial centre | true; needs `K` CM | none |
| 1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; subfield `ℚ(√5)` not containing `K` | seven quadratic subfields `d ∈ {−1, ±3, ±5, ±15}`; roots of unity `μ₁₂`; `ℚ(√5)` totally real | true; "containing `K`" is needed | none |
| 1.2 | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)`; `K = F` | witness `q = 2`: ratio `1 ≠ 2 = 2⁻¹`; over `ℚ(ζ₃)` split primes are `≡ 1`, ratio `1 = q` | (a), (b) true; converse false as stated | none |
| Layer 1 Example `K₆₀` | `(ℤ/60)ˣ` | `a ≡ ±1 (15)`, `a ≡ 1 (4)` gives `{1, 29}`; `29 ≡ 4 (5)`, `29 ≡ 2 (3)`; degree `16/2 = 8` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` | none |
| 2.3 Checks | `q_v = 4` | split multiplicative: `(1 − T)⁻¹` against `((1 − T)(1 − 4T))⁻¹` without `N`; good, `a = 4`: `T² − 4T + 4 = (T − 2)²`, unitary roots `2/√4 = 1`; `z = i`: `diag(i, −i)` | agree with Mathlib `localPolynomial` (`1 − T`, `1`, `1 − aT + qT²`) | R01 |
| 2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | quadratic subfields of `ℚ(ζ₈)`: `ℚ(i), ℚ(√2), ℚ(√−2)`; `ℚ(ζ₈, ζ₃) = ℚ(ζ₂₄)` | sum, induction, induction | none |
| 2.5 / 8.1 | `K` imaginary quadratic; `ℚ(ζ₅)`; `K₆₀`; `ℚ(√−1, √5)` | `[ℚ(ζ₅):ℚ] = 4` cyclic, so `ζ₅ ∉` quadratic or `(ℤ/2)²` fields; `K₆₀(μ₅) = ℚ(ζ₆₀)` | branches as stated | none |
| 3.1 | `X = [[x,y],[z,−x]]`; char 2; `diag(2,3)` over `𝔽₅` | `UX − XU = [[z,−2x],[0,−z]]`; `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; char 2: `X = x·1` survives; `2/3 = 4`, `3/2 = 4`; `N²f = −2e`, `N³ = 0` | `H⁰ = 0` iff `2 ∈ kˣ` | none |
| 3.2 | `𝔽₅`, `𝔽₇`, `𝔽₃`; order-three subgroup | norm `Σ_{i<p} Dⁱ = p + C(p,2)N + C(p,3)N²`: `5 + 10N + 10N² = 0`; `7 + 21N + 35N² = 0`; `3 + 3N + N² = N²`, `ker N² = ke ⊕ kh = im N`; `[[0,−1],[1,−1]]` has det `1`, trace `−1`; index `120/5 = 24` | `H¹(⟨U⟩) = k[f]` for `p = 5, 7`, `0` for `p = 3`; bijective only at 5 | none |
| 3.3 definition | Tate curve `5 ∤ v(q_E)`, `5 | v(q_E)`; `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`, `q_v = 11`; ramification index 5 | `M² = [[4,1],[4,0]] = M⁻¹`, `M³ = 1`, `Φ² = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M¹¹`; `X² + X + 1` has discriminant `2`, a non-square mod 5; `U⁵ = 1` | protected, unramified, not protected, not protected. Wrong models excluded: "inertia nontrivial" (the `M` example) and "inertia unipotent" (good reduction) | none |
| 3.3 bullets | `ρ̄(φ) = [[a,b],[0,d]]` | `ρ̄(φ)Uρ̄(φ)⁻¹ = [[1,a/d],[0,1]]`, so `a/d = q_v`; the `p`-part of `e(F'_w/F_v)` equals the index of the image of `I_w` in `ℤ_p(1)` | as stated | none |
| 3.4 (i) ⇔ (ii) | `N` with unit `(1,2)` entry; `[[ζ₅,1],[0,ζ₅⁻¹]]`; `(1 + εf)U`, `(1 + εh)U` | Cayley–Hamilton `N² = tr(N)N − det N`; `(1,2)` entry gives `tr N · b = 0`; `det(1 + N) = 1` gives `det N = −tr N`; traces `ζ₅ + ζ₅⁻¹ ≠ 2`, `2 + ε`, `2`; `(U − 1 + εhU)² = 0` | equivalence holds over every `A ∈ CNL_O` | none |
| 3.4 smoothness, relation | basis `(Ne₂, e₂)`; `q = 11`, `δ = 1` | `ρ(φ)E₁₂ = qE₁₂ρ(φ)` gives `γ = 0`, `α = qδ`; `qδ² = ψ(φ)`; `q(tr)² = q(q+1)²δ² = (1+q)²ψ(φ)`; `11·12² = 1584`; parameters `a`, `b − 1`, `z − [z̄]` | relative dimension 3; `p = 2` excluded by the square root | none |
| 3.5 (a)–(d) | `q ≡ 1`, `q ≡ 2 (5)`; `p = 3`, `q = 4` | `M^(I_v) = ke`, `φ` scales `e` by `q_v`; `dim L_v = 3 − (3 − h⁰)`; cocycles `4`, coboundaries `2`, `h¹ = 2`; `C(4,3) = 4 ≢ 0 (3)`, so the explicit basis of (d) needs `p ≥ 5`, as stated; `#H¹(M) = #H⁰(M)·#H⁰(M(1))` | (a)–(d) true; (d) correctly restricted | none |
| 4.1 | no protected place; inertia of order 2; image `SL₂(𝔽₇)` | `H¹(G × A, M) = H¹(G, M)` when `M^G = 0`; restriction to order 2 is zero in char 5 | false without `P`, as its Check says | none |
| 4.2 | `g = diag(2,3)`; `H_∅ = 0`; all of `P` framed | `Ad(g)` has eigenvalues `4, 1, 4`; `W = ke ⊕ kf`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; `κ(τστ⁻¹) ≡ τκ(σ)` mod `τ(σ − 1)M` | detection well defined and nonempty; framing `P` breaks it | none |
| 4.3 | `(d, t, r) = (2, 1, 6)`, `(2, 3, 10)`; frame `P` | `g = 0`; `dim R^loc = 14`, `g = 6`, `20 = r + 4t − d`, `22 = r + 4t`; framing adds `|P| + 3|P| = 4|P|` on both sides | deficit `d`; formula agrees with CrystallineLocalGlobalCompatibilityCM §9.3 | none |
| 5.1 condition (ii) | `[F⁺:ℚ] = 40`, degrees `(8, 8, 24)` and `(8, 8, 8, 8, 8)`; `36` | complementary sums `24 > 20`, `8 < 20`; `24 > 20`; `d_v + d_v' < d/2` with both `≥ 8` gives `d > 32`, `8 ∤ 36` | minimum 40 | none |
| 5.2, 5.4 counts | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·11 = 111 = 1 + 3t + 2d`; `g = r − 111`; `dim R_∞ = 111`, `dim S_∞ = 151` | deficit 40 = `l₀` | none |
| 5.3 | trivial and `χ_v⁻¹(a/d)` coefficients at `P`; `w = v^c` in `Q` | `P_{v,σ} = (X − 1)²` against `(X − χ_v(u))(X − χ_v(u)⁻¹)`; `[PGL₂(O):Iw] = 12`, `12·5 = 60`; `diag(1 + ε, 1 − ε)¹¹ = diag(1 + ε, 1 − ε)`, det `1` | exclusions `Q ∩ S^c = ∅` and full Iwahori level are needed | none |
| 6.1 | `p_b = 109`, `p_c = 2617`, `q = 11`; `E = ℚ(√31, √59, √71)`; `ℚ(√5, √2)` | `2617` prime (no divisor `≤ 47`), `2617 = 6·436 + 1`; `109 ≡ 2617 ≡ −1 (11)`; `−436 ≡ 4 (11)`; `−2617 ≡ −1 (109)`; residues mod 5: `1, 4, 1`; mod 11: `9, 4, 5`; all `≡ 3 (4)`; eight places of degree 2 in degree 16, `12 > 8`; Hilbert symbols `1` at every finite place and `−1` at `∞` if `−d_b ∈ ℚ₂ˣ²` | degree half of (ii) holds; 2 never splits in `E_b`; local degree above 2 divides 4 | none |
| 6.2 | `ζ₅ ∉ F`, `det ρ̄` of order 2 over `𝔽₅` and over `𝔽₂₅`; order 4 | `det(2g) = 1`; `μ² = 2`, `γ = diag(1,2)`: `det(μγ) = −1`, `(μγ)² = diag(2,3)`, group of order 240, projective image of order 120, both projective kernels of index 120; order 4: `120 < 240` | `ζ₅ ∈ F` is not implied by the failure of (4); it is a hypothesis | none |
| 6.2 image | subgroup of `SL₂(𝔽₅)` onto `PSL₂(𝔽₅)` | order 60 or 120, even, contains the unique involution `−1` | image is `SL₂(𝔽₅)` | none |
| 7.1 | three nodes under `w`; `p = 101` | `2(P₀ + rT') = c₀` has one solution in `ℤ/3`; two components and three nodes give genus 2; thickness `2 + 1 = 1 + 1 + 1 = 3`; order `606` | type `I₃`, `q_A = s³λ(s)` | none |
| 7.2 | `v(s) = 1, 5, 7` | `v(Δ_min) = 3, 15, 21` | `5 ∤ m_v` needed; `q ≥ 7` excludes 5 | none |
| 7.3 | `v(q_A) = 3, 15`; non-split | `[[1,3],[0,1]]`; trivial; Frobenius `−1·`unipotent | as stated | none |
| 7.4 | `Σ = ∅`; a place above 2 | reduces to the parent's `switch_five`; conflict with the Tate condition | hypotheses match CN23 Prop. 6.1.5 | none |
| 7.5 | generators `[[1,3],[0,1]]`, `[[1,0],[3,1]]` | they are `U³` and `(Uᵀ)³`, generating `SL₂(𝔽₅)`, order 120 | image `SL₂(𝔽₅)` when `μ₅ ⊂ K` | none |
| Declared gap | ACC23 lines 2309–2355 | setting, `N`, `I_R`, `G_{F, S∖(R^c∖R)}`, `P_v`, `P_{v,σ}` match the `needs` text | precise, minimal, same slug in `design/plan.json` and README | none |

### Pinned declarations opened

Mathlib `1b1ccf4b…`: `NumberField.IsCMField` (`CMField.lean:70`), `of_isAbelianGalois` (542),
`IsCyclotomicExtension.Rat.isCMField` (564, hypothesis `∃ n ∈ S, 2 < n`),
`IsCyclotomicExtension` (`Cyclotomic/Basic.lean:74`), `isTotallyComplex_of_algebra`
(`TotallyRealComplex.lean:229`), `Matrix.SpecialLinearGroup.toGL` (`GeneralLinearGroup/Defs.lean:369`),
`groupCohomology.map` (`Functoriality.lean`), `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`
(`FiniteCyclic.lean:114`; the complex is `A → A → A` with `ρ(g) − 1` then the norm),
`Matrix.SL2.commutator_eq_top` (`SpecialLinearGroup.lean:804`; `a ≠ 0`, `a² ≠ 1`, so `#k ≥ 4`),
`Representation.linHom`, `continuousCohomology`, `NumberField.AdeleRing`. Tau Ceti `2fd255d9…`:
`eulerCharacteristic_mixed` (`EulerCharacteristic/Theorem.lean:98`),
`tateDualityPairing_perfect_mixed` (`Duality/Perfect.lean:280`),
`WeierstrassCurve.tateModuleGaloisRepresentation` (`TateModule/Galois.lean:80`). The statement
"`CMField.lean` has no statement about composita or subfields" holds; Tau Ceti's
`NumberTheory/NumberField/ComplexConjugation/` (four files) has none either, so Theorem 1.1
duplicates nothing at the pins.

### Supplier citations resolved

Every cited section exists at the head I read: the parent (22 sections, 41 names), 
CrystallineLocalGlobalCompatibilityCM (15 sections), AutomorphicGaloisRepresentationsPartII (AG2.0,
AG2.5, AG2.7 with its three names), PotentialAutomorphyInfrastructure (§§2.1, 2.3, 2.5 with their
names), MordellLawrenceVenkatesh §§1.3–1.4, ArithmeticGaloisRepresentations §§2.1, 4.3, 6.3, 7.2,
7.7, 7.9 (`ResidualImage.adZeroRep` is declared in its `Suggested.lean`, for any field `k`),
ArithmeticGaloisDuality R02.2, R02.4.2, LocalGaloisDeformationRings (12 sections),
GlobalGaloisDeformations (6), DeformationAndDerivedPatchingAlgebra §§8.1–8.5, GL2ModularityLifting
§1.7, PotentialModularityAndCompatibleSystems §§2.12–2.16, GL2AutomorphicRepresentationsAndTransfer
R16.3.2, R17.4.16, AutomorphicGaloisRepresentations §3.13, FaltingsFinitenessAndIsogenyTheorems
R28.6.2–R28.6.3, NeronModelsAndSemistableAbelianVarieties §§3.1, 3.12, 5.1, and on main
AbelianSchemesAndArithmeticModuli A6, EllipticCurves Layers 4–5, ClassFieldTheory Layers 5 and 11,
SchemeAndStackFoundations §§4.13, 4.18, Chebotarev Layer 10. Each is cited for a statement it makes
(read for the parent §§0.3, 5.2, 5.3, 7.2, 7.4, 8.1, 8.3; the others at the sections named). The four
leads of `scratch/citations.md` are three source ids and `ResidualImage.adZeroRep`; none is a defect.

### Duplication and overlap

No overlap fact is listed in `scratch/overlaps.md`. By object: the conjugation criterion is cited
from MordellLawrenceVenkatesh and not restated; EllipticCurveModularityTotallyReal §1.1
(`realCyclotomic_isCMField`) is the totally real base, Theorem 1.1(a) the CM base; `switch_five`
stays with the parent and §7.4 is the variant with retained places; CN23 Theorem 5.2 stays with the
parent §5.2 and CrystallineLocalGlobalCompatibilityCM §9.12, and Theorem 6.2 adds the protected
alternative. No other roadmap, open or on main, cites CaptainSude26 or states modularity over all CM
fields.

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal,
PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM,
OrdinaryAutomorphicFormsAndModularityLiftingPartII; nothing shared.

### Shape, Lean form, headlines, padding

27 targets, each with hypotheses, a locator, a `*Needs:*` line and at least three Checks (3 to 7);
three definitions (§§3.3, 5.1, 5.2) with API bullets; every layer ends with Examples and
Dependencies; no LaTeX delimiters, process words, pull-request numbers or machine paths (searched).
Layers are named by their mathematics.

`lake env lean` on `Suggested.lean`, run from the content checkout: exit 0, no message at all (no
`sorry`, since nothing is declared). Headlines listed by the README: Theorems 2.5, 6.2, 8.1; none is
statable at the pins (carriers searched, see R01) and each is named in the docstring. There is no
sorried theorem, so the one-tactic probe and the `#check @name` comparison have nothing to run on. No
backticked name in the README is presented as this roadmap's own declaration.

### Copyright and arrangement

Locators in the README body by source: CaptainSude26 26, CN23 16, ACC23 14, LeHung26 9, OpenAI26 4,
CHT08 2, MilneCM 2, AKT23 1. Contents of CaptainSude26 (§2 construction, §3 local and Galois
cohomology, §4 lifting, §5 auxiliary curve, §6 conclusion) against the layers: its §6 material is in
Layers 2 and 8, its §3 is split between Layers 3 and 4, Layer 6 states a general theorem the source
does not have and takes §6.1 from the proof of its Proposition 5.2, Layer 1 is absent from it, its §2
is imported from the parent. The order of Layers 3 to 7 is forced by the `*Needs:*` lines of §§4.1,
5.2, 5.4, 6.1, 6.2 and 7.5. No table, figure or list is taken over. A mechanical longest-common-run
pass of the whole README against the eight texts found nothing beyond titles and standard phrases.

Source independence: 28 passages (the 27 targets and the module docstring) compared with 8 sources,
none shared, longest common run outside bibliographic titles 8 words ("residue characteristic split
in an imaginary quadratic subfield"); largest share CaptainSude26, 26 of 74 locators; contents
compared with CaptainSude26: independent.

## Not verifiable

- The patching argument of §§5.3–5.4 as a whole. I checked its hypotheses against CN23 §5.6 and
  ACC23 §3.1, the torus-polynomial computation, the exclusions at `P^c` and `Q`, and every dimension
  count; the passage between Hecke algebras through nilpotent ideals rests on CaptainSude26 lines
  306–408, an unrefereed text, and cannot be confirmed by computation.
- The local geometry of §7.1(c) (the `A₁` point `z₁z₂ = s²` and the rationality of the quotient
  components) beyond the fixed-node count, the genus check and the thickness sum.

## Source issues

- **Error** in CaptainSude26 at Notation, p. 2 (lines 63–66): the source says decomposed genericity
  needs the Frobenius eigenvalue ratio outside `{1, q, q⁻¹}` and that this is CN's Definition
  2.1.27; it should be that the ratio differs from `q` only (CN23 line 1239); affects nothing.

## For the human reviewers

- **Scope.** The sources of the new results are unpublished: CaptainSude26 (pseudonymous GitHub
  manuscript; 26 of 74 locators), LeHung26 (discussion draft), OpenAI26 (preprint). I found no
  refereed source stating Theorems 6.2 or 8.1.
- **Scope.** LeHung26 Theorem 1.1 (line 86) is conditional on three inputs taken from OpenAI26; the
  README states Theorem 2.5 unconditionally, with those inputs as targets of the parent roadmap.
- **Licence.** `sources.toml` records that the CaptainSude26 repository has no licence file and
  classes it `author-page`; the README cites it by locator only and shares no wording with it.
- **Licence.** `sources.toml` classes MilneCM, fetched from the author's own site, as
  `open-repository`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "68b6dea2d3ba0026a5f7f556234405dffc52b236", "job": "REV-PKG-EllipticCurveModularityImaginaryQuadraticPartII", "model": "fable", "worker": "chris-x55"} -->
