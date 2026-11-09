# Review of ArithmeticStatisticsPartII (pull request #1173 at d0a1680)

**Verdict:** needs changes

🤖 Independent AI review, incremental re-review of the 123 lines changed since 30098d6. All five findings of the previous review are repaired, the gate passes, and the two new `Suggested.lean` theorems and the new §1.12 target survive the computed checks below. One finding remains: a page range in the locator of the new §1.12 target.

## R01 (P3) — The proof of Theorem 4.2 ends on p. 22, not p. 21

Location: `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md:1882`, “§4.2, the definition of specialness, its two listed properties and Theorem 4.2, p.20, with proof pp.20–21.”

Claim: the locator of **Special integral representatives** gives pp. 20–21 for the proof of [16], Theorem 4.2. In arXiv v1, the version the reference list cites, the proof runs onto p. 22. The steps on that page are the ones the README's proof sketch ends with: the divisibility of the upper-left block of A and the explicit rational element that moves the pair to a special one.

Witness: ref-16 line 983 opens the proof on p. 20; line 1077 is the printed folio 21, line 1078 the marker of page 22; the proof closes at line 1134, after display (33).

Repair: write “with proof pp.20–22”. Tested against the same lines: the proof's first line (983) is on p. 20 and its last (1134) on p. 22.

## Previous findings

- R01 — repaired: `Suggested.lean:229` states `orbit_bijection_embedding` with `veroneseA`, `veroneseB` (:212, :218); the docstring's false §1.8 sentence is gone, and `fibre_card_le` (:243) is stated too. README §1.8 names all four.
- R02 — repaired: `README.md:11` now says “The Delone–Faddeev parametrization of cubic rings is AnalyticNumberTheoryPartII §5.5's equivalence between projective binary cubic forms and locally free cubic algebras, specialized to free modules over a PID or a local ring.”
- R03 — repaired: the description's `**Depends on**` list has eight entries, none of them #1930, and the merge-order chain runs “… → #1272 → #1171 → this pull request” with no QuadraticFormsOverABase.
- R04 — repaired: the loose monicization paragraph is now the titled target **Special integral representatives** (`README.md:1867–1889`) with statement, `*Needs:*`, locator keyed [16] and four Checks; the quintic paragraph is deleted. The repair introduced R01 above.
- R05 — repaired: `README.md:819` reads `Z^3 - pZ^2 + qZ - r^2` and `h(Z^2) = -h_1(Z) h_1(-Z)`, :1139 `(X,Y,Z)=(x+ξ·y,η·y−z,y)`, :1155 `(X_0 : Y_0 : Z_0)`. The reverse slips `ℤ/p²Z` and `ℤ/pZ` (:221, :1513, :1549) are fixed as well.

## Verified sound

**Gate** (independent rerun on this head, with the build):

```text
gate ArithmeticStatisticsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check** (the brief's command, real order, `--movable`): `depcheck: 236 roadmaps, 2274 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The diff against main outside the folder is empty, and the worktree is clean.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` gives exactly nine `sorry` warnings (lines 152, 162, 173, 180, 189, 198, 205, 229, 243) and nothing else. The 22 earlier declarations are textually unchanged since 30098d6. `#check @` on the four new ones, compared with README §1.8:
- `veroneseA : MvPolynomial (Fin 3) ℤ` and `veroneseB : (Fin 5 → ℤ) → MvPolynomial (Fin 3) ℤ` match `README.md:1229`.
- `orbit_bijection_embedding` quantifies over `GL₂(ℤ)` on the left and `SL₃(ℤ) × ℤ` on the right, as in `README.md:1291–1295`.
- `fibre_card_le` carries all five hypotheses of `README.md:1317`: the bound N over every `Cubic ℤ` of nonzero `discr`, `4I(f₀)³ − J(f₀)² ≠ 0`, orbit membership, and pairwise inequivalence. No binder is lost.

**One-tactic probes.** `first | rfl | simp | infer_instance | decide | trivial | (constructor <;> simp) | aesop` leaves unsolved goals on both new theorems. Neither is padding, and the two definitions are needed to state them.

**Adversarial table.** Rows for changed statements are computed this round; the rest are carried from the previous report.

