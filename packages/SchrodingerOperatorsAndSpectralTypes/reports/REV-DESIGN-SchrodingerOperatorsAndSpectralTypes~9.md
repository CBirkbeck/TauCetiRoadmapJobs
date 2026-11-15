<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6898254280 -->
Review (claude) of 976b255

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) the new route of 1.7 applies 1.3 without its hypothesis; the bridge is UnboundedOperators UO-B03, which is not cited

   **Location.** Lines 693–700: "`W := Ω_±(ℋ_ac(H₁))` is a closed subspace invariant under every
   `e^{−isH₂}` and reduces `H₂` … 1.3 identifies the two sides … *Needs:* 1.1, 1.3;
   SelfAdjointSpectralTheory SA-E26–SA-E30; UnboundedOperators UO-C03."

   **Claim.** The listed inputs give 1.3's hypothesis for `W`.

   **Witness.** 1.3 (line 528) needs `Q` to commute "with every `P_A(B)`"; the route gives group
   invariance only. SA-E30 covers `P_A(B)` alone. The bridge is UnboundedOperators §2.3 (UO-B03), main
   line 410, (iii)⇔(i).

   **Exact repair.**
   - Line 694, after "and reduces `H₂`": add "its projection commutes with the group `e^{−isH₂}`
     (`W^⊥` is invariant too, the group being unitary), hence with every `P_{H₂}(B)` by
     UnboundedOperators UO-B03 applied to `H₂` and the bounded self-adjoint projection, which is 1.3's
     hypothesis".
   - Line 700: "*Needs:* 1.1, 1.3; SelfAdjointSpectralTheory SA-E26–SA-E30; UnboundedOperators UO-B03,
     UO-C03."
   - Contract (line 320 onward): add "UO-B03 (strong commutation: a bounded self-adjoint operator
     commutes with the group `e^{isA}` iff it commutes with every `P_A(B)`; used in 1.7)". Scope list
     (line 66 onward): name UO-B03. Line 852: "UnboundedOperators Layers 1, 3, §2.3 and §4.7".
   - `design/plan.json`: target 1.7b, add `"roadmap:OperatorTheory UnboundedOperators UO-B03"` to
     `prerequisites`; supplier `OperatorTheory/UnboundedOperators`, add `"UO-B03"` to `sections`.

   Tested on the instance of the repair report: `H₂ = M_x ⊕ 7` on `L²(ℝ) ⊕ ℂ`, `W = L²(ℝ) ⊕ 0`.
   `e^{itQ} = 1 + (e^{it} − 1)Q` commutes with `e^{−isH₂} = e^{−isx} ⊕ e^{−7is}`, so UO-B03 gives
   commutation with `P_{H₂}(B) = 1_B(x) ⊕ 1_B(7)`, and 1.3 then applies. UO-B03 is on main, earlier
   than this roadmap, so the edge is downward. The second item of 1.7 (`D_±` reduces `H₁`) needs no
   change: domain preservation follows from SA-E29 by differentiating the group.

