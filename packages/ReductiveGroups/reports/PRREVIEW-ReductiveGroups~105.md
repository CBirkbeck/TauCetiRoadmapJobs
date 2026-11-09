# Review of ReductiveGroups (pull request #1676 at 948dbef)

**Verdict:** accepted

No finding in the folder. The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with ten `sorry` warnings and nothing else, and the ten headline statements hold at their hypotheses (table below). `Suggested.lean` is byte-identical to the head the previous review read; the 201 changed lines are all in `README.md`.

**Previous findings, one by one (review of 7b018ef):**

| Previous | Status at 948dbef | Evidence |
|---|---|---|
| R01 (P2): multiplicative type over a base has two owners, 9D and open #1522 | Folder part repaired; the rest settled | `README.md` lines 85–86 now read "over an arbitrary affine base `S = Spec R`", matching line 3858. The repair's reason for keeping ownership is right: on main (3090489), `TauCetiRoadmap/ReductiveGroups/README.md` lines 1035 and 1047–1048 already own "the center of multiplicative type" and "Extend the field-level subgroup/quotient and multiplicative-type comparisons of Layers 3–4 to these bases". A roadmap on main is earlier than every open one, so narrowing falls to #1522, whose README lines 77–79 already say 9D covers affine bases. Nothing in this folder is left to change |
| R02 (P3): the SL block restates pinned Hopf formulas | Repaired | Lines 3589–3599: "`Δ(x_ij) = Σ_k x_ik ⊗ x_kj` and `ε(x_ij) = δ_ij` are `TauCeti.Comodule.comul_coefficientMatrix_eq_sum` and `TauCeti.Comodule.counit_coefficientMatrix` rewritten by it", the antipode is `map_antipode_coefficientMatrix`, the points are `pointsMulEquiv` and `ofConv_coefficientMatrix`. Only the presentation and the 9B comparison remain targets |
| R03 (P3): the SL block is outside every layer | Repaired | It is now `##### 9B.4 The special linear group` (lines 3582–3640), with a *Needs:* line per target (3609–3610, 3620–3625), four Checks, a supplier-contract bullet (812–834) and Layer 9's Dependencies (3837–3843). *Worked examples* (4741–4756) states no target |
| R04 (P3): Layer 3's pinned inputs absent from the contracts | Repaired | Lines 677–689 name `image`, `imageι`, `faithfullyFlat_imageι` (with `[Algebra.IsGeometricallyReduced k K]`) and `faithfullyFlatDescentMulEquiv` (with `[Module.FaithfullyFlat A B]`); Layer 3's Dependencies (1354–1356) list them |
| R05 (P3): coordination and description | Settled, not re-raised | The description is unchanged. The repair replies on this pull request have answered this item in nine consecutive rounds with the same reason: the description is pull-request text outside the files a repair edits. The reason is correct, so the item is settled for the folder. It stays open for whoever edits the description; the facts are under *Not verifiable* |

## Verified sound

**Gate, build and dependency check.**
- I re-ran the gate with `--base origin/main`: every counter is 0 and it ends `OK`.
- `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/ReductiveGroups/Suggested.lean`: ten `sorry` warnings (lines 139, 156, 173, 193, 215, 236, 259, 279, 441, 479), no other message.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The pins equal main's: Tau Ceti 2fd255d, Mathlib 1b1ccf4.

**Signatures and padding.**
- One scratch file with `#check @name` for 19 declarations elaborates with no error; each type matches its README statement. The file has no `variable` beyond `universe v`, so no binder can be lost.
- One-tactic probe on a scratch copy: each of the ten `sorry`s replaced by `first | rfl | trivial | infer_instance | decide | (simp; done) | (simp_all; done)`. All ten fail, so nothing is padding.
- The worker's library near-matches list no pinned proof of any target. The nearest pinned declarations are weaker and are cited as such: `TauCeti.linearlyReductiveCommHopfAlgProperty_iff_torus_of_isSolvable` (`Solvable/LinearlyReductive.lean:86`, the solvable case of Nagata) and `TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:149`, with two extra containment hypotheses). `exists_leviComplement` in `Algebra/Lie/LeviDecomposition/Solvable.lean:141` is about Lie algebras, a different object from Layer 6A's group-scheme complement.