| Statement | Instances and computed values | Result |
|---|---|---|
| `orbit_bijection_embedding`, forward | 300 random `(γ, f)`, γ ∈ GL₂(ℤ) with entries in [−3,3]: `det Sym²(γ) = det(γ)³`; `M = det(γ)Sym²(γ)` has determinant 1 and fixes `A₁`; `B_{f∘γ} − B_f∘M = r A₁` with r an integer in every case. | Holds |
| `orbit_bijection_embedding`, converse | All matrices in SL₃(ℤ) with entries in [−2,2] fixing `A₁`: 20 found, 20 of the form `det(γ)Sym²(γ)`, 0 others. Restricting `B_g = rA₁ + B_f∘M` to the conic then gives `g = f∘γ`. | Holds |
| §1.8 column-convention Check | `γ = (1 1; 0 1)`, `M = (1 2 1; 0 1 1; 0 0 1)`: `A₁∘M = A₁`; `B_{(1,4,6,4,1)} − B_{x⁴}∘M = 2x₂² − 2x₁x₃ = −2A₁`, so `r = −2`; the `x₁x₃`-coefficient of `B_{x⁴}∘M` is 2. | Holds |
| §1.8 swap and uniqueness Checks | `−Sym²(0 1; 1 0)` has determinant +1 and fixes `A₁`. `B_g` has no `x₁x₃` term, so r is minus that coefficient of `B_f∘M`; `f = g = 0` forces `r = 0`. | Hold |
| `fibre_card_le` | Resolvent `4Det(A₁x − B_f y)` on 300 random f: leading coefficient 1 and `27·Cubic.discr = 4I³ − J²`, so `hN` applies when `hf₀` holds; `4Det(A₁) = 1`. Same first row `(p, q)`: second rows differ by `±1` and a multiple of the first, giving f or −f up to `F_{ℤ,1} × SO(A₁,ℤ)`, hence at most 2 classes per solution. `x³+y³ = 1` has (1,0) and (0,1) with discriminant −27, so `hN` forces N ≥ 2 and `s = {f₀}` is consistent. | Holds |
| §1.8 sign Check | `f = x³y + xy³ + y⁴`: I = −3, J = −27, `4I³ − J² = −837 ≠ 0`, `J(−f) = 27`. `(A₁, −B_f)` is the image under `(diag(1,−1), 1)`. | Holds |
| `MvPolynomial.linearSubst` contract | Pinned definition is `aeval fun i ↦ ∑ j, C (M i j) * X j`; `linearSubst_mul` reads `linearSubst (M * N) = (linearSubst N).comp (linearSubst M)`, a right action, as `README.md:45` says. | Holds |
| §1.12 specialness, bullets 1–3 | 200 trials: `diag(1,a,a,a)` and `diag(a,a²,0,a)` stay special at a after `B + aC` and `gBgᵀ` (a ∈ {2,3,4,6,9,12}). 100 trials: `uuᵀ + aC` is special at squarefree a. 100 trials: `M³ − e₁M² + e₂M = e₃ − adj M` and `M² − tr(M)M = −Σ` of 2×2 minors, so `a·p₂` and `−a²·p₃` are combinations of minors. | Hold |
| §1.12 specialness Checks | p = 5: `diag(1,p,p,p)` minor gcds (5, 25, 125), special at p, not at p²; `diag(1,p²,p²,p²)` gives (25, 625, 15625) = (p², p⁴, p⁶); `diag(1,1,0,0)` gives 2×2 gcd 1. Antidiagonal A: `det A = 1`, `(A⁻¹B)² = 0`, `det(xA+yB) = x⁴` (values 1, 1, 16 at (1,1), (1,2), (2,1)), so the pair arises for `3x⁴`. | Hold |
| §1.12 local existence, factor 3 | For that pair, `3B = diag(3,3,0,0)` has minor gcds (9, 0, 0) and is special at 3, so the Check and the theorem agree. `f(x,3y)` has coefficients `fᵢ3ⁱ`, with monicization `f^mon(x,3y)`. | Holds |
| R05 passages | Carried: `U∘M₀` with Z reproduces the projection formula (previous report, §1.7 row). | Hold |
| All other statements | Unchanged since 30098d6; rows carried from the previous report (field-level headlines brute-forced over 𝔽₅, 𝔽₇, 𝔽₁₁ with 0 violations; §§1.1–1.7, 1.9–1.16 rows). | Hold |

**Sources sample, changed passages.** ref-16 is arXiv v1 (line 5), the version cited at `README.md:2196`.
- §1.3, p. 5 (lines 216–218): special at a squarefree a means rank at most one modulo each prime factor.
- §2.4, pp. 9–10: monicization and demonicization (lines 411–415), Theorem 2.3 conditions (a) and (b) (lines 433–438), “arises for” (line 447), congruence modulo `f₀^{n−1}`, that is `a³` for quartics (lines 452–453), invariance under `(SL_n/μ₂)(R)` (line 480).
- §4.2, p. 20: the definition for `i ∈ {2,3,4}` with modulus `a^{i−1}` and both listed properties (lines 973–976); Theorem 4.2 with the factor 3 and the rational orbit (lines 980–982); the five Jordan shapes, one for odd p and four more at p = 2 (lines 1003–1044).
- The separability hypothesis in the README's local existence bullet is the standing assumption of §2.4 (line 404), where “arises for” is defined.

Every statement and hypothesis matches. The one page range that does not is R01. The other fourteen seeded targets are untouched; their locators were verified in the previous report.

**Library declarations opened at the pins** (4): Tau Ceti `TauCeti/RingTheory/MvPolynomial/LinearSubst.lean`: `linearSubst` :74, `linearSubst_one` :205, `linearSubst_mul` :210; Mathlib `Cubic.discr` (the standard `b²c² − 4ac³ − 4b³d − 27a²d² + 18abcd`, used in the resolvent computation above).

**Ownership and citations.** `roadmaps grep` finds “special at” (in this sense), “Special integral representatives”, `veroneseA` and `veroneseB` only in this roadmap, so no open roadmap or roadmap on main owns them. The new `*Needs:*` lines cite §1.12 targets of this roadmap, ArithmeticStatisticsPartI §0.22 “Symmetric pencil” (resolved in the previous report) and Mathlib names. The citation resolver lists no cross-roadmap citation as missing; its 22 Lean-name leads are this roadmap's own declarations, all present in `Suggested.lean`. The overlap report lists no dropped id and no conflicting head.

## Not verifiable

- ref-17 (O'Dorney) and ref-5 (Gan–Gross–Savin): unchanged from the previous report; no passage citing them changed.
- A `sorry` build checks elaboration, not truth. The converse of the orbit bijection was tested only on matrices with entries in [−2,2]; in general it rests on the README target **Special orthogonal group of the veronese form**.

## Source issues

- none