2. **F02** (P3) two plan targets omit prerequisites that their *Needs:* lines list

   **Location.** `design/plan.json`, targets 1.8b and 4.3b; README lines 741–744 ("*Needs:* 1.1, 1.2;
   SelfAdjointSpectralTheory SA-C86, SA-E26; …") and 1484–1485 ("*Needs:* 4.2; QuantumFoundations
   §8.2; …").

   **Claim.** The plan's prerequisites are those of the README.

   **Witness.** Plan 1.8b lists `target:1.8a`, three Tau Ceti names, SA-C86 and OI-B29–OI-B36: no
   `target:1.2` and no SA-E26, although its statement contains `e^{−itH}`. Plan 4.3b lists
   QuantumFoundations §8.2 and `target:4.3a` but no `target:4.2`, whose `H₀ ≥ 0` puts `−1` in the
   resolvent set. Neither is reached transitively (1.8a needs 1.1 only).

   **Exact repair.** In `design/plan.json` add to 1.8b `"target:1.2"` and
   `"roadmap:OperatorTheory SelfAdjointSpectralTheory SA-E26"`; add to 4.3b `"target:4.2"`. No cycle:
   1.2 needs 1.1 and UO-C03; 4.2 needs 4.1, 1.1 and suppliers. This is the pattern of round 8's F02.
   The other 42 targets were compared with their *Needs:* lines and agree, directly or through a
   listed target.

3. **F03** (P3) `grigoryan09` is cited at Ch. 4 for Green's formula, and the References entry differs from the manifest

   **Location.** Line 972: "(DifferentialGeometry 12.5; grigoryan09 Ch. 4)"; line 1639:
   "`grigoryan09` (Ch. 4, 11)".

   **Claim.** Green's formula for a `C²` and a `C¹` function, one of compact support, is in Ch. 4 of
   the source, and the References entry agrees with the manifest.

   **Witness.** `packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`, entry `grigoryan09`,
   `locator`: "Ch. 3–4 (the Laplacian, Green formula, minimal and maximal operators, H¹ and the
   Dirichlet Laplacian), Ch. 11". The classical Green formula belongs to the chapter on the Laplace
   operator of a Riemannian manifold (Ch. 3); Ch. 4 is the `L²` theory cited in 3.4.

   **Exact repair.** Line 972: "grigoryan09 Ch. 3". Line 1639: "`grigoryan09` (Ch. 3, 4, 11)". Line
   1050 (3.4, the Sobolev spaces and the energy form) keeps "Ch. 4". The text is settled as
   uncertified and was not read; the repair makes the README agree with the entry the author
   recorded.

