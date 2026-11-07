# Review of StableReductionPartII (pull request #1841 at 7f77bd8)

**Verdict:** needs changes

This is an incremental re-review of the 65 lines changed since ef1de05. It has two P3 findings and no blocking finding. The gate passes, the dependency check reports no problem, and `Suggested.lean` (unchanged since ef1de05) elaborates with `sorry` as the only warning.

## R01 (P3) — §2.146 Check: the scalar 1/3 cannot tell the tensor over A from the tensor over Â

**Location.** `TauCetiRoadmap/StableReductionPartII/README.md` line 3584, the second Check of §2.146: "In R̂⊗_ℤ ℤ₂ the elements σ⊗(1/3) and (1/3)σ⊗1 differ, so a cone built on the tensor product over A instead of Â would not have this value forced."

**Claim.** The claim is false, so the Check does not rule out the wrong model it names. 1/3 lies in `ℤ_(2) = ℚ ∩ ℤ₂`, a localization of `A = ℤ`. Over a localization of A, balancing over A already gives balancing for that scalar. A cone with point `R̂⊗_ℤ ℤ₂` and components `eₙ⊗id` sends `σ⊗(1/3) = (1/3)σ⊗1` to `e₃((1/3)σ)⊗1 = (3+6v+4v²)⊗1`, which is the same value as the correct cone.

**Witness.** `3·(σ⊗(1/3)) = σ⊗1 = 3·((1/3)σ⊗1)`. Multiplication by 3 on `R̂⊗_ℤ ℤ₂` is `(3·id_R̂)⊗id`, which is invertible because R̂ is a ℤ₂-module. So the two elements are equal. §2.115's second Check (line 2957) already calls 1/3 "a value check, not a separation".

**Repair.** Use a completed scalar outside `ℤ_(2)`. Take `α∈ℤ₂` with `α² = −7` and `α ≡ 3 (mod 8)`; this root exists because `−7 ≡ 1 (mod 8)`, and exactly one of `±α` is `≡ 3 (mod 8)`.
- The value is unchanged: the level-3 component of `σ⊗α = α·(σ⊗1)` is `3(1+2v+4v²) = 3+6v+12v² ≡ 3+6v+4v²`, so it is still `(3+6v+4v²)⊗1`.
- With this scalar the separating claim holds:
  - The ℤ₂-algebra map `R̂→ℤ₂` with `u,v ↦ 0` sends σ to 1. It therefore sends `σ⊗α − ασ⊗1` to `1⊗α − α⊗1` in `ℤ₂⊗_ℤ ℤ₂`.
  - Next apply `ℚ⊗_ℤ −`, which lands in `ℚ₂⊗_ℚ ℚ₂`, and then `ℓ⊗id`, where `ℓ:ℚ₂→ℚ` is ℚ-linear with `ℓ(1) = 0` and `ℓ(α) = 1`. Such an ℓ exists because `α∉ℚ`. The result is `−1 ≠ 0`.
  - This is the device of the README's own two-coefficient-ring counterexample (line 5768).

Rewrite the sentence with α in place of 1/3. Alternatively, delete the sentence and keep the 1/3 value computation as a value check.

## R02 (P3) — Ile §7 ends on p. 26, not p. 27

**Location.** `TauCetiRoadmap/StableReductionPartII/README.md` lines 5419 (§2.236), 5433 (§2.237), 5534 (§2.242) and 5582 (§2.245): "[ile], §7, pp. 25–27".

**Claim.** In arXiv:1110.3909v3, §7 "The stabilisation map" fills pp. 25–26. Page 27 contains only the running head and the References. The previous report's repair asked for "pp. 25–27" because it misread the page-27 marker as part of §7. The author applied that wording exactly as given, so the error is the previous report's.

**Witness.** In the `ile` text:
- line 1247 is the page-25 marker, and line 1259 is the §7 heading;
- line 1299 is the page-26 marker, and line 1349 is the last line of §7;
- line 1350 is the page-27 marker, followed by the running head at line 1351 and "References" at line 1352.

