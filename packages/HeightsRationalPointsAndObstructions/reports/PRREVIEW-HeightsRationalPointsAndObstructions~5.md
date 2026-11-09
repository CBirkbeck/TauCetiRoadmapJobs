# Review of HeightsRationalPointsAndObstructions (pull request #1017 at 3dc9d71)

**Verdict:** accepted

This is an incremental re-review of the 24 README lines changed since 49a5570 (9 insertions, 15 deletions, `README.md` only). The change repairs the single finding of the previous review: the field-case Picard computation for a connected reductive group is now owned in §3.8e, every mention of GroupSchemesOverABase is gone, and the step is sourced to Sansuc 1981 with lemma and page numbers. No finding remains; the gate passes.

## Previous findings

- R01 — repaired: line 29 no longer names GroupSchemesOverABase; the supplier bullet and the contract subsection are deleted; §3.8e reads "For Pic Ḡ prove the field case here, on the reductive quotient Ḡ_red=Ḡ/R_u(Ḡ)"; §3.8f reads "both by §3.8e"; the three contract Checks moved into §3.8e, with a fourth (SL₂ sign witness); Sources cite Sansuc 1981 by lemma and page, and References list it. `grep` finds no `GSOB` and no `GroupSchemesOverABase` in the folder. Step 7 asked for Popov 1974 as well; the author cites Sansuc only, which suffices because every step of the argument now has a Sansuc locator. Step 8 (the description) is not done: see the remark below.

## Verified sound

### Scope of the change