**Headlines.** The README names ten: quotients by normal subgroups, Milne 22.43, Nagata, Mostow, conjugacy of maximal tori, the Tits system, parabolic Levi, Lang, the plane braid group, Brieskorn. All ten are stated. The module docstring names the missing carrier for each remaining endpoint (Layers 0–1, 7/9D `G/P`, 7c–7f, 9E, 9, 10, 11, 3A.5f).

**Seeded sample.**
- §1.1, jantzen-1985 (printed page = PDF page − 5): §2.8 at line 1100 (p. 36); §2.10 at line 1216 (p. 41); §3.3 at line 1507 (p. 52); §3.9 Proposition (b) and its proof at lines 1688–1703 (p. 60); §4.2 at line 1923 (p. 69); §4.7 Lemma (a) at lines 2001–2004 (p. 73); §4.14 at line 2102 (p. 77); §4.15 at line 2123 (p. 78); the closing remark at lines 2157–2161 (pp. 79–79a). Each supports the statement at the README's generality (a commutative ring, `G` flat).
- §8.1, conrad-rgs Definition 5.1.1, lines 5651–5659, p. 136: nonempty base, `T ≃ D_S(M)` with `M` finite free, constant roots and coroots, root spaces free of rank one. All four are in the README.
- §8.2, conrad-rgs Definition 6.1.1 and Remark 6.1.2, lines 7725–7751, pp. 186–187. The `Spec(k × k)` Check is the remark.
- The README flags no locator as unverified.

**Locators of the changed passages.** conrad-rgs Proposition B.3.4 (lines 11955–11962, pp. 290–291) and Corollary B.3.6 (lines 12055–12062, p. 293: a normal scheme, Zariski-locally isotrivial, isotrivial when irreducible, the `π₁` anti-equivalence). The rewritten sentence at README lines 3916–3918 matches both hypotheses.

**Library declarations opened at the pins (Tau Ceti 2fd255d unless marked).**
- `Algebra/AlgebraicGroup/SpecialLinear/Basic.lean`: `definingHopfIdeal_toIdeal` :92 (span of `det − 1`), `coordinateHopfAlgebra` :121, `coordinateMap` :127, `pointsMulEquiv` :252, `pointsMulEquiv_mapValue` :317, `pointsNatIso` :457.
- `SpecialLinear/StandardComodule.lean`: `coefficientMatrix_basisFun` :97, `map_antipode_coefficientMatrix` :113, `ofConv_coefficientMatrix` :196.
- `Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean`: `counit_coefficientMatrix` :101 (any basis), `comul_coefficientMatrix_eq_sum` :118 (`[Fintype ι]`).
- `SpecialLinear/DiagonalTorus/RootDatum.lean`: `diagonalRootDatum` :108, on `ULift (Fin r) →₀ ℤ` and `ULift (Fin r) → ℤ`, as the contract says.
- `GeneralLinear/Coordinate/HopfAlgebra.lean`: `CoordinateRing` :68 (the determinant localization), `coordinateHopfAlgebra` :452; rank zero and the zero ring included.
- Reductivity of the classical examples: `GeneralLinear/Reductive/Basic.lean:94`, `SpecialLinear/Reductive/Basic.lean:101`, `Symplectic/Reductive/Basic.lean:102` (every field, every rank), `ProjectiveGeneralLinear/Semisimple.lean:61` (every field), `SpecialOrthogonal/Reductive.lean:149` (`[NeZero (2 : k)]`).
- `HopfIdeal/Quotient/Image/Basic.lean` (`image`, `imageι`, over a field, :56–110), `Image/FaithfullyFlat.lean:41` (finite type, `[Algebra.IsGeometricallyReduced k K]`), `FaithfullyFlatDescent.lean:143` (`[Module.FaithfullyFlat A B]`, `R` a commutative semiring).
- `DiagonalizableGroup/Scheme/Basic.lean:289` (`[ConnectedSpace (PrimeSpectrum R)]`), `DiagonalizableGroup/Scheme/MultiplicativeType.lean:77`.
- Mathlib 1b1ccf4: `Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec` (used at `LinearAlgebra/Matrix/SpecialLinearGroup.lean:703`), `IsLocalization.Away` (`RingTheory/Localization/Away/Basic.lean:47`).