**Repair.** Write "§7, pp. 25–26" at the four sites.

## Previous findings

- R01 — repaired: §2.146 is now the single cone, under C1 with arbitrary N ("no flatness, finiteness or freeness of N is assumed"). §2.148 is now "Finite-free coordinates of the completed tensor cone" and states "This target constructs no cone". One of the new Checks in §2.146 makes a false claim; that is R01 of this report.
- R02 — partly repaired: all four sites now read "[ile], §7, pp. 25–27". The start page is right. The end page should be 26, because p. 27 holds only the References (R02 above).

## Verified sound

**Gate, dependency check and elaboration.**
- I re-ran the gate at 7f77bd8. Every check is 0 and the result is OK (set_option, sorry-data, imports, statement-hygiene, readme-ids-missing, depcheck, metadata, stray-files, outside-folder, source-material). The worker's `gate.md` records build=0.
- The dependency check prints `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StableReductionPartII'` is empty.
- `lake env lean` on `Suggested.lean` ran in 15 s. It printed exactly five `declaration uses sorry` warnings (lines 122, 139, 148, 155, 171) and nothing else.
- `Suggested.lean` and `lake-manifest.json` are byte-identical at ef1de05 and 7f77bd8: the diff touches only `README.md`, and the manifest blob is the same at both heads. Mathlib is still pinned at f6090c7.
- So the 13 elaborated signatures in `signatures.md`, my comparison of them with §§2.7, 2.8, 2.154, 2.170 and 2.225–2.230, and the one-tactic padding probe (all five theorems resist it) carry over unchanged from the previous report.

**Changed passages.** I read every hunk of the diff:
- §2.146 (rewritten), §2.147 (one *Needs:* link added) and §2.148 (rewritten);
- §§2.166 and 2.182 (cone links repointed);
- §§2.236, 2.237, 2.242 and 2.245 (Ile locator).

What I checked in them:
- **Anchors.** No link to the old anchor `#2148-ordinary-completed-tensor-cone` survives. All eight `#2146-…` links and all three `#2148-…` links resolve to the headings at lines 3568 and 3617.
- **Build order.** Every target a changed passage needs comes earlier:
  - §2.146 needs §§2.131 and 2.115;
  - §2.148 needs §§2.146, 2.130, 2.117, 2.115 and 2.77;
  - §2.147 now needs §2.146.
- **The IsLimit statements.** §§2.192 and 2.199 state IsLimit for the C1 cone. Their *Needs:* chains reach §2.146 through §2.173 → §2.164 → §2.147 → §2.146; the link newly added to §2.147 closes this path.
- **§2.166.** It is under C2 with arbitrary N, and it now cites the arbitrary-N cone (§2.146). That is what its "finiteness of N is unnecessary" needs.
- **Diagram.** The cone's diagram `G_N` is the one convention C1 fixes (line 772); it is built in §2.104 (C7, arbitrary N), which §2.146 reaches through §2.131.
- **§2.148's coordinate bullet** is the same formula as §2.130's second API bullet. §2.148 obtains it for the cone components through `P_N,n = eₙ⊗id_N = ρₙ`, so the two statements agree.

**Seeded sample.**
- Three seeded targets lie in the dependency closure of the changed passages: 2.192, 2.203 and 2.253.
  - 2.253: Knudsen II Theorem 2.7 with Figure 4, printed p. 179 (`knudsen2 lines 593–611`). The rigid triangle gives a closed immersion `M̄₁,₁ → M̄₂,₂` whose image is the intersection of four branches of the boundary, with a fifth branch for the boundary of `M̄₁,₁`. That is the statement as written.
  - 2.192 and 2.203: Knudsen II Appendix Proposition 6, printed pp. 194–195 (`knudsen2 lines 1062–1068`), is cited only for the surrounding two-base completion problem; the native limit statements are the roadmap's own deduction, checked in the table.