Three findings, all P3; no P1 or P2. Each comes with a repair to apply, so the verdict asks for
changes: an acceptance lists no finding. Nothing else stands between this design and acceptance,
which will be conditional on the two declared supplier gaps `gap:weyl-criterion` and
`gap:spectral-integral-resolvent`. The three findings of round 8 are repaired. The last repair
report marked nothing "not actionable", so nothing is re-raised. Nothing in the README, the plan or
the manifest was changed by this review. Line numbers refer to
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` unless another file is named.

## Previous findings, checked first

| Round 8 finding | Status | Repaired passage and what was verified |
|---|---|---|
| round 8, F01, priority 3: (2.68) placed in §2.3 | repaired | Line 1617 and the manifest: "§2.3 (Theorems 2.12–2.13), §2.4 ((2.68))". The diff of the two heads changes exactly this in both files. |
| round 8, F02, priority 3: 1.7 uses 1.3 without listing it | repaired; the new route leaves one input uncited | Lines 693–700: "1.1's transport law gives `μ^{A′}_{Ω_± x} = μ^A_x`, and 1.3 identifies the two sides with `μ^{H₂}_{Ω_± x}` and `μ^{H₁}_x`"; "*Needs:* 1.1, 1.3". Plan 1.7b has `target:1.3`. The new passage was put through the adversarial pass: R01. |
| round 8, F03, priority 3: owner of the cusp and collar theorem not named | repaired | Lines 143–147 and 1603–1607. Resolved on main: GeometricTopology §7.1 (line 6685); RiemannianGeometry line 2729–2743 (curvature 0 and 1 proved there, curvature −1 given to GeometricTopology §7.1); FuchsianOrbifolds Layer 3 items 1 and 3 (line 563–586); ComplexCurveModuli D6 item 2 (line 150). |

Repaired patterns searched in the rest of the text. Every use of 1.3 was checked for its
commutation hypothesis: 1.4 applies it to UO-C03's subspaces, whose projections commute with every
`P_A(B)` by UO-C03; 1.5 the same; 1.6 to spectral subspaces; only 1.7 lacks the bridge (R01). Every
*Needs:* line was compared with the plan (R02). Every section named in the `teschl` References
entry was compared with the headings again; all agree.

## Verified sound

**Scope of this round.** The three repairs; the fifteen seeded targets in full (1.1, 1.2, 1.3,
1.5, 1.6, 1.8, 1.9, 2.1, 2.3, 3.1, 3.8, 3.10, 4.1, 4.3, 4.5); every other section read in full and
recomputed where the table below says so (1.4, 1.7, 2.2, 3.2–3.7, 3.9, 4.2, 4.4, the Conventions
witnesses, the Examples and Worked examples); the contracts; both gaps; the six maintainer notes;
the plan (44 targets in 4 layers: 26 theorems, 17 definitions, 1 example; every definition has API
entries and at least 3 tests); the manifest (21 entries, every key cited in the README, no cited
key missing).

**Principles.** No route-specific shortcut: separability only in 1.4(4); every `d ≥ 1`; disconnected,
zero-dimensional and empty manifolds treated. No copied passage, no algorithm. A design has no
`Suggested.lean`, so there is no sorry'd data and no `set_option`. Layers are named by their
mathematics and the README does not say it follows a source. A search of the README for TeX
delimiters, pull-request numbers, machine paths, round labels, "optional", "deferred", "removed",
"current" and `lemma` found only the name "Rosenblum's lemma" and "Glazman's lemma". Supply is
one-directional (gate below).

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 bounded calculus | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{{2}}` | `μ_f = δ₁ + δ₂`; `g(A)f = (0,3i)`, `μ = 9δ₂`; with `|g|` it would be `3δ₂` | correct |
| 1.1 spectral orthogonality | `A = 0` on `ℂ²`, `f = h = e₁`; orthogonal reducing subspaces | `μ_{f+h}(B) = μ_f + μ_h + 2Re⟪f, P(B)h⟫`: `4δ₀ ≠ 2δ₀`, cross term `1`; cross term `0` when `P(B)h` stays in `U₂ ⊥ f` | correct, hypothesis needed |
| 1.1 bare PVM and the gap bound | `B ↦ 1_B(2)Q`; `1_B(2)Q + 1_B(5)(1 − Q)`; `s/(z − s)` | value `Q ≠ 1` at `ℝ`; `diag((i−2)⁻¹, (i−5)⁻¹)` inverts `i − diag(2,5)`; `s/(z−s) = −1 + z/(z−s)`, modulus `≤ 1 + |z|/|Im z|` | correct |
| 1.2 four identities | `M_x ⊕ diag(1/2)`, `f = (1,1)`; `√2·1_{[0,1]}`; Cantor measure | `Leb|[0,1] + δ_{1/2}`; atoms of `μ_f` = atoms of `μ_{P_pp f}`, so `μ_f.restrict(atoms) = μ_{P_pp f}`; `2Leb` against `4Leb` reversed; `μ_{P_pp f} = 0` | correct |
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `{1,3}` (unrestricted `{1,2,3}`); `∅`; `σ(A)` | correct |
| 1.4(1) single `f`; maximal parts | annuli `J_m`; `f ∈ ℋ_sc`, `N` null for `μ_{P_sc ψ}` | for each `n` some `J_m`, `m ≥ n`, is charged since `μ({λ}) = 0`; `μ_f(N) ≤ μ_f(N ∩ S_f ∖ At) + μ_f(At) + μ_f(S_f^c) = 0 + 0 + 0` | correct |
| 1.5 three items | `M_x` on `L²([0,1] ∪ [2,3])`; fat Cantor `K`; `a = b`, `A = 0` | `J ⊆ (0,1)` open has mass `Leb(J) > 0`; `(1,2)` has mass `0` for every `f`; `K^ess ⊆ K` has empty interior; right side vacuous, `{a} ⊄ ∅` | correct in both directions |
| 1.6 values and counting | `diag(1,3,5)`; `M_x` on `L²[0,1]`; `−1 ⊕ H₀`; `λ = 4`; `ℋ = 0` | `1,3,5,+∞`; `0,0,…`; `−1,0,0,…`; `dim ran P((−∞,4)) = 2 = #{n : μ_n < 4}`; `μ₁ = inf ∅ = +∞` | correct |
| 1.6 cores, form order | finitely many obstacles, dense `D`; Neumann and Dirichlet on `(0,1)` | the image of `D` in `ℂ^{n−1}` is dense in that of `ℋ`, hence equal, so a small correction restores orthogonality; `(n−1)²π² ≤ n²π²` | correct |
| 1.7 new route | `H₂ = M_x ⊕ 7`, `W = L² ⊕ 0`; `S ⊆ T` self-adjoint | `Q` commutes with `e^{−isx} ⊕ e^{−7is}` and with `1_B(x) ⊕ 1_B(7)`; `T = T* ⊆ S* = S` | true; the bridge is UO-B03 (R01) |
| 1.8 definition laws | `x = |λ|^{−1/4}1_{[−1,1]}`; `m = −1, 0, 1`; `H = 0` on `ℂ` | `{h ≤ m²} = {|λ| ≥ m^{−4}}`, tail `∫_{|λ|<m^{−4}} |λ|^{−1/2} = 4/m²`; `1 ≤ m²` fails only at `m = 0`; `∫ 1 dt = ∞ > 0` without the membership clause | correct |
| 1.8 Rosenblum bound | `M_λ`, `x = m·1_{[0,1]}`, `C = ⟨φ,·⟩φ`; `m = 0` with `C` not Hilbert–Schmidt | `2π∫|φx|² = 2πm²`, equality; `x = 0`, both sides `0` in `ℝ≥0∞` | correct, `2π` is sharp |
| 1.8 square root | `diag((−1)^{n+1}/n²)`; pinned `nuclearENorm` | `|V|^{1/2} = diag(1/n)`, energy `π²/6`; the pin defines the gauge as the sum of singular values, also `π²/6` | correct |
| 1.9 Pearson | Duhamel derivative; `J = 0`; intertwining | `d/du ⟪ψ_u, Jφ_u⟫ = i⟪H₂ψ_u, Jφ_u⟫ − i⟪ψ_u, JH₁φ_u⟫ = i⟪ψ_u, Cφ_u⟫`; `W = 0`, not isometric; `e^{isH₂}W(t) = W(t+s)e^{isH₁}` | correct |
| 1.9 Kato–Rosenblum | `V = 0`, `diag(1,2)`; `diag(1/n²)`, `V = −diag(1/n²)`; `M_x`, `2M_x`; step (c) | `W_± = 0`, `Ω_± = 1`; `H₂ = 0`, `e^{−it/n²}c_n` has no limit, `D_± = 0`; `∫_0^1 e^{itx}dx = (e^{it} − 1)/(it) → 0`, distance `1`; `‖e^{itH₂}e^{−itH₁}x − y‖ = ‖x − e^{itH₁}e^{−itH₂}y‖` | correct |
| 2.1 equivalence, `λ₀` | `A = 2`, `γ = 1, 2, 3`; `ℋ = 0`; `M_x`; Gaussians `e^{−πx²/n²}` | T, T, F for all three conditions; all true; all false; `‖u′‖² = π/(n√2)`, `‖u‖² = n/√2`, quotient `π/n²` | correct |
| 2.3 bound | `sup_{λ≥γ} |λ|/(λ − μ)`; `a = 1, b = 1/2, γ = 0`; scalar `V = −(a + b|λ|)`; `A = 2, V = 1, μ = 0` | `max(1, |γ|/d)` in the four sign cases; `a/d + b·max(1,|γ|/d) < 1` iff `d > max(a/(1−b), a + b|γ|)`; bound `−2`; `t − b|t|` increasing; `(3/2)·2 = 3`, plus sign `1` | correct |
| 3.1 Green pairing | `v = a + ib`, `u = c + id`; circle; `ℍ` | `conj(v)Δu = aΔc + bΔd + i(aΔd − bΔc)`, the stated pairing; `2πn² = 2πn²`, unconjugated `0`; `Δyˢ = s(1−s)yˢ`, `Δy² = −2y²` | correct |
| 3.5 cutoffs | step `φ`; `(0,1)` | `|grad χ_k| ≤ 2·(2/k)`; `1 ≤ (4/k)(1/2)` fails for `k > 2` | correct |
| 3.6 (a), (b) | `⟨d(χ²u), du⟩` | `∫χ²|du|² ≤ ‖Δu‖‖u‖ + ½∫χ²|du|² + 2 sup|dχ|²‖u‖²`; `∫χ²|u|² ≤ sup|dχ|²‖u‖² → 0` | correct |
| 3.7 `λ₁⁺ = λ₁` | connected, finite volume, `0` isolated; a point; `ℝ`; `ℝ²/ℤ²` | `0` simple and isolated, so `0 ∉ σ_ess` and `μ₂ = inf(σ ∖ {0})`; `+∞ = +∞`; `0 = 0`; four vectors of norm `1`, `4π²` four times | correct |
| 3.8 `κ`, eigenspace identity | `(a − ib)(c + id)`; circle, `μ = 1`; `N` points; `∅`; `S²` | `ac + bd + i(ad − bc)`, the pinned inner product; real and complex dimension `2`; `0` for `k < N`, then `+∞`; all `+∞`; `2, 2, 2` | correct |
| 3.9 route and Checks | `T = (B − is)⁻¹`; `V = 1_{[0,π)}` | `T − T* = 2is·TT*`; Rayleigh quotient `1/2`; `u(0) = 0`, `(1 − λ)u′(0) = −λu′(0)`, so `u = 0` | correct |
| 3.10 cusp sequence | `r = log y`; `u_n`; `v_j`; `yˢ`; scaling `c` | measure `w e^{−r}dr`; `−(∂_r² − ∂_r)(e^{r/2}f) = e^{r/2}(f/4 − f″)`; `‖u_n‖² = wn‖ψ‖²`; residual `−y^{1/2+it}(2itψ′/n + ψ″/n²)`; supports `[2^{j+1}, 3·2^j]`, `3·2^j < 2^{j+2}`; `∫_a^∞ y^{2Re s − 2} < ∞` iff `Re s < 1/2`; area `w/a` invariant | correct |
| 3.10 hypothesis on `X` | compact `X` | a point of height `y` carries a geodesic loop of length about `w/y`, below `2·inj(X)` for large `y`: no standard cusp end, consistent with `σ_ess = ∅` | not vacuous, not false |
| 3.10 Examples | `Γ(2)`; `Γ₀(2)` | area `6·π/3 = 2π`; rows `(1,−1), (2,−1)`: determinant `1`, trace `0`, fixed point `2z² − 2z + 1 = 0`, `z = (1 + i)/2` | correct |
| 4.1 norms and Checks | `(1 + |ξ|²)û`; `e^{−πx²}`; `1_{[−1,1]}` | `N ≤ ‖u‖ + (4π²)⁻¹‖Δu‖`, `‖u‖ + ‖Δu‖ ≤ (1 + 4π²)N`; `‖u″‖² = 3π²/√2`, `‖ξ²û‖² = 3/(16π²√2)`, ratio `(4π²)²`; `sin(2πξ)/(πξ)` | correct; the pinned multiplier is `(1 + ‖x‖²)^{s/2}` |
| 4.2 density and form | `e^{−πx²}`, `d = 1` | `e^{−λ/(2π)}/(2π√λ)`, mass `2^{−1/2}`, equal to QuantumFoundations §8.2's formula at `n = 1`; `q(u) = π/√2`, quotient `π` | correct |
| 4.3 compactness, resolvent point | tail; scalar `s = 0, 1` | `‖V − V_R‖_∞ + ‖V‖_∞(4π²R² + 1)⁻¹`; `(s+1)⁻¹(1 + (1+i)/(s−i)) = (s−i)⁻¹`: `i`, `(1+i)/2`; sign slip `2 − i` | correct |
| 4.4 square well | `k = 0.739` | `k tan k = 0.6737 = √(1 − k²)`, `E = −0.454 ∈ [−1, 0)` | correct |
| 4.5 reality | `cos x + cos √2x`; `V_{±e₁} = i`; `θ_{e₁} = 1, θ_{−e₁} = 2` | `conj(V) = Σ V_{−n}e^{i⟨θ_{−n},x⟩} = V`; `2i cos x`; `(e^{ix} + e^{2ix})/2` | correct |

