<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6899121759 -->
Review (claude) of dd33f90

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) "Downstream consumers" names four roadmaps that do not use this one

   **Location.** Lines 1589–1591: "**RelativisticQuantumFieldTheory**: spectral types and
   Kato–Rosenblum. **SpectralManifolds**, **PositiveMass**, **RicciFlow**: the Laplacian of a complete
   noncompact manifold (3.6, 3.7, 3.9)." The same four are the `consumers` list of `design/plan.json`.

   **Claim.** These roadmaps consume Layer 1 and sections 3.6, 3.7, 3.9.

   **Witness.** All four precede this roadmap in `merge-order/ORDER.txt`; PositiveMass and RicciFlow
   are on main. `roadmaps grep` for this roadmap's name, for "Kato–Rosenblum" and for "essential
   closure" finds no other text; RelativisticQuantumFieldTheory's only wave operators are Haag–Ruelle's.

   **Exact repair.** Replace the first two bullets of `## Downstream consumers` by bullets that name
   subjects, not existing roadmaps:

   - "Roadmaps on the scattering theory of Schrödinger operators: spectral types, wave operators,
     Pearson's theorem and Kato–Rosenblum (Layer 1)."
   - "Roadmaps on the spectral geometry and heat kernels of complete noncompact manifolds: the
     self-adjoint Laplacian, its kernel, bottom of the spectrum and bounded potentials (3.6, 3.7, 3.9)."

   Drop "scattering theory of Schrödinger operators, heat kernels on complete manifolds" from the third
   bullet, which then duplicates them. In `design/plan.json` set `"consumers": []`. Tested on the
   witness: after the change no roadmap earlier in the merge order is named as a consumer, and the
   gate output is unchanged (the consumers list carries no edge).

2. **F02** (P3) the single-vector route of 1.4(1) does not cover `σ_pp`

   **Location.** Lines 580–581 and 587–591: "The same holds for `σ_sc` with the continuous singular
   part and for `σ_pp` with the atomic part … (absolute continuity gives `μ_{f_n}({λ}) = 0`, so some
   annulus is charged)".

   **Claim.** The annulus construction yields one `f` for each of the three types.

   **Witness.** `A = 5` on `ℂ`, `λ = 5 ∈ σ_pp(A)`: every `μ_f = |f|²δ₅` has `μ_f({5}) > 0` and charges
   no annulus `I_{1/m} ∖ I_{1/(m+1)}`, so the route produces no vector. The statement itself holds
   (`f = 1`).

   **Exact repair.** After "summing them with nonzero square-summable weights, using spectral
   orthogonality." add: "For `σ_sc` the same argument applies, the measures being atomless. For
   `σ_pp`: if `P_A({λ}) ≠ 0`, an eigenvector `f` has atomic part `‖f‖²δ_λ`, which charges every
   interval around `λ`; otherwise `μ_{P_pp f_n}({λ}) = 0` and the annulus argument applies." Tested:
   on `A = 5` the first case gives `f = 1`; on `diag(1/n)` with `λ = 0` (no atom at `0`) the second
   gives `f = Σ n⁻¹e_n`, whose atomic part `Σ n⁻²δ_{1/n}` charges every `(−ε, ε)`. No change to the
   statement or to the plan.

3. **F03** (P3) "Glazman's lemma" is a route input with neither statement nor locator

   **Location.** Lines 657–659: "Route: Glazman's lemma, the spectral projections `P_A((−∞, λ))`
   (finite rank below `inf σ_ess` by UO-C02) and SA-E11–SA-E13."

   **Claim.** Every input of a route is a target, a supplier section or a pinned declaration.

   **Witness.** The name occurs once in the README, nowhere in `teschl` (no match in the cached text),
   in no manifest entry and in no supplier; the *Needs:* line of 1.6 lists no source for it.

   **Exact repair.** Replace "Glazman's lemma" by its statement and owner: "the variational count (for
   self-adjoint `A` bounded below and real `λ`, `dim ran P_A((−∞, λ))` is the largest dimension of a
   subspace `L ⊆ dom A` with `⟪ψ, Aψ⟫ < λ‖ψ‖²` on `L ∖ 0`; the lower bound is teschl line 5063–5069,
   Theorem 4.12(i), and the upper bound holds because such an `L` meets `ran P_A([λ, ∞))` only in `0`,
   by SA-E11 applied to the reduced restriction of 1.3, so `P_A((−∞, λ))` is injective on `L`), known
   as Glazman's lemma". Tested on `diag(1, 3, 5)`, `λ = 4`: `span(e₁, e₂)` has form at most `3 < 4`,
   dimension `2`; every three-dimensional subspace is `ℂ³` and contains `e₃`, of form `5 ≥ 4`; and
   `dim ran P((−∞, 4)) = 2`.