- 2.116 is a supplier the changed §2.147 cites. It cites the same Proposition 6, and its three Checks hold (table).
- The other eleven seeded targets lie outside the changed passages and their suppliers and dependents. Under the incremental scope I did not re-read them this round: 0.5, 2.6, 2.37, 2.48, 2.138, 2.169, 2.186, 5.17, 6.6, 6.15 and 7.3.

**Library declarations opened at the pin (Mathlib f6090c7).**
- `TensorProduct.piScalarRightHom_tmul` (`Mathlib/LinearAlgebra/TensorProduct/Pi.lean` line 140) states `x ⊗ₜ f ↦ (j ↦ f j • x)`. This is the formula behind `ĉ(σ⊗(1,1/3)) = (σ,(1/3)σ)`.
- `TensorProduct.piScalarRight` (line 163).
- `TensorProduct.map_tmul` and `TensorProduct.map_comp` (`Mathlib/LinearAlgebra/TensorProduct/Map.lean` lines 59 and 104).
- `LinearMap.rTensor` and `rTensor_tmul` (same file, lines 343 and 357).

**Citations and ownership.**
- `citations.md` has one lead, `ModuliDescent.polarizedDescentComparison` (README line 183). It is a target name in AlgebraicModuliForArithmeticGeometry, README line 1842 at that roadmap's open head, and the cited §3.5 is a supplier earlier in the merge order. It is not a library name.
- `overlaps.md` lists no open pull request that changes this roadmap and no dropped or revision-only id.
- `roadmaps grep -i --fixed 'completed tensor cone'` finds the phrase in no other roadmap on main or at the 467 open heads.
- The 28 declared gaps are untouched by the diff and carry over from the previous report.