**Sources (the seeded sample).** Read at the text this round: teschl line 3282–3304 (Lemma 2.24,
p. 80), 3983–3992 (Theorem 3.7, p. 96), 4315–4332 ((3.79), Lemma 3.15, p. 104), 4346–4366
(maximal spectral vector, Lemma 3.16), 4388–4427 ((3.83), Lemma 3.19 and its proof, (3.85)),
4945–4946 (Corollary 4.6), 5044–5069 (Theorem 4.10, p. 119, Corollary 4.11, Theorem 4.12(i)),
5683–5720 (Lemma 6.3, Theorem 6.4, p. 135), 6277–6281 (Lemma 6.17), 7086–7092, 7137–7143 ((7.26),
p. 168), 7213–7228 (Lemma 7.11), 10585–10620 ((12.3), p. 247, Lemma 12.1, (12.6), Theorem 12.2);
kato57 line 21–35 (Theorem 1, (1.1)–(1.3)) and 92–111 (Lemma 2.1, (2.7)); yafaev04 line 116–122
(Definition 1.3), 136–140 (Theorem 1.4), 193–206 (Theorem 1.8, Lemma 1.9); rosenblum57 line 70–95
(Theorem 1.6 and the weak-to-strong step); lp80 line 251–256 ((2.8)–(2.10)), 279–301 ((2.15)–(2.17),
Theorem 2.1, Corollary 2.2); hm23 line 39–47, 60–66, 104–105; kps26 line 20–50 (`d ≥ 2`, `l > d`,
(1.1)–(1.6), Theorem 1.1); bms02 line 128–129, 151–157, 179–182, 245–256. Each number and page
agrees, and each passage supports its statement with the differences the README states (arbitrary
`ℋ`; (1) and (2) of 1.4 and all of 1.5 deduced here; every bounded `V` beyond Theorem 10.2;
disconnected `X`; every `l ≥ 1` in 4.5). The author flags no locator as unverified. Nothing was
fetched; no `needs-references.toml` was written.