**Cross-roadmap citations and ownership.**
- The worker's citation check lists no cross-roadmap citation as missing. Its 18 Lean-name leads are this roadmap's own namespaced declarations, all in `Suggested.lean`, plus `VanishingCycles.lisseMonodromyEquiv`, which is EtaleCohomologyFoundations' name (main README line 213).
- Resolved on main (3090489), 14 citations: EtaleCohomologyFoundations F.0.1 (line 175); SchemeAndStackFoundations §0.9 (848) and §1.13 (2418); ModularCurves 0E; RootSystems §5.1 (907) and §5.2 (944); SmoothBundlesConnections B1.0 and B1.4; DGFloer Layer 1.2; GroebnerGeometry G5 (394); LieGroups Layers 2 (356) and 7 (787); LieHighestWeight Layers 3 (405) and 7 (931); ChevalleyGroups C4 and C6 (72–77); ReductiveGroupsPartII RG2.0.1 (463) and RG2.3.7.
- The overlap check lists no dropped id, no id that only an open revision defines, and no id this pull request drops that others cite.
- Ownership against open pull requests, by `roadmaps show`:
  - #1522 GroupSchemesOverABase (head 2e1e5e7): a consumer. Its README line 233 takes Layer 3 and 9D from here, and lines 77–79 say 9D covers the affine bases. See R01 above.
  - #2114 FlagVarieties (head c2f3de4): a consumer. Its nine `gap:` lines addressed to ReductiveGroups (its README lines 68–84) are its own contracts and name targets this roadmap states in Layers 3, 3A and 7. It owns nothing of this roadmap's.
  - #792 AdelicAlgebraicGroups, #1492 ClassicalGroupsPartII, #1224 SchubertGeometry: consumers, unchanged since the previous review.
- Build order inside 9B: the field comparison in 9B.4 names the bullet *Elementary generators and all ring points*, which follows it in the same subsection. Its *Needs:* line states that dependency, the bullet does not use 9B.4, and Layer 5 and Layer 7 use the same form ("the next item", "Layer 7C"). There is no cycle and no change is asked.

**Adversarial pass.** "✓" means the two sides agree.