Three findings, all P3; no P1 or P2. Each carries a repair, so the verdict asks for changes: a fix
round applies the three repairs. The two declared supplier gaps `gap:weyl-criterion` and
`gap:spectral-integral-resolvent` are precise, minimal and declared in both files; they are
contracts, not findings. The three findings of round 9 are repaired. The last repair
report marked nothing "not actionable", so nothing is re-raised. This review changed no file of the
design. Line numbers refer to `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`
unless another file is named.

## Previous findings, checked first

| Round 9 finding | Status | Repaired passage and what was verified |
|---|---|---|
| F01 (P3): 1.7 applies 1.3 without its hypothesis; UO-B03 not cited | repaired | Lines 699–705: "hence with every `e^{−isH₁}` (UnboundedOperators UO-B03, (i)⇒(iii) …) … hence with every `P_{H₂}(B)` by UO-B03, (iii)⇒(i), applied to `H₂` and `Q`, whose group is `e^{itQ} = 1 + (e^{it} − 1)Q`. This is 1.3's hypothesis". *Needs:* at line 713 lists UO-B03; contract lines 324–328; scope lines 72–74; Layer 1 Dependencies line 866; plan targets 1.7b and 1.9a and the supplier's `sections`. UO-B03 read on main (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` line 408–410): (i) commuting spectral projections, (ii) commuting resolvents, (iii) commuting groups, for self-adjoint `A`, `B`. |
| F02 (P3): plan 1.8b and 4.3b omit prerequisites | repaired | `design/plan.json`: 1.8b now has `target:1.2` and `SA-E26`; 4.3b has `target:4.2`; 1.1 carries the ranges `SA-B44-SA-B45`, `SA-C25-SA-C28`. All 44 targets: no dangling `target:` prerequisite. |
| F03 (P3): `grigoryan09` chapter for Green's formula | repaired | Line 986: "grigoryan09 Ch. 3"; line 1653: "`grigoryan09` (Ch. 3, 4, 11)"; manifest `locator` now "Ch. 3 (… Green formula), Ch. 4 (§§4.1–4.2 …), Ch. 11 (§§11.2–11.3 …)", `status` still `uncertified`. Line 1064 keeps Ch. 4, lines 1087 and 1117 keep Ch. 11. |

Adversarial pass on the changed passages, and the repaired pattern elsewhere. The new route of 1.7,
the new clause of 1.9 and the Hardy-space sentence are in the table below. Every other passage from
a group to its spectral projections or back was searched: the second item of 1.7 (`D_±` reduces
`H₁`, `Ω_±(D_±)` reduces `H₂`) is teschl Theorem 12.2 and its *Needs:* line now carries UO-B03;
1.4, 1.5, 1.6, 1.8 use projections commuting with every `P_A(B)` directly (UO-C03); no other place
passes between the two. The plan was compared with every *Needs:* line again: no gap.

## Verified sound

**Scope of this round.** The three repairs; the fifteen seeded targets (1.1–1.8, 3.1, 3.3, 3.5, 3.7,
3.8, 4.1, 4.2) in full, with their locators read where a text is available; every other section
read in full and recomputed where the table says so; the contracts; both gaps; the six maintainer
notes; the plan (44 targets: 26 theorems, 17 definitions, 1 example; every definition has API
entries and at least three tests; every target a locator); the manifest (21 entries, each key cited
in the README, no cited key missing).