**Pinned libraries.** The pins of the manifest are the plan's baseline (Mathlib `1b1ccf4`, Tau
Ceti `2fd255d`). All 64 dotted backticked names of the README were resolved; 63 are at the pins and
one, `CompactFormPair.eigenvalue_eq_rayleighMinMax`, is VariationalMethods 4.4's (main, line 788),
attributed to it at line 82. Opened this round: `TauCeti.ProjValMeasure`
(`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91`, fields `proj`, `diag`,
`diag_finite`, `inner_proj`, `proj_univ`), `integral` (`ProjValMeasure/Integral.lean:218`),
`LinearPMap.resolvent`, `resolvent_sub_resolvent`
(`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:169, 280`),
`ContinuousLinearMap.nuclearENorm` (`TauCeti/Analysis/OperatorIdeal/Nuclear/Basic.lean:53`, the sum
of the singular values), `hilbertSchmidtEnergy` and `hilbertSchmidtEnergy_indep`
(`HilbertSchmidt/Basic.lean:89, 150`), `integral_mul_laplaceBeltrami`
(`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:312`: `f` of class `C¹` with compact
support, `g` of class `C²`, sign `−∫⟪grad f, grad g⟫`), `integral_mul_divergence_of_hasCompactSupport_right`
(line 289), `isOpenPosMeasure_riemannianVolume` (`VolumeDensity/Support.lean:36`),
`TauCeti.HyperbolicMetric` (`Riemannian/Hyperbolic.lean:51`, with its field `complete`), Mathlib
`TemperedDistribution.MemSobolev` and `memSobolev_iff_exists_smulLeftCLM_fourier`
(`Mathlib/Analysis/Distribution/Sobolev.lean:153, 222`),
`TemperedDistribution.laplacian_eq_fourierMultiplierCLM`
(`Mathlib/Analysis/Distribution/FourierMultiplier.lean:208`, factor `−(2π)²`), `LinearPMap.closure`
(`Mathlib/Topology/Algebra/Module/LinearPMap.lean:93`). The remaining names were located by file
and line at the same pins and agree with the files the contract names.