| Statement | Instances | Values computed (statement / independent) | Result | Change |
|---|---|---|---|---|
| `isIso_coinvariantsQuotient_of_isNormal` | `μ_p ⊂ μ_{p²}`; `I = ker ε`; `I = 0` | `Δt^j = t^j⊗t^j ≡ t^j⊗1` mod `(t^p−1)` iff `p∣j`: coinvariants `k[t^p]`, `O(G)` free of rank `p` ✓; `(id⊗ε)(Δf − f⊗1) = 0` always, so all of `O(G)` / `N = 1` ✓; `Δf = f⊗1` gives `f = ε(f)`, so `k` / `N = G` ✓ | true | none |
| `linearlyReductive_iff_reductive_identityComponent` | `S₃/ℂ`; `𝔾_a/ℚ`; `ℤ/p` in char `p` | Maschke / `G° = 1` reductive ✓; `[[1,a],[0,1]]` has one stable line, not LR / `R_u = 𝔾_a` ✓; `k[u]/(u^p)` indecomposable / `G° = 1` reductive: excluded by `CharZero` | true | none |
| `linearlyReductive_iff_torus` | `𝔾_m`; `SL₂`; trivial group; `μ_p`; constant `ℤ/ℓ`, `ℓ ≠ p` | yes / yes ✓; `⟨x^p, y^p⟩ ⊂ R_p` uncomplemented / not a torus ✓; yes / rank-0 torus ✓; LR, not a torus: excluded by `hsm`; LR, not a torus: excluded by `hconn` | true | none |
| `exists_levi_complement` | Borel of `GL₂`; `𝔾_a`; `GL₂` | `(a,b,d)·(1,u,1) = (a, au+b, d)`: invariants `k[a^±,d^±]`, `J = (b)`, composite the identity ✓; `I_u = 0`, coinvariants `k`, `J = (t)`, `k → k` ✓; `I_u = ker ε`, coinvariants `O(G)`, `J = 0` ✓ | true | none |
| `exists_conjugate_eq_of_isMaximalTorus` | `GL₂ × μ_p/k̄`; `S₃`; `SL₂/ℝ` | tori lie in `GL₂ × 1`, conjugate under `GL₂(k̄)` ✓; trivial torus, `g = 1` ✓; `SO₂(ℝ)` compact, diagonal unbounded: needs `IsAlgClosed` | true | none |
| `exists_titsSystem_of_isBorel` | `GL₂/𝔽₂`; `𝔾_m` | `|G| = 6`, `|B| = 2`, `N = {1, w}`, `B∩N = 1`, `|BwB| = 4`, `2 + 4 = 6` ✓; `B = N = G`, `S = ∅`, one cell ✓ | true | none |
| `exists_levi_complement_of_isParabolic` | `P = G`; `B ⊂ GL₂/𝔽₂` | radical trivial, `J = 0` ✓; `J = (b)` cuts out `T`, no characteristic used ✓ | true | none |
| `lang_surjective` | `𝔾_m`, `𝔾_a/𝔽₂`; transcendental `K`; constant `C₂` | `g⁻¹F(g) = g^(q−1) = g` onto ✓; `a² − a`, `θ² − θ = 1` ✓; `T^q − T − a` of degree `q ≥ 2` has a root ✓; Lang map `≡ 1` misses a point: excluded by `hconn` | true | none |
| `plane_braid` | `n = 0, 1, 2`; `t = ½, 1` | `Fin (n − 1) = Fin 0`, both groups trivial ✓; `Conf₂ ≅ ℂ × ℂ*`, `ℤ = B₂` ✓; `(½ − i/2, ½ + i/2)`, counterclockwise ✓; `(1, 0)`, the swap ✓ | true | none |
| `nonempty_mulEquiv_artinGroup` | roots `±2`, coroots `±1`; `ι = ∅`; `B₂` at `(1,2)` | `y ↦ −y`, `ℂ*/±1 ≅ ℂ*`, `ℤ` on both sides ✓; `ℂ^κ`, both trivial ✓; values `1, 2, 3, −1`, orbit of 8 points `= |W(B₂)|` ✓ | true | none |
| §1.1 invariants | weight-one line of `μ_p/𝔽_p` | `μ_p(𝔽̄_p) = 1` fixes it / `1⊗t ≠ 1⊗1`, so `Mᴴ = 0` ✓ | true | none |
| §1.1 differential | `ℤ[t^±]`, weight one | `d⁰1 = 1⊗(t−1)`; `d¹ = t⊗(t−1) − (t⊗t − 1⊗1) + (t−1)⊗1 = 0` ✓ | true | none |
| §1.1 injectives | trivial group over `ℤ` | `ℤ` cofree and acyclic / `2ℤ → ℤ`, `2 ↦ 1`, needs `2x = 1`: not injective ✓ | true | none |
| §8.1 split data | `SL₂` and `PGL₂`; `SL₂/𝔽₂`; rank-0 torus | `α = 2ϖ` / `α` generates `X` ✓; centre `𝔽₂[t]/(t−1)²`, length 2 ✓; `X = Y = 0`, trivial group ✓ | true | none |
| §8.2 pinnings | `x_α(2t)/ℚ`; `Spec(k × k)` | tangent `2E₁₂ ≠ E₁₂` ✓; signs `(+,−)`, not a constant `Φ⁺` (conrad-rgs line 7738) ✓ | true | none |
| 9B.4 presentation | `n = 0`; `n = 1`; `n = 2` over `ℤ/4` | empty determinant `1`, relation `0`, `ℤ` on both sides ✓; `x − 1`, `ℤ` ✓; `[[1,1],[0,1]]⁻¹ = [[1,3],[0,1]]`, `S(b) = −b`; wrong sign gives square `[[1,2],[0,1]] ≠ I` ✓ | true | none |
| 9B.4 comparison | `n = 2`; `n = 1` | `ε₁ − ε₂ ≡ 2ε₁` in `ℤ²/ℤ(1,1)`, index 2 ✓; adjoint weights span `ℤΦ`, giving `PGL₂` ✓; `X = 0`, index set of ordered distinct pairs in `Fin 1` empty ✓ | true | none |
| Layer 3 monomorphism route | `μ_p → GL₁`; Frobenius of `𝔾_a` | `k[t^±] → k[t]/(t^p−1)` onto, a closed immersion; source not geometrically reduced, so the pinned lemma does not apply, as the contract says ✓; kernel `α_p ≠ 1`, neither ✓ | true | none |
| 9D B.3.4/B.3.6 | `Spec ℤ`; `x² + y² = 1` over `ℤ[½]`; `𝔽₅` | `π₁ = 1`, split ✓; `Gal(ℚ(i)/ℚ)` acts by `−1` on `X* = ℤ` ✓; `−1 = 2²`, closed fibre split ✓ | true | none |
| 9D subgroup negative control | `V(t²−1, 2(t−1)) ⊂ 𝔾_m/ℤ` | `2(uv−1) = 2u(v−1) + 2(u−1)` ✓; `ℤ[s]/(s², 2s)` has 2-torsion, not flat ✓ | true | none |
| 9B.1 chart | `SL₂`; `SL₂(ℤ/4)`; `[[2,1],[3,2]]/ℤ` | lower-right `(1+bc)/a = d` ✓; order `64·¾ = 48` ✓; neither `2` nor `3` a unit ✓ | true | none |