**Adversarial table.** Rows for every changed statement are computed this round. The other rows are carried forward from the previous report (PRREVIEW-StableReductionPartII~1, at ef1de05) because the diff leaves those statements untouched.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §2.146 API: components `P_N,n = eₙ⊗id`, naturality, Â-linearity | Fixture `A = ℤ`, `γ=δ=s=t=0`, `p = (2)`, `m = 2R`; `N = ℤ₂`, `ℤ₂/(4)`, `ℚ₂`, `0` | `N = ℤ₂`: `P₃(σ⊗1) = (1+2v+4v²)⊗1`, and `τ₂₃` of it is `(1+2v)⊗1 = P₂(σ⊗1)`. `N = ℤ/4`: point `R̂/4R̂ = R/m² = Q₂`, and for `n ≥ 2` the component is the identity of `Q₂ = Qₙ/4Qₙ`. `N = ℚ₂`: every component is 0, point `R̂[1/2] ≠ 0`. `N = 0`: all zero | True for arbitrary N |
| §2.146 Check 1 | `σ⊗1` at levels 3, 2; "mod m" model | `e₃(σ) = 1+2v+4v²`, `e₂(σ) = 1+2v`; `σ ≡ 1 (mod 2R)`, so the wrong model gives `1⊗1` at every level | Correct |
| §2.146 Check 2 | `σ⊗(1/3)` at level 3; the same element in `R̂⊗_ℤ ℤ₂` | `(1/3)(1+2v+4v²) ≡ 3(1+2v+4v²) = 3+6v+12v² ≡ 3+6v+4v² (mod 8)`. But `3(σ⊗(1/3) − (1/3)σ⊗1) = 0` and 3 is invertible on `R̂⊗_ℤ ℤ₂`, so the elements are equal and the wrong model gives the same value. With `α² = −7`, `α ≡ 3 (mod 8)`: same level-3 value, and the difference maps to `−1 ≠ 0` in `ℚ₂⊗_ℚ ℚ₂` after `ℓ⊗id` | Value correct; separating claim false → R01 |
| §2.146 Check 3 | `N = ℤ₂/(4)` | `Q₁/4Q₁ = 𝔽₂[u,v]/(u²)`, `Qₙ/4Qₙ = (ℤ/4)[u,v]/(u²)` for `n ≥ 2`; `P₁(1⊗1̄) = 1⊗1̄ ≠ 0`; `Pₙ(σ⊗1̄) = Σ_{k<n} 2ᵏvᵏ⊗1̄ = (1+2v)⊗1̄` for `n ≥ 2`, since `2ᵏ·1̄ = 0` for `k ≥ 2` | Correct |
| §2.146 Check 4 | `N = ℚ₂` | `2ⁿ` kills `Qₙ` and is invertible on ℚ₂, so `Qₙ⊗ℚ₂ = 0`; `1⊗1 ≠ 0` in `R̂[1/2]` because R̂ has no 2-torsion. Consistent with §2.131 Check 2, §2.192 Check 2 and the finite-projective hypothesis of §2.199 | Correct |
| §2.148 API: identification and coordinate formula | `N = Fin r → Â`, pure tensors | `P_N,n(u⊗z) = eₙ(u)⊗z = ρₙ(u⊗z)`; `cₙ(eₙ(u)⊗z)(k) = z(k)·eₙ(u) = eₙ(z(k)u) = eₙ(ĉ(u⊗z)(k))`, using Â-linearity of `eₙ` (§2.115) | True |
| §2.148 Check 1 | `r = 2`, `x = σ⊗(1,1/3)`, level 2 | `ĉ(x) = (σ,(1/3)σ)`; `e₂(σ) = 1+2v`, `e₂((1/3)σ) = 3+6v ≡ 3+2v (mod 4)` | Correct |
| §2.148 Check 2 | `x = u⊗(0,1)` | `ĉ(x) = (0,u)`; `[u] ≠ 0` in `Q₁ = 𝔽₂[u,v]/(u²)`, hence in every `Qₙ`, `n ≥ 1` | Correct |
| §2.148 Check 3 | `r = 1`, `r = 0` | `e₃(σ) = 1+2v+4v²`, and its transition to level 2 is `1+2v`; `R̂⊗_Â 0 = 0` | Correct |
| §2.147 (link added) | Ordinary cone, `σ⊗(1,1/3)` | `cₙ(P_N,n(u⊗z))(k) = eₙ(z(k)u)`, so the coordinates lift to `σ`, `(1/3)σ` with level-2 values `1+2v`, `3+2v`, agreeing with §2.148 Check 1 | Consistent |
| §2.166 (link repointed) | `f = m(u)`, `a = 1/3`, `m(v)` | `(C_J((1/3)f))₂(v) = [3uv]⊗1` since `1/3 ≡ 3 (mod 4)`; `(C_J(m(v)))₁(u) = [uv]⊗1 ≠ 0` in `𝔽₂[u,v]/(u²)`, `(C_J(m(u)))₁(u) = [u²] = 0` | Correct |
| §2.182 (link added) | `r = 1`, legs = truncations of σ | Legs `a ↦ a·eₙ(σ)⊗1` factor through `a ↦ aσ⊗1`; σ is not a polynomial, so it is not in the image of `R⊗_ℤ ℤ₂ = ℤ₂[u,v]/(u²)` | Correct |
| §2.192 (seeded, dependent) | `N = ℤ₂`, `ℚ₂`, `0` | Truncations of `σ⊗1` lift to `σ⊗1`; for ℚ₂ the diagram is zero, so its limit is 0 while `R̂⊗ℚ₂ = R̂[1/2] ≠ 0`, and ℚ₂ is not finitely generated, so it is no retract of a finite free module | Correct |
| §2.203 (seeded, dependent) | `r = 1`; constant family `1⊗_ℤ(1/3)` | `1/3 − 3 = −8/3 ∈ 4ℤ₂`, so `1⊗_ℤ(1/3) = 3⊗_ℤ1` in `Q₂⊗_ℤ ℤ₂`; `e₂(1/3) = 3`; `(1+2v+⋯)⊗_ℤ1 ↦ σ⊗1` | Correct (and consistent with R01: on the original base 1/3 is visible only as 3) |
| §2.253 (seeded, dependent) | Smooth and nodal F | `dim M̄₂,₂ = 3·2−3+2 = 5`; 5 − 4 fixed parameters = 1 = `dim M̄₁,₁`; nodal F: 5 nodes, 4 fixed, the fifth cuts out the boundary; `knudsen2 lines 609–611` | Matches source |
| §2.116 (supplier of §2.147) | `fₙ = 1+2v+⋯+2ⁿ⁻¹vⁿ⁻¹`; `f₁ = 1`, `f₂ = 0`; constant `u` | Assembles to σ, which has unbounded v-degree and so does not come from R; `τ₁₂(0) = 0 ≠ 1`, so that family is incompatible; constant `u` assembles to the image of u | Correct |
| §§2.236, 2.237, 2.242, 2.245 (locator) | Ile §7 page range | Heading at `ile line 1259` (p. 25), last line at 1349 (p. 26), References at 1352 (p. 27) | → R02 |
| `nodeSection_universallyExact` (carried forward) | arbitrary A; `A = ℤ`, `γ=δ=s=t=0`; `A = 𝔽₂`, `γ = 1`; `A = 0` | `det Φ̃ = q(X,Y) − q(s,t) = F`, which is monic in X, so multiplication by F is injective on `N[X,Y]`; `Φ̃Ψ̃ = F·I`; in the `u² = 0` fixture `Ker Φ̄ = ⟨(v,u),(u,0)⟩ = Im Ψ̄` | True |
| `pointedSection_reflexive` (carried forward) | same fixtures; `A = ℤ/4`, `s = 1` | `J ≅ coker Ψ̄`, `J* = Im Φ̄ᵀ`, evaluation bijective since `Ker Φ̄ = Im Ψ̄`; `ψ(η(v)) = v` | True |
| `pointedSection_universalCoefficients` (carried forward) | arbitrary A, `N = A/I` | Ext groups computed by `(Ψ̄ᵀ,Φ̄ᵀ)⊗N`, which vanish; `Tor₁^A(coker Φ̃, A/I) = 0` since `F mod I` stays monic | True |
| `relativelyStablyReflexive_iff_universalCoefficients` (carried forward) | `A = R = ℤ_(2)`, `M = R/(2)` | Both sides false: for `N = A/(2)`, `0 ≠ ℤ/2`; Ile Definition 3.4 and Remark 3.6 are the two sides | True with the stated hypotheses |
| `relativelyStablyReflexive_iff_completion` (carried forward) | `M = R`; `R/(2)`; `R = ℤ_(2)[x]_(2,x)`, `M = R/(x)` | All true; all false; `Ext¹ = 𝔽₂ ≠ 0` on both sides of the completion | True |
| Other rows carried forward | §§2.1, 2.63, 2.73, 2.90, 2.120, 2.126, 2.132, 2.203 Check, 2.227, the two-ring counterexample, Conventions, Deligne pairing, graded determinant, §§3.1, 3.3, 3.13, 4.2, 5.17, 5.19, 7.1, 7.7 | Values as recorded in the previous report, e.g. discriminants `4, 1, 0` (§2.1); `12·2 = 4 + 20` (§5.19 worked example); `(−1)^{deg L}` symmetry sign | Unchanged statements |

**Headline theorems.** These are unchanged since the previous report:
- The geometric headlines are not statable at the pins, and the module docstring names each one: §§2.248, 5.19, 6.8, 6.11, 6.20, 7.6–7.7.
- The five local headlines are stated: `nodeSection_universallyExact`, `pointedSection_reflexive`, `pointedSection_universalCoefficients`, `relativelyStablyReflexive_iff_universalCoefficients` and `relativelyStablyReflexive_iff_completion`.
- The diff touches neither the headlines nor the Lean file.

## Not verifiable

- `blr-relative-picard-LwkQQl` (Bosch–Lütkebohmert–Raynaud) and `mc6-fc1990` (Faltings–Chai) are settled as uncertified and cited by locator only. They are outside the changed passages.
- I checked ownership against open pull requests only through `roadmaps grep` and `roadmaps overlaps`, at the index of 2026-11-07T16:53:39Z.

## Source issues

- none