**Suppliers, resolved now.** Main is at `1a19c9f`. Read on main: SelfAdjointSpectralTheory SA-C12,
SA-C19, SA-C39, SA-C86, SA-D22, SA-E05, SA-E08, SA-E09, SA-E11, SA-E13, SA-E26–SA-E30, SA-E43,
SA-E44, SA-E47 (each states what the README takes from it); UnboundedOperators §2.3 (UO-B03), §3.1
(UO-C01), §3.2 (UO-C02: definitions, equivalence, unitary invariance, finite-rank windows; Lemma
6.17 appears as a locator and inside the Fredholm proof, not as an item), §3.3 (UO-C03: `H_pp`
carried by a countable set, `H_ac ≪ Leb`, `H_sc` singular and atomless, projections commuting with
every `P_A(B)`, self-adjoint restrictions in the finite-control case), §5.4 (UO-E04: `V(A − i)⁻¹`
compact with `dom A ⊆ dom V`), and the headings of UO-A01, UO-A02, UO-A06, UO-A07, UO-D06, UO-E05,
UO-E06; VariationalMethods 4.4 and 5.1; the four roadmaps of the round-8 repair. At its open head:
QuantumFoundations §8.2 (free Hamiltonian on `L²(ℝⁿ)`, both cores, intertwining
`M_(4π²|ξ|²/(2m))`, the spectral density quoted in 4.2) and §9.5. `roadmaps resolve` on this head:
no citation and no Lean name found nowhere. `overlaps.md`: no pull request changes this roadmap, no
cited id is dropped, no id is defined by an open revision only, and there is no second copy (the
roadmap is not on main).