- `git diff --stat 49a5570 HEAD` on the folder: `README.md`, 9 insertions, 15 deletions; `Suggested.lean` and `metadata.toml` unchanged.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- The changed passages: the supplier preamble (line 29), the deleted GSOB bullet (former line 50) and contract subsection (former lines 118–126), the Picard paragraph, four new Checks and the Sources/*Needs:* line of §3.8e (lines 1567, 1575–1578, 1580), the `[T̂→T̂_sc]` sentence and *Needs:* line of `connectedDegreeZero_PT` in §3.8f (line 1598), and the Sansuc entry in References (line 3024).

### Gate, dependency check, elaboration

- The worker's gate at 3dc9d71: every check passes, including `dropped=0`, `depcheck=0`, `build=0`.
- The dependency check run this round prints `depcheck: 236 roadmaps, 2282 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/HeightsRationalPointsAndObstructions/Suggested.lean` (25 s) prints seven `declaration uses sorry` warnings (lines 60, 72, 79, 91, 138, 152, 166) and nothing else. The file is byte-identical to the one the previous four reviews read; the worker's signature dump of its 11 declarations shows no lost section binder, and no README statement about them changed.

### The Sansuc 1981 locators (all five correct)

The cache copy (`sansuc1981`) is an image-only GDZ scan; OCR is not installed on this worker, so I rendered PDF pages 26–33 to images with ghostscript and read them. Article page = PDF page + 10 (PDF page 28 carries printed page 38).

- Lemma 6.5 (Rosenlicht), p.39: for k-varieties X, Y and a smooth connected linear G, `U(X)=k[X]^×/k^×` is free of finite rank, `U(X×Y)=U(X)⊕U(Y)`, `U(G)=Ĝ(k)`. Matches "Rosenlicht's units".
- Lemma 6.6(i), p.40: for smooth X, Y with Y rational over k̄ and `Y(k)≠∅`, `Pic(X×Y)=Pic X⊕Pic Y`. Matches "Pic of a product with a factor rational over k̄ that has a point". Over k̄ the reductive factor is rational and has the identity point, so the README's use is within the hypotheses. Sansuc's Remark 6.6.1 (an affine conic without rational point, `Pic(X×X)=ℤ/2`) is the negative control for the point hypothesis.
- Lemma 6.9(iii) p.41 and (iv) p.42: for semisimple G with fundamental group B, `Pic G=B̂(k)`; for simply connected G, `Pic G=0`. The reduction from reductive G to its derived group is exactly Remark 6.11.3, sequence (6.11.4), p.43: over k̄, `0→Ĝ''→Ĝ→Ĝ'→Pic G''→Pic G→Pic G'→0` for `1→G'→G→G''→1`; with `G'=G_der` and `G''` the torus quotient, `Pic G''=0` and `Ĝ'=0`, so `Pic G≅Pic G_der=B̂`. The README's parenthesis "Pic of a connected reductive group over k̄ is the character group of the fundamental group of its derived group" is what these three locators give together.
- Proposition 6.10, sequence (6.10.2), p.43: for a torsor `X→Y` under connected smooth linear G (reductive if k is imperfect) with a Zariski-local section, `0→U(Y)→U(X)→Ĝ(k)→Pic Y→Pic X→Pic G→0`. Matches "the units/Pic sequence of a Zariski-locally trivial torsor"; the README applies it to `Ḡ→Ḡ_red`, a torsor under the split unipotent radical over an affine base, which is Zariski-trivial.
- References entry: J. reine angew. Math. 327 (1981) 12–80, doi 10.1515/crll.1981.327.12, GDZ link: correct and a legal copy.

### The ReductiveGroups citations

On main, `TauCetiRoadmap/ReductiveGroups/README.md` has "Layer 6: reductive and semisimple groups" (line 466; central isogenies, simply connected and adjoint forms at line 469), "Layer 7: structure theory" (line 627; Bruhat decomposition at lines 630, 648, 7C at 652) and "Layer 10: rational representations, highest weights and regular functions" (line 1731). The new *Needs:* item "ReductiveGroups Layers 6–7 (structure, Bruhat cells, central isogenies) and Layer 10 (highest weights)" resolves. ReductiveGroups is on main, so the edge is downward.

### Mathematics of the changed passages

- **Big cell and boundary divisors.** `B⁻U⁺=U⁻TU⁺≅𝔸^N×G_m^r` with `N=dim Ḡ_red−r`; its Pic is 0 and its units are `k̄^××X*(T)`. The cells `B⁻wB⁺` have dimension `dim B+ℓ(w₀)−ℓ(w)`, so `B⁻s_αB⁺` has codimension one and the complement of the big cell is the union of their closures `D_α`.
- **The divisor map.** For dominant λ the matrix coefficient `g↦⟨v*, g v_λ⟩` with `v_λ` a `B⁺`-highest-weight vector and `v*` the `B⁻`-highest-weight vector of weight `−λ` in the dual restricts to `λ(t)` on `u⁻tu⁺`, is regular on `Ḡ_red`, and vanishes to order `⟨λ,α^∨⟩` along `D_α`. The kernel of `λ↦div λ` is the characters extending to units of Ḡ, which are `X*(G)` by Rosenlicht: the sequence `0→X*(G)→X*(T)→ℤ^Δ→Pic Ḡ→0` is exact.
- **Identification with `P/X*(T_der)`.** `(⟨λ,α^∨⟩)_α` is the fundamental-weight coordinate of the restriction of λ to `T_sc`; restriction `X*(T)→X*(T_der)` is onto and `X*(T_der)→X*(T_sc)` is injective, so the image is `X*(T_der)` and the cokernel is `X*(ker(T_sc→T_der))`, the character group of `π₁(G_der)`.
- **Reduction to the reductive quotient.** `Ḡ≅Ḡ_red×𝔸^m` as a variety (a torsor under a split unipotent group over an affine base is trivial), so units modulo constants and Pic are unchanged; Sansuc (6.10.2) gives the same.
- **§3.8f.** The kernel and cokernel of `[T̂→T̂_sc]` are now both attributed to §3.8e; nothing else in the paragraph changed.

### Adversarial table

Rows marked r5 were computed this round; the others are carried from the previous reports for statements the diff leaves untouched.

| Statement | Instances | Values | Result |
|---|---|---|---|
| §3.8e sequence `0→X*(G)→X*(T)→ℤ^Δ→Pic Ḡ→0`, `λ↦Σ⟨λ,α^∨⟩D_α` (r5) | SL₂; PGL₂; GL₂; SL₃; PGL₃; G_m | SL₂: `ϖ↦D`, `X*(G)=0`, Pic 0. PGL₂: `α↦2D`, Pic ℤ/2. GL₂: `(m,n)↦(m−n)D`, kernel `ℤ(1,1)=ℤ·det`, Pic 0. SL₃: `X*(T)=P→ℤ²` bijective, Pic 0. PGL₃: `X*(T)=Q`, Cartan determinant 3, Pic ℤ/3. G_m: `Δ=∅`, kernel `X*(G)=ℤ`, Pic 0. | exact in all six |
| Big cell `U⁻TU⁺` and `D_α` as closures of `B⁻s_αB⁺` (r5) | SL₂; dimension count | `[[1,0],[c,1]]·diag(t,1/t)·[[1,b],[0,1]]` has upper-left entry `t≠0`, and LDU inverts it; complement `{a=0}={bc=−1}≅G_m×𝔸¹` irreducible. `dim B⁻s_αB⁺=dim B+ℓ(w₀)−1=dim G−1`. | correct |
| Matrix coefficient of a highest-weight vector equals the character on the big cell (r5) | SL₂ standard representation, `λ=ϖ` | `v_λ=e₁`, `v*=e₁*`: the function is `g₁₁=a`, regular, order 1 along `{a=0}` = `⟨ϖ,α^∨⟩`. | correct |
| Sign witness: same character on the other big cell (r5) | SL₂, `U⁺TU⁻` | `[[1,b],[0,1]]·diag(t,1/t)·[[1,0],[c,1]]` has `d=1/t`, so `ϖ=1/d`, divisor `−{d=0}`. | correct; convention pinned |
| `Pic Ḡ≅P/X*(T_der)` and the wrong model with `T̂_der` (r5) | PGL₂; GL_n; torus; wrong model | PGL₂: `2ℤϖ⊂ℤϖ`, cokernel ℤ/2 = Pic. GL_n: `X*(T_der)=X*(T_{SL_n})=P`, cokernel 0 = Pic (GL_n open in `𝔸^{n²}`). Torus: `P=0`, cokernel 0. Wrong model on PGL₂: `X*(T)→X*(T_der)` is the identity, cokernel 0 ≠ ℤ/2. | correct; wrong model excluded by the PGL₂ Check |
| New Checks of §3.8e (r5) | the four bullets | SL₂: `ℤD/ℤD=0`, sign as above. PGL₂: `α=2ϖ↦2D`. GL₂: `e₁=a`, `e₂=det/a` from the LDU product `[[x,xb],[cx,cxb+y]]`, map `(m,n)↦m−n`. Torus: big cell = group, Pic 0. | all four correct |
| Reduction to `Ḡ_red` changes neither units nor Pic (r5) | Borel `B⁺⊂SL₂`; `G_a` | `B⁺≅G_m×𝔸¹`: `U(B)=ℤ=X*(T)`, Pic 0 = Pic T. `G_a`: units constants, Pic 0 = Pic of the trivial quotient. | correct |
| Lemma 6.6(i) hypotheses in the product step (r5) | `PGL₂×ℙ¹` over k̄; Sansuc's affine conic over k | `ℤ/2⊕ℤ`; the conic without a k-point has `Pic(X×X)=ℤ/2≠Pic X⊕Pic X=0`, excluded because the README works over k̄ where the identity is a point. | correct for the README's use |
| §3.8e `Pic(Ḡ×X̄)=Pic Ḡ⊕Pic X̄` route (r4) | `PGL₂×ℙ¹`; `G_m×G_m`; cuspidal X (excluded) | `ℤ/2⊕ℤ`; Pic 0, units `ℤ²`; `NPic≠0` excluded by smoothness | unchanged |
| §3.8f `[T̂→T̂_sc]` identification (r4) | PGL₂; GL_n; torus | kernel 0 / `ℤ·det` / `X*(T)`; cokernel ℤ/2 / 0 / 0 | unchanged, now sourced to §3.8e |
| §5.13b second Check (r4) | `y²=x³−2` over ℚ̄; `𝔽̄_p(t)` constant A | `(3,5)` of infinite order, `x(2P)=129/100`; `A(𝔽̄_p(t))=A₀(𝔽̄_p)` torsion | unchanged |
| §5.13b `finitelyGeneratedField_points_fg` (r3) | ℚ; 𝔽_p; 𝔽_p(t); ℚ(t); ℚ̄; A=0 | f.g.; finite; Lang–Néron; ℚ̄ excluded | unchanged |
| §2.16 `H³(G_k,k^{s×})=0`; `Br₁/Br₀≃H¹(k,Pic X̄)` (r2) | ℚ; `ℚ(√13,√17)`; ℝ | 0; ℤ/2 in the finite layer; `Ĥ³(ℤ/2,ℂ^×)=0` | unchanged |
| §3.17a torsor/divisor and polarization diagonal (r2) | elliptic A; a=0; `λ_(O)` | `⟨0,β⟩=0`; `⟨a,a⟩=0` | unchanged |
| §1.1, §4.6 `mordell_finite`, §5.1 `point`/`cosetSupport` (r2) | `φ=[n]`; genus 2 over ℚ; a=0 | injective Kummer map; one target; support = A | unchanged |
| Height conventions, §§0.2–0.30 (r1) | `[2:1]` over ℚ and ℚ(i); `(3,5)`; `[2]*L=L⁴` | `log 2`, `2 log 2`; `129/100`; four quartics | unchanged |
| §1.7 `fg_points`; §1.10; §§1.15–1.19 (r1) | `y²=x³−x`, `S={2,∞}`; ℚ₂, ℝ | `Sel²=(ℤ/2)²`, `Ш[2]=0`; indices 8, 16, 1, 2 | unchanged |
| §§2.2–3.18c Checks (r1) | `ℤ[t]/(3t−1)`; `(−1,t)`; ℚ(i); ℤ/3 | no ℤ₃-point; 1/2; 0; `1/3+2/3=0` | unchanged |
| §4.8 `siegel_finite`, §5.6, §5.13 `finiteRank_mordellLang`, §6.2 `genusZero_hassePrinciple` (r1) | ℙ¹ minus 1, 2, 3 points; Γ=0; `x²+y²=3z²` at 3 | infinite / infinite / finite; dimension 1, rank 0; no ℚ₃-point | unchanged, not vacuous |

### Headline theorems, padding, seeded sample

- `Suggested.lean` is unchanged: the seven sorried headlines (Mordell–Weil over number fields and finitely generated fields, Mordell, Siegel, characteristic-zero Manin–Mumford, finite-rank Mordell–Lang, genus-zero Hasse principle) and the not-statable headlines named in its docstring are those of the previous reports; the change touches none of them and adds no declaration, so the padding probe was not rerun.
- None of the fifteen sampled targets (0.16, 0.22, 1.6, 1.11, 2.16, 2.19, 2.20a, 3.7, 3.8d, 4.3, 5.9, 5.13, 5.13b, 5.17, 5.17c) lies in the changed lines. §3.8d is the subsection before the changed one and is untouched; §3.8's `descent_descent_eq_descent`, which reaches §3.8e through its *Needs:*, now has an owned Picard step.

### Ownership and overlaps

- The Picard computation of a connected reductive group over k̄ has no other owner among the roadmaps this one may cite: ReductiveGroups and ReductiveGroupsPartII on main stop at Bruhat cells and highest weights, SchemeAndStackFoundations at Picard theory of schemes and curves, and the previous review's search of main and every open head found it only in GroupSchemesOverABase, which may not be cited. Owning it in §3.8e is correct.
- The overlap scan lists no pull request changing this roadmap, no dropped id it cites and no id it drops. The closest open roadmap is HeightsRationalPointsAndObstructionsPartII, whose scope starts where this one stops.

### Remarks on untouched text and on the pull request (no change to the folder requested)

- **Description residue (step 8 of the previous repair).** The pull-request description still lists "#1522 GroupSchemesOverABase" under *Depends on* and places "#1522 (GroupSchemesOverABase, mycaule)" in the merge-order chain. The README no longer cites that roadmap, which is on the never-cite list, so the entry would hold this pull request behind a roadmap it does not need. This is a description, not a folder, matter: the worker or the human should drop the entry before merge.
- **Overlap lead carried from r4.** Line 1161 cites LocalFieldsRamification Layer 4, which exists on main but which an open revision of that roadmap no longer defines.
- **Citation leads.** The 28 Lean-name leads of the citation scan all sit in untouched lines; three are this roadmap's own `Suggested.lean` names.

### Declared gaps

None: there is no readable `design/plan.json`, and the change declares no gap.

## Not verifiable

- **Faltings 1991 (§5.9a).** Carried from the first review: JSTOR only, untouched passage.
- The Sansuc 1981 scan the worker recorded as unreadable was read this round by rendering its pages; the `needs-references.toml` entry for it is the worker's, and nothing was added to it.

## Source issues

- none