## Not verifiable

- brieskorn-1971, "Satz, p. 57": the GDZ copy is an image-only scan and OCR is not available on this worker. The restatement in the Bourbaki exposé 401, Proposition 1, p. 25 (brieskorn line 98) was checked in the previous round and the README cites both.
- Settled as uncertified, cited by locator, not read: kohls, waterhouse, borel, springer.
- Paywalled or not cached, not read: Conrad–Gabber–Prasad 2nd ed.; Jantzen 2003, Part II §§3.18–3.19; Howlett–Lehrer; Dipper–Du; Carter; Lang 1956; Steinberg 1968; Serre; Gassmann; SGA 3 XIX.
- The manifest key `milne-iag` points to the 2015 v2.00 notes, whose numbering differs. The Milne locators were checked in the cached 2017 author copy, the edition the README cites; none changed in this head.
- Cached, outside the sample and untouched by this change, not re-read this round: dudas-michel, riche, gros-kaneda, frenkel-kac, heden, salvetti, callegaro, birman-brendle, fox-neuwirth, fadell-neuwirth, arzhantsev, ernst, fang-lim-tan, sga1, conrad-adelic, mcninch, conrad-feng.
- The pull-request description (the settled R05), outside the folder. For whoever edits it before the merge:
  - "Existing roadmap bytes are preserved" is false: against main the branch rewrites `README.md` and `Suggested.lean` and deletes seven `*Targets.lean` files.
  - The overlap check reports that #1332, #1797, #1807, #1808 and #1854 conflict with this head in this folder, and no order is stated.
  - Consumers that still claim ownership at their heads: ReductiveGroupsPartII RG2.3.7 (Lang), LieGroups Layer 7 (the lower analytic dictionary), ChevalleyGroups C4 and C6, AdelicAlgebraicGroups AA.3.1, GroupSchemesOverABase §§2.1–2.5.

## Source issues

- **Error** in milne-iag (2017 edition) at Remark 12.56, p. 249: the source says an algebraic group in characteristic `p` is linearly reductive iff `G°` is a torus and `p` does not divide the index; it should say `G°` is of multiplicative type (`μ_p` is linearly reductive, not a torus); affects nothing; corrected in print at the author's 2022 revision, Remark 12.56.