**Declared gaps.** `gap:weyl-criterion` (UnboundedOperators UO-C02, §3.2) and
`gap:spectral-integral-resolvent` (UO-A02, §1.2). Each `needs` is one statement with its
hypotheses, is not a stated item on main, and carries the same slug in the plan's `gaps` and at
lines 344–356. They are contracts, not findings; an acceptance, once the three findings are applied, is conditional on both.

**Maintainer notes** (none holds at this head).

1. Not held: lines 122–129 give UO-E06 only `L² + L^∞` on `ℝ³` and Coulomb to QuantumFoundations §9.5; lines 139–140 put `L^p` and the Kato class outside the roadmap.
2. Not held: lines 77–80 and 325–329 say UO-C03 gives self-adjointness with a finite control measure, and 1.3 with SA-C19 in general.
3. Not held: every mention of Weyl's criterion carries `gap:weyl-criterion` (lines 68–69, 344–349, 1336–1339, 1385).
4. Not held: lines 1476–1484 state the passage from `(H₀ + 1)⁻¹` to `(H₀ − i)⁻¹`; the identity is recomputed in the table.
5. Not held: the last item of 1.1 (lines 461–468) rests on `gap:spectral-integral-resolvent`.
6. Not held: the contract lists SA-C86 and SA-E30 (lines 306–313), as the plan does.

The closing instruction is met at lines 125–129 and 1520–1524 (4.4 names UO-E06 as its
three-dimensional case). The ownership decisions of the notes were not reopened.

**Duplication.** `roadmaps grep` over main and the open heads, by object: Kato–Rosenblum and
essential closure, no other text; wave operators, only RelativisticQuantumFieldTheory's Haag–Ruelle
ones; "Pearson's theorem", MathematicalStatisticsAsymptotic's chi-square theorem (another object);
absolutely continuous spectrum, QuantumFoundations (cited), CongruenceSpectralGap (cited) and
MaassForms (one mention, not read further); essential self-adjointness of a Laplacian, only
AutomorphicSpectralTheory's `Γ₀(N)` orbifold Laplacian (cited as §1.16a); the min–max principle,
OperatorIdeals (singular values) and RiemannianGeometry R5c (cited). No name of this roadmap occurs
in another roadmap.