**Principles.** No route-specific shortcut (arbitrary `ℋ`, separability only in 1.4(4); every
`d ≥ 1`; disconnected, zero-dimensional and empty manifolds). Existing roadmaps are consumed, not
planned again (UO-C03's subspaces, QuantumFoundations §8.2's `H₀`, R5c's closed-manifold theory).
One direction of supply (gate below). No copied passage, no algorithm. A design has no
`Suggested.lean`, so no sorry'd data and no `set_option`. Layers are named by their mathematics; the
README nowhere says it follows a source. A search of the README for TeX delimiters, pull-request
numbers, machine paths, HTML anchors, "round", "optional", "deferred", "removed", "current",
"so far" and `lemma` found only the two names "Rosenblum's lemma" and "Glazman's lemma" (R03).

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 bounded calculus | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{{2}}` | `μ_f = δ₁ + δ₂`; `g(A)f = (0,3i)`, measure `9δ₂`; `|g|` instead of `|g|²` gives `3δ₂` | correct | none |
| 1.1 spectral orthogonality | `A = 0` on `ℂ²`, `f = h = e₁` | `μ_{f+h} = 4δ₀`, `μ_f + μ_h = 2δ₀`, cross term `2Re⟪f, h⟫ = 2` | hypothesis needed | none |
| 1.1 bare PVM | `1_B(2)Q + 1_B(5)(1 − Q)`; `1_B(2)Q` | `diag((i−2)⁻¹, (i−5)⁻¹)·(i − diag(2,5)) = 1`; value `Q ≠ 1` at `ℝ` | correct | none |
| 1.2 four identities | `M_x ⊕ 1/2`, `f = (1, 1)`; `√2·1_{[0,1]}`; Cantor | `Leb|[0,1] + δ_{1/2}`, atoms of `μ_f` = `{1/2}` = atoms of `μ_{P_pp f}`; `2Leb` against reversed `4Leb`; `μ_{P_pp f} = 0` | correct | none |
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `{1,3}`; `∅`; `σ(A)` | correct | none |
| 1.4(1) for `σ_ac` | annuli, `λ ∈ σ_ac` | `μ_{P_ac f_n}({λ}) = 0`, so some `J_m`, `m ≥ n`, charged; the sum has ac part charging every `I_ε` | correct | none |
| 1.4(1) for `σ_pp` | `A = 5` on `ℂ`; `diag(1/n)`, `λ = 0` | no annulus charged, `f = 1` works; `Σ n⁻²δ_{1/n}` charges `(−ε, ε)` | statement true, route incomplete | R02 |
| 1.4(3) | `μ_f ≪ μ_ψ` ⇒ ac parts | `N` null for `μ_{ψ,ac}`: `μ_ψ(N ∖ Z) = 0` with `Z` a Lebesgue-null carrier of the singular part, so `μ_{f,ac}(N) = 0` | correct | none |
| 1.4 Checks | `(0,1)^ess`; `ℚ^ess`; `A = 0` on `ℂ²` | `[0,1]`; `∅`; `μ_f = ‖f‖²δ₀` for every `f`, all maximal | correct | none |
| 1.5 three items | `M_x` on `L²([0,1] ∪ [2,3])`; fat Cantor; `a = b` | `J ⊆ (0,1)` has mass `Leb(J) > 0`; `(1,2)` mass `0`; `K^ess` has empty interior; `{a} ⊄ ∅` for `A = 0` | both directions correct | none |
| 1.6 values, counting | `diag(1,3,5)`; `M_x` on `L²[0,1]`; `−1 ⊕ H₀`; `ℋ = 0` | `1, 3, 5, +∞`; `0, 0, …`; `−1, 0, 0, …`; `#{μ_n < 4} = 2 = dim ran P((−∞,4))`; `μ₁ = inf ∅ = +∞` | correct | none |
| 1.6 cores, form order, indices | finite obstacles on a core; Neumann/Dirichlet; Mathlib order | kernel of a graph-continuous map to `ℂ^{n−1}` meets a core densely; `(n−1)²π² ≤ n²π²`; Mathlib index `d − 1 − n`: `2 ↦ 1`, `0 ↦ 5` | correct | none |
| 1.6 route | `diag(1,3,5)`, `λ = 4` | largest subspace with form `< 4` has dimension `2` | input unnamed | R03 |
| 1.7 new route | `H₂ = M_x ⊕ 7`, `W = L² ⊕ 0`; `H₁ = 0` on `ℂ` | `Q = 1 ⊕ 0` commutes with `e^{−isx} ⊕ e^{−7is}` and with `1_B(x) ⊕ 1_B(7)`; `W = 0` | correct | none |
| 1.7 group of a projection | `Q² = Q` | `Σ (it)ⁿQ/n! + 1 − Q = 1 + (e^{it} − 1)Q`; at `t = π`: `1 − 2Q`; `P_Q({1}) = Q` | correct | none |
| 1.7 Hardy sentence | `e^{iax}` on functions with transform supported in `[0, ∞)` | support moves to `[a, ∞)`: inside for `a ≥ 0` (that is `s = −a ≤ 0`), outside for `a < 0` | correct | none |
| 1.7 chain rule, Checks | `H₂ = H₁ + c` | `e^{itc}` has no limit for `c ≠ 0`; difference has norm `‖e^{itH₂}e^{−itH₁}ψ − Ωψ‖` | correct | none |
| 1.8 definition laws | `|λ|^{−1/4}1_{[−1,1]}`; `m = −1, 0, 1`; `H = 0` on `ℂ` | `{h ≤ m²} = {|λ| ≥ m⁻⁴}`, tail `2·2·m⁻² = 4/m²`; `1 ≤ m²` fails only at `m = 0`; `∫ 1 dt = ∞ > 0` | correct | none |
| 1.8 Rosenblum bound | `M_λ`, `x = m·1_{[0,1]}`, `C = ⟨φ,·⟩φ` | `∫|∫ conj(φ)x e^{−itλ}dλ|²dt = 2π∫|φx|² = 2πm²`, equal to `2πm²‖C‖²_HS` | sharp constant | none |
| 1.8 square root | `diag((−1)^{n+1}/n²)` | `|V|^{1/2} = diag(1/n)`, energy `Σ n⁻² = π²/6` = sum of singular values of `V` | correct | none |
| 1.9 Pearson intertwining | `W(t) = e^{itH₂}Je^{−itH₁}` | `e^{isH₂}W(t) = e^{i(t+s)H₂}Je^{−i(t+s)H₁}e^{isH₁} = W(t+s)e^{isH₁}`; then `e^{isH₁}P_ac = P_ac e^{isH₁}` | correct | none |
| 1.9 Kato–Rosenblum Checks | `V = 0`, `diag(1,2)`; `diag(1/n²)`, `V = −diag(1/n²)` | `W_± = 0`, `Ω_± = 1`; `H₂ = 0`, `e^{−it/n²}c_n` has no limit | correct | none |
| 2.3 bound | `sup_{λ ≥ γ} |λ|/(λ − μ)`; `A = 2`, `V = 1`, `μ = 0` | `max(1, |γ|/d)`; `a/d + b·max(1, |γ|/d) < 1` in both cases once `d > max(a/(1−b), a + b|γ|)`; `(1 + 1/2)·2 = 3` | correct | none |
| 3.1 Green pairing | `v = a + ib`, `u = c + id`; circle | `(a − ib)(Δc + iΔd) = aΔc + bΔd + i(aΔd − bΔc)`; `2πn²` both sides, unconjugated `0` | correct | none |
| 3.3 `Δ₀† = Δ_max` | conjugation | `∫ conj(u)Δφ = ∫ conj(w)φ` for all `φ` iff `∫ u Δφ̄ = ∫ w φ̄`, the distributional identity, `Δ` being real | correct | none |
| 3.3 Checks | `e^{−|x|}`; `χ/|x|` on `ℝ³`; `eˣ` on `(0,1)` | `u″ = u − 2δ₀`, so `Δu = −u + 2δ₀`; `−Σ∂ⱼ²(1/|x|) = 4πδ₀`; `−(eˣ)″ + eˣ = 0` | correct | none |
| 3.5 cutoffs | step `φ`; clamp; `(0,1)` | clamp `= 1` ⇒ `g ≥ 7/8` ⇒ `φ = 1`; clamp `= 0` ⇒ `g ≤ 1/8` ⇒ `φ = 0`; `|grad| ≤ 2·(1/k + 1/k) = 4/k`; `1 ≤ (4/k)(1/2)` fails for `k > 2`; average slope `(1)/(3/4) = 4/3 < 2` | correct | none |
| 3.7 `λ₁⁺ = λ₁` | connected, finite volume, `0` isolated; point; `ℝ`; `ℝ²/ℤ²` | `0` simple isolated ⇒ `0 ∉ σ_ess`, `μ₂ = inf(σ ∖ {0})`; `+∞ = +∞`; `0 = 0`; `4π²` for `k = (±1,0), (0,±1)` | correct | none |
| 3.8 `κ`, eigenspace identity | `conj(u)v`; circle `μ = 1`; `N` points; `∅` | real part `⟪Re u, Re v⟫ + ⟪Im u, Im v⟫`, imaginary `⟪Re u, Im v⟫ − ⟪Im u, Re v⟫`, the pinned formula; dimensions `2` and `2`; `0` for `k < N`, then `+∞`; all `+∞` | correct | none |
| 3.9 route | `T = (B − is)⁻¹`; one point | `T − T* = T[(B + is) − (B − is)]T* = 2is·TT*`; `T = i`, `ν = i`, `i + i⁻¹ = 0` | correct | none |
| 3.10 sequence | `r = log y`, `u_n`, `v_j` | measure `w e^{−r}dr`; `−(∂_r² − ∂_r)(e^{r/2}f) = e^{r/2}(f/4 − f″)`; `‖u_n‖² = wn‖ψ‖²`; residual `−y^{1/2+it}(2itψ′/n + ψ″/n²)`; `3·2^j < 2^{j+2}` | correct | none |
| 3.10 Examples | `Γ(2)`; `Γ₀(2)` | `6·π/3 = 2π`; determinant `−1 + 2 = 1`, trace `0`, `2z² − 2z + 1 = 0`, `z = (1 + i)/2` | correct | none |
| 4.1 norms, Checks | `(1 + |ξ|²)û`; `e^{−πx²}`; `1_{[−1,1]}` | `N ≤ ‖u‖ + (4π²)⁻¹‖Δu‖`; `‖u‖ + ‖Δu‖ ≤ (1 + 4π²)N`; `‖u″‖² = (3π² − 4π² + 4π²)/√2 = 3π²/√2`, `‖ξ²û‖² = 3/(16π²√2)`, ratio `16π⁴`; `sin(2πξ)/(πξ)` | correct | none |
| 4.2 density, form | `e^{−πx²}`, `d = 1` | two branches of `ξ = ±√λ/(2π)`: `2·e^{−λ/(2π)}/(4π√λ)`; mass `(2π)⁻¹Γ(1/2)(2π)^{1/2} = 2^{−1/2}`; QuantumFoundations §8.2's formula at `n = 1` gives the same; `q(u) = 4π²·(4π)⁻¹/√2 = π/√2` | correct | none |
| 4.3 resolvent point | scalar `s ≥ 0` | `(s+1)⁻¹(1 + (1+i)/(s−i)) = (s−i)⁻¹`; identity at `λ = −1`, `μ = i`: `−(H₀+1)⁻¹ + (H₀−i)⁻¹ = (1+i)(H₀+1)⁻¹(H₀−i)⁻¹` | correct | none |
| 4.4 square well | `k = 0.739` | `k tan k ≈ 0.674 = √(1 − k²)`, `E ≈ −0.454 ∈ [−1, 0)` | correct | none |
| 4.5 reality | `V_{−n} = conj(V_n)`, `θ_{−n} = −θ_n` | `conj V = Σ V_{−n}e^{i⟨θ_{−n},x⟩} = V`; `2i cos x`; `(e^{ix} + e^{2ix})/2` | correct | none |
| Downstream consumers | four named roadmaps | all earlier in the merge order, none uses the objects | overclaim | R01 |

**Sources (the seeded sample).** Read at the text this round: teschl line 1780 (§1.2, separability),
3282–3304 (reduction, Lemma 2.24, p. 80), 3983–3992 (Theorem 3.7, p. 96), 4315–4332 ((3.79), Lemma
3.15, p. 104), 4350–4366 (maximal spectral vector, Lemma 3.16), 4388–4427 ((3.83), Lemma 3.19,
(3.85) and the unitary-invariance remark), 4945–4946 (Corollary 4.6, p. 116), 5044–5069 (Theorem
4.10, p. 119, Corollary 4.11, Theorem 4.12(i)), 2914–2917 and 2960–2966 (Theorems 2.12, 2.13),
6277–6281 (Lemma 6.17), 6358–6360, 7086–7092 ((7.22)–(7.24)), 7095–7097 (Theorem 7.8), 7137–7143
((7.26), p. 168), 7213–7228 (Lemma 7.11), 9578–9589 (Theorem 10.2), 10585–10620 ((12.3), p. 247,
Lemma 12.1, (12.6), Theorem 12.2); kato57 line 21–35 (Theorem 1, (1.1)–(1.3)) and 92–111 (Lemma
2.1, (2.7), constant `2πm²`); bms02 line 128–129, 151–157, 179–182 (Theorem 2.3); hm23 line 39–47
and 104–105. Each number and page agrees and each passage supports its statement, with the
differences the README states (arbitrary `ℋ`; (1), (2) of 1.4 and all of 1.5 deduced here; the
disconnected case of 3.6; every bounded `V`). The author flags no locator as unverified. Sections
3.1, 3.5 and 3.8 rest on uncertified texts on the source side (below). Nothing was fetched; no
`needs-references.toml` was written.

**Pinned libraries.** The manifest pins are the plan's baseline (Mathlib `1b1ccf4`, Tau Ceti
`2fd255d`). All 64 dotted backticked names of the README were located at the pins by file and line;
63 are there and `CompactFormPair.eigenvalue_eq_rayleighMinMax` is VariationalMethods 4.4's
(`TauCetiRoadmap/VariationalMethods/Suggested.lean` line 171), attributed to it at line 84. Opened:
`TauCeti.ProjValMeasure` (`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91`, fields
`diag` :96, `inner_proj` :100, `proj_univ` :103; `proj_mul_comm` :200, `norm_sq_proj_apply` :275,
`diag_univ` :299), `integral` (`ProjValMeasure/Integral.lean:218`), `LinearPMap.resolvent` and
`resolvent_sub_resolvent` (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:169,
280`), `nuclearENorm` (`TauCeti/Analysis/OperatorIdeal/Nuclear/Basic.lean:53`, equal by `rfl` to the
sum of the singular values, :58) and `isCompactOperator_of_nuclearENorm_ne_top` (:153),
`hilbertSchmidtEnergy` (`HilbertSchmidt/Basic.lean:89`),
`isCompactOperator_of_hilbertSchmidtEnergy_ne_top` (`HilbertSchmidt/Columns.lean:257`),
`IsRelativelyBounded` (`LinearPMap/RelativeBound.lean:56`), `add_of_isRelativelyBounded`
(`KatoRellich.lean:118`), `IsReducing.isSelfAdjoint_restrict` (`Reducing.lean:144`),
`integral_mul_laplaceBeltrami` and `integral_mul_divergence_of_hasCompactSupport_right`
(`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:312, 289`),
`instComplexificationInnerProductSpace` (`TauCeti/Analysis/InnerProductSpace/Complexification.lean:159`,
inner product with real part `⟪re, re⟫ + ⟪im, im⟫` and imaginary part `⟪re, im⟫ − ⟪im, re⟫`),
`eigenvalues_eq_iSup_iInf_re_inner` (`CourantFischer.lean:251`); Mathlib `MemSobolev`
(`Mathlib/Analysis/Distribution/Sobolev.lean:153`, arguments `s`, `p`, the multiplier
`(1 + ‖x‖²)^{s/2}`; it includes no weak-derivative description, which is item 2 of 4.1),
`memSobolev_iff_exists_smulLeftCLM_fourier` (:222), `MemSobolev.laplacian` (:348),
`laplacian_eq_fourierMultiplierCLM` (`FourierMultiplier.lean:107, 208`), `singularPart`, `rnDeriv`,
`singularPart_add_rnDeriv`, `eq_singularPart`, `eq_withDensity_rnDeriv`
(`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:73, 80, 122, 404, 522`), `adjoint`,
`mem_adjoint_domain_of_exists`, `adjoint_apply_of_not_dense`, `IsFormalAdjoint.le_adjoint`,
`adjoint_isClosed` (`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:151, 163, 172, 194, 332`),
`closure`, `isClosable_iff_exists_closed_extension`, `HasCore`
(`Mathlib/Topology/Algebra/Module/LinearPMap.lean:93, 132, 141`), `IsCompactOperator.comp_clm`,
`isCompactOperator_of_tendsto` (`Compact/Basic.lean:271, 459`), `fourierTransformₗᵢ`
(`Mathlib/Analysis/Fourier/LpSpace.lean:51`). `roadmaps resolve` reports that it does not check
names outside the roadmaps on this host; the names were checked by hand as listed.

**Suppliers, resolved now** (main at `1a19c9f`). UnboundedOperators: §1.1 (UO-A01), §1.2 (UO-A02:
the resolvent step is stated for `P_A`, which is what `gap:spectral-integral-resolvent` extends),
§1.3 (UO-A03), §1.6 (UO-A06), §1.7 (UO-A07), §2.3 (UO-B03), §3.1 (UO-C01), §3.2 (UO-C02: Lemma 6.17
appears as a locator and inside the Fredholm proof, not as an item), §3.3 (UO-C03: the three
subspaces on a bare `TauCeti.ProjValMeasure ℝ H`, commuting projections, domain preservation,
`σ(A_pp) = closure σ_p(A)`, the union formula; restriction self-adjointness in the finite-control
case), §4.7 (UO-D06, with the complexification), §5.4 (UO-E04: `V(A − i)⁻¹` compact with
`dom A ⊆ dom V`), §5.6 (UO-E05: the graph closure from `C_c^∞(0,1)` has domain `H₀²`), §5.7 (UO-E06:
`ℝ³` only, Coulomb left to a consumer). SelfAdjointSpectralTheory: SA-B44, SA-B85, SA-C12, SA-C19,
SA-C25, SA-C39, SA-C54, SA-C86, SA-D22, SA-E05, SA-E08, SA-E11, SA-E13, SA-E26, SA-E30, SA-E44,
SA-E47 (lines 420–1324). VariationalMethods 4.4 (lines 784–789: `rayleighMinMax`, junk value `0`,
index from `0`). RiemannianGeometry R5c (line 3715; `λ₁(Δ⁺) = μ₂(Δ⁺)` at 3893) and R7.8 item 8 (line
4437, `sup|dg| ≤ Lip(f) + ε`). ComplexKahlerGeometry K5a.ComponentwiseCompact (line 2092).
HilbertModules H6 (`(closure T)* = T*`, line 715; deficiency spaces, 752). PDE §1.2, §1.3, §6.3 (F26).
SmoothBundlesConnections B2.2 (line 605). OperatorIdeals OI-B29, OI-B35, OI-B36, OI-C14.
FuchsianOrbifolds Layer 3, ComplexCurveModuli D6, GeometricTopology §7.1. At their open heads:
QuantumFoundations §8.2 (every `n ≥ 1`, both cores, `M_(4π²|ξ|²/(2m))`, the density formula quoted
in 4.2) and §9.5; CongruenceSpectralGap §0.2 and §0.6; AutomorphicSpectralTheory §1.16a and
§§4.1–4.2; MaassForms §0.1. `roadmaps resolve`: no cross-roadmap citation and no Lean name found
nowhere. `overlaps.md`: no pull request changes this roadmap, no cited id dropped, no id defined by
an open revision only, no second copy (the roadmap is not on main).

**Declared gaps.** `gap:weyl-criterion` (UnboundedOperators UO-C02, §3.2) and
`gap:spectral-integral-resolvent` (UO-A02, §1.2). Each `needs` is one statement with its hypotheses;
each has a named supplier; each slug is in the plan's `gaps` and in the contract (lines 350–362).
Minimality: UO-C02 uses the Weyl sequence only inside a proof; UO-A02 and UO-A03 state the resolvent
step and the product law for `P_A` (the product law is "transported to SAST's `P_A`"), not for a
bare projection-valued measure. They are contracts, not findings.

**Maintainer notes** (none holds at this head).

1. Not held: lines 124–131 give UO-E06 only `L² + L^∞` on `ℝ³` and Coulomb to QuantumFoundations §9.5; lines 141–142 put `L^p` and the Kato class outside the roadmap.
2. Not held: lines 79–82 and 331–335 say UO-C03 gives restriction self-adjointness with a finite control measure, and 1.3 with SA-C19 in general.
3. Not held: every mention of Weyl's criterion carries `gap:weyl-criterion` (lines 68–69, 350–355, 1350–1353, 1399).
4. Not held: lines 1490–1498 state the passage from `(H₀ + 1)⁻¹` to `(H₀ − i)⁻¹`; recomputed in the table.
5. Not held: the last item of 1.1 (lines 467–474) rests on `gap:spectral-integral-resolvent`.
6. Not held: the contract lists SA-C86 and SA-E30 (lines 308–315), as the plan does.

The closing instruction of the notes is met at lines 127–131 and 1535–1538 (4.4 names UO-E06 as its
three-dimensional case). The ownership decisions of the notes were not reopened.

**Duplication.** `roadmaps grep` over main and the open heads, by object: Kato–Rosenblum, essential
closure, Pearson's theorem for wave operators: no other text; wave operators: only
RelativisticQuantumFieldTheory's Haag–Ruelle ones; essential self-adjointness of a Laplacian by
Gaffney cutoffs: CongruenceSpectralGap §0.2 proves it inside its route for the surfaces `Γ(N′)\ℍ`,
and lines 132–140 say that 3.6 is the statement for every complete manifold and gives the same
operator there; "Gaffney" in SobolevDifferentialForms is the Gaffney inequality for forms on a cube,
another object. No name of this roadmap occurs in another roadmap.

Overlap check: read UnboundedOperators, VariationalMethods, SelfAdjointSpectralTheory (main; its open revision drops no cited id), QuantumFoundations, CongruenceSpectralGap, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory; shared: pp/ac/sc subspaces — UnboundedOperators UO-C03; essential spectrum — UnboundedOperators UO-C02; strong commutation — UnboundedOperators UO-B03; `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; free Hamiltonian — QuantumFoundations §8.2; Courant–Fischer for compact form pairs — VariationalMethods 4.4; congruence Laplacians — CongruenceSpectralGap §0.2 and AutomorphicSpectralTheory §1.16a; each cited, none owned twice.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier in a *Needs:* line or a contract is on main or is
QuantumFoundations, which is earlier in the merge order. CongruenceSpectralGap,
AutomorphicSpectralTheory and MaassForms are named in the scope and the Examples only, and are
earlier too.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, four layers each ending with Examples and Dependencies, Downstream consumers, Worked
examples, References. Every definition has its API and at least three discriminating Checks; every
theorem its hypotheses and a locator. Layers 1 and 2 are independent of each other, and so are 3 and
4 (lines 442–448), so no source's order is imposed.

**Headline theorems.** The type projections realise the Lebesgue decomposition (1.2); the
characterisation of `σ_ac` and the interval criterion (1.4, 1.5); min–max below the essential
spectrum (1.6); Pearson and Kato–Rosenblum (1.9); essential self-adjointness on complete manifolds
(3.6); `[1/4, ∞) ⊆ σ_ess` from a cusp end (3.10); `−Δ + V` for bounded real `V` (4.4). A design has
no `Suggested.lean`: statability, padding, binders and imports are package-stage checks, and the
README attributes no backticked Lean name to this roadmap.

Source independence: 26 passages compared with 4 sources read this round (teschl 19, kato57 2, bms02 3, hm23 2), none shared beyond standard names, formulas and forced hypothesis lists; largest share teschl, 34 of 90 line or locator citations; contents compared with teschl: independent (Layer 1 draws on its §§2.5, 3.2, 3.3, 4.2–4.4 and 12.1 together with kato57 and yafaev04, Layer 2 on §§4.3 and 6.1, Layer 3 on §2.3 only, Layer 4 on Chapters 7 and 10; no run of sections maps one to one onto a run of its sections, and the layer order is forced only by "Layers 3 and 4 need Layers 1 and 2").

## Not verifiable

- Elaboration: not available (this lane does not elaborate). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`,
  `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`)
  were not read. Of the sampled targets, 3.1 and 3.5 rest on `grigoryan09` and `gaffney54` alone on
  the source side, and 3.8 on `chavel84`; their statements were checked by computation, against the
  pinned Green identities and against RiemannianGeometry R5c and R7.8.
- `yafaev04`, `rosenblum57`, `lp80` and `kps26` were not reopened this round (they are outside the
  seeded sample; round 9 read them at the cited lines).
- The published numbering of the arXiv copies of `bms02` and `hm23` was not compared with the
  journal versions.
- Whether ComplexKahlerGeometry K5a's `H²` realisation is stated for a zero-dimensional compact
  manifold was not settled; 3.8 treats dimension `0` by hand.
- Ownership against open pull requests was checked by object with `roadmaps grep` and by reading
  the roadmaps of the Overlap line; the other open heads were searched, not read.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is the ambient coefficient over the relative coefficient minus one; it should be over one minus the relative coefficient; affects a stated result.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book; 34 of 90 source citations point into it. The wording and arrangement checks found nothing shared (`packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`, entry `teschl`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dd33f900fddc8e162bb24bbd251978b383e27169", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~10", "model": "fable", "worker": "chris-x29"} -->