Overlap check: read UnboundedOperators, VariationalMethods, SelfAdjointSpectralTheory (main; its open revision drops no cited id), QuantumFoundations, CongruenceSpectralGap, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory; shared: pp/ac/sc subspaces — UnboundedOperators UO-C03; essential spectrum — UnboundedOperators UO-C02; strong commutation — UnboundedOperators UO-B03 (R01 asks for the citation); `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; free Hamiltonian — QuantumFoundations §8.2; Courant–Fischer for compact form pairs — VariationalMethods 4.4; congruence Laplacians — CongruenceSpectralGap §0.2 and AutomorphicSpectralTheory §1.16a; each cited, none owned twice.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier named in a *Needs:* line or a contract is on main or is
QuantumFoundations, which is earlier in the merge order.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, four layers each
ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every
definition (spectral parts, essential closure, maximal spectral vector, min–max values, wave
operators, density-bounded vectors, `λ₀`, `Δ`, `Δ₀`, `Δ_max`, `H¹`, `H¹₀`, `Δ_F`, `λ_k`, `λ₁⁺`,
standard cusp end, vanishing at infinity, `H_V`, quasi-periodic `V`) has its API and at least three
discriminating Checks; every theorem has its hypotheses and a locator. Layers 1 and 2, and 3 and 4,
are mutually independent (lines 436–442), so no source's order is imposed.

**Headline theorems.** The type projections realise the Lebesgue decomposition (1.2); the
characterisation of `σ_ac` and the interval criterion (1.4, 1.5); min–max below the essential
spectrum (1.6); Pearson and Kato–Rosenblum (1.9); essential self-adjointness on complete manifolds
(3.6); `[1/4, ∞) ⊆ σ_ess` from a cusp end (3.10); `−Δ + V` for bounded real `V` (4.4). A design has
no `Suggested.lean`: statability at the pins, padding, binders and imports are package-stage
checks, and the README attributes no backticked Lean name to this roadmap.

Source independence: 31 passages compared with 8 sources read this round (teschl 13, kato57 2, yafaev04 3, rosenblum57 2, lp80 3, hm23 3, kps26 2, bms02 3), none shared beyond standard names, formulas and forced hypothesis lists; largest share teschl, 39 of 116 mentions of a source key; contents compared with teschl: independent (Layer 1 draws on its §§2.5, 3.2, 3.3, 4.2–4.4 and 12.1 and on kato57 and yafaev04, Layer 2 on §§4.3 and 6.1, Layer 3 on §2.3 only, Layer 4 on Chapters 7 and 10; no run of sections maps one to one onto a run of its sections).

## Not verifiable

- Elaboration: not available (this lane does not elaborate). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`,
  `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`)
  were not read. Of the sampled targets, 3.1 rests on `grigoryan09` alone on the source side; its
  statement was checked by computation and against the two pinned Green identities. R03 rests on
  the manifest's own entry, not on the text.
- kps26 is an OCR extraction: (1.3)–(1.6) are legible in outline only; `d ≥ 2`, `l > d`, the
  conjugate symmetry and Theorem 1.1 are legible.
- The published numbering of the arXiv copies of `bms02`, `hm23`, `kps26`, `yafaev04` was not
  compared with the journal versions.
- Whether ComplexKahlerGeometry K5a's `H²` realisation is stated for a zero-dimensional compact
  manifold was not settled; 3.8 treats dimension `0` separately and by hand.
- Ownership against open pull requests was checked by object with `roadmaps grep` and by reading
  the roadmaps of the Overlap line; the other open heads were searched, not read.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is the ambient coefficient over the relative coefficient minus one; it should be over one minus the relative coefficient; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof, last line, printed page 135: the source says the admissible shift lies below the same quotient with denominator the relative coefficient minus one; it should have one minus the relative coefficient and a negative sign; affects the proof.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book; 39 of 116 source mentions point into it. The wording and arrangement checks found nothing shared (`packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`, entry `teschl`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "976b255a1e503fdc66abebc1fb01fcb00339b7e7", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~9", "model": "fable", "worker": "chris-x79"} -->
