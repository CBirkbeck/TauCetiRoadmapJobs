# Review of SchemeAndStackFoundations (pull request #1276 at bf48be7)

**Verdict:** needs changes

This is a full review, because the folder changed by 255 lines since `8792e09`.

- **Previous review (r73).** Three of its five findings are repaired at this head: R03, R04 and R05. Its R01 and R02 are not repaired. Both are steps for the worker or a human, not for a folder repair, so they are carried as R01 and R02.
- **This round.** The new §2.18 gluing statements in `Suggested.lean` are correct against Stacks 0D66 and 0D6C. The seeded sample found three locators that cover only part of their statement (R03). Four instances have no docstring (R04).
- **Blocking.** The only blocking finding is R01.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`, where most of the README's Tau Ceti citations do not exist

Re-raised: H01. The repair report is right that a folder repair cannot merge `origin/main`. That does not settle the finding: the citations fail at the pin this review must check, and another folder-repair round cannot fix them. The remaining step is the worker's merge, or a human's.

- **Location.**
  - `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`.
  - `README.md:427` says "**From Mathlib** (`1b1ccf4b`)" and `:468` says "**From Tau Ceti** (`2fd255d9`)".
  - `Suggested.lean:119` still has `def Ring.IsJapanese`, restating the definition Tau Ceti has at `2fd255d9`.
- **Claim.** The README names 81 distinct `TauCeti/….lean` files. 60 of them are absent at `358314d4`, so those citations do not resolve at the branch pin.
- **Witness.**
  - 80 of the 81 files open at `2fd255d9`. The 81st, `Cohomology/FormalFunctions.lean`, is §4.9's planned home.
  - New this round: `README.md:474` cites `TauCeti/AlgebraicGeometry/Modules/Restriction/Basic.lean`. At `358314d4` that file is `Modules/Restriction.lean`. At `2fd255d9`, `Restriction/Basic.lean:49` and `:65` are `restrictFunctorIsRightAdjoint` and `restrictFunctorAdditive`.
- **Repair.**
  1. The worker merges `origin/main`. `git merge-tree --write-tree HEAD origin/main` exits 0 at `f8836c48`.
  2. A folder repair then replaces the restated definitions with Tau Ceti's, as set out in r73's R01. `PseudoCoherence.IsPseudoCoherentModule` and `Proetale.IsReplete` stay as aliases, because `AdicEtaleGeometry` and `EnhancedDerivedSheaves` on main open them by name.
- **Tested.** The new `Coherent.derivedRestrict` needs no change at the merge: its import `TauCeti.AlgebraicGeometry.Modules.Quasicoherent.Kernels` exists at both pins and re-exports the restriction instances at both (`Kernels.lean:11`).

## R02 (P3) — The description still describes a §4.10A this head lacks and states no order with the four conflicting heads

Re-raised: H02. The description is pull-request text, which a repair may not edit, and it is unchanged.

- **Location.** `scratch/pull-request.md` contains "New section 4.10A constructs that scheme …" and "This README-only addition changes no Lean declarations".
- **Witness.**
  - `grep -c '4\.10A' README.md` returns 0.
  - This round alone adds four declarations to `Suggested.lean` (`:593`–`:671`).
  - `scratch/overlaps.md` lists #1656, #1807, #1808 and #1854 as conflicting with this head.
- **Repair.** Post the replacement description and merge order already drafted in the r72 repair report. No file change is needed.

## R03 (P3) — Three locators in the seeded sample cover only part of the statement they are attached to

**(a) §0.8, `generic_fibre_spreading` and `fibre_locus_constructible`.**

- **Location.** `README.md:948–952`: "geometrically reduced (irreducible, integral, connected, normal, smooth) … (Stacks, Lemmas 37.26.2 (0576), 37.26.4 (0578), 37.26.5 (0579))".
- **Claim.** The three lemmas treat only geometrically reduced fibres. The other five properties have no locator.
- **Witness.** Stacks book p. 3251–3252: §37.26 is "Reduced fibres"; 0578 and 0579 conclude "geometrically reduced" only.
- **Repair.** Replace the parenthesis with: "geometrically reduced: Stacks, Lemmas 37.26.4 (0578), 37.26.5 (0579); irreducible: Lemmas 37.27.5 (0559), 37.27.7 (055B) with `n = 1`; connected: Lemmas 37.28.4 (055G), 37.28.6 (055I) with `n = 1`; integral: EGA IV₃, Theorem 9.7.7 (iv), p. 79; normal and smooth: EGA IV₃, Proposition 9.9.4 (i), (iii), p. 93, and Corollary 9.9.5, p. 94".
- **Tested.** 0559 (p. 3255), 055B (p. 3258), 055G (p. 3260) and 055I (p. 3261) state these cases. `ega-iv-3` lines 3109–3115 list (i)–(iv) of 9.7.7, and lines 3714–3722 and 3744–3746 give 9.9.4 and 9.9.5.

**(b) §0.20, the Nagata permanence list.**

- **Location.** `README.md:1427–1428`: "finite algebras, quotients, fields and localisations of Nagata rings are Nagata (… Lemma 10.162.6 (032U))".
- **Witness.** 032U (p. 882) is the localisation statement only. Finite algebras are Lemma 10.162.5 (032T), on the same page.
- **Repair.** Write "finite algebras by Lemma 10.162.5 (032T), localisations by Lemma 10.162.6 (032U)".

**(c) §0.25, `pfp_characterisations`.**

- **Location.** `README.md:1732–1733`: "every pfp morphism of affine perfect schemes is a cofiltered limit of finitely presented ones (Bhatt–Scholze 2017, Proposition 3.11, p. 12)".
- **Claim.** Proposition 3.11 does not state this. Its condition (iii) is a criterion on maps out of cofiltered limits.
- **Witness.** `bhatt-scholze-2017` lines 529–538: (i) and (ii) are the affine-local conditions; (iii) is bijectivity of `colim Hom_Y(Z_i, X) → Hom_Y(lim Z_i, X)`.
- **Repair.** Replace the clause with: "and `f : X → Y` is pfp iff `colim Hom_Y(Z_i, X) → Hom_Y(lim Z_i, X)` is bijective for every cofiltered system `{Z_i}` in `Perf/Y` with affine transition maps (Bhatt–Scholze 2017, Proposition 3.11 (i)–(iii), p. 12)".
- **Tested.** On the README's own non-example `X = Spec 𝔽_p[x_1, x_2, …]^perf`, take `Z_i = Spec 𝔽_p[x_1, …, x_i]^perf`. The identity of `X = lim Z_i` factors through no `Z_i`, since `x_{i+1}` is not in the image of `A_i → A`. The criterion rejects it, as the Check requires.

## R04 (P3) — Four instances in `Suggested.lean` have no docstring

- **Location.** `Suggested.lean:564` (`instHasDerivedCategoryModules`), `:573` (the `Category` instance on `DQCoh X`), `:753` and `:1219` (two anonymous instances).
- **Claim.** The Lean form rule asks for a docstring on every declaration. These four have none; the sibling `instHasDerivedCategoryModuleCat` at `:577` has one.
- **Witness.** A scan for declaration keywords whose preceding line does not end a docstring returns exactly these four lines.
- **Repair.** Add a one-sentence docstring to each. For `:564`: "The standard derived category of `O_X`-modules, the ambient category of §2.18."

## Previous findings (r73)

- **R01 — not repaired.** The manifest still pins `358314d4`. Carried as R01.
- **R02 — not repaired.** The description is unchanged. Carried as R02.
- **R03 — repaired.** `README.md:7548–7559` now gives rank 3 "in every characteristic", with the Legendre curve over an algebraic closure of `𝔽_p(t)`, and rank 4 for an ordinary curve "exactly when `j(E) ∈ 𝔽̄_p`". I recomputed `y² = x³ + x`: `j = 1728`, ordinary for `p ≡ 1 mod 4` and supersingular for `p ≡ 3 mod 4`.
- **R04 — repaired.**
  - `README.md:4224–4236` cites 48.17.9 (e) (0B6U), 48.15.7 (0BRT), 48.29.2 (0E9Z), 37.62.4 (069H), 48.17.11 (1) (0B6V), 48.25.4 (0C06), 48.21.7 (0BV8) and 48.23.4 (0C10).
  - Each statement is at the page given: pp. 4129, 4119, 4158, 3365, 4130, 4146, 4140, 4144.
  - 0B6U assumes `f` perfect "(e.g., flat)", which covers both uses.
- **R05 — repaired.**
  - `README.md:7787–7790` names the author manuscript and its pagination 1–99.
  - `:3228–3229` now cites "§3.1.1, p. 35"; `kisin-2017` lines 1588–1592 (p. 35) are the passage from `k'/k`-gerbs to Galois gerbs.

## Verified sound

### Gate, dependency check, build

- **Gate.** The worker's gate reports every counter 0 and `OK`. My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 and `OK`, and exited 0.
- **Dependency check.** The output of `gate --depcheck … --movable --pr 1276`, verbatim:

  ```text
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

  It exited 0, with no UPWARD, CYCLE or `moved:` line.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean <abs>/Suggested.lean` exited 0 in 81 s, with 47 "declaration uses `sorry`" warnings and nothing else. The file has 47 `sorry`.
- **Padding probe.** I made a scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide`. It fails at all 47 positions, 47 errors on 47 distinct lines, so no theorem closes in one tactic.
- **Signatures.** `scratch/signatures.md` reports 0 lost binders in 120 declarations. I read the four new declarations against README §2.18:
  - `derivedRestrict` and `derivedRestrictComp` have real bodies on Mathlib's `Functor.mapDerivedCategory` and `mapDerivedCategoryCompIso`.
  - `derivedHom_isSheaf` carries `Opens.IsBasis B`, as the README's "open basis".
  - `derivedObject_gluing` carries the cover hypothesis `hcov` and the intersection hypothesis `hint`, as the README's "covers `X`" and "each `U ∩ V` … covered by members of `B`".
- **Direction of the comparison maps.** In `derivedHom_isSheaf`, `(derivedRestrictComp …).hom.app K : (K|_U)|_V ⟶ K|_V` and `.inv.app L : L|_V ⟶ (L|_U)|_V`, so both sides of the compatibility equation are maps `(K|_U)|_V ⟶ (L|_U)|_V`. In `derivedObject_gluing`, the cocycle composes `K_U|_W ≅ (K_U|_V)|_W ≅ K_V|_W ≅ K_W`, which is `ρ^U_W = ρ^V_W ∘ ρ^U_V|_W`.
- **Headlines.**
  - §2.18's gluing theorems moved from the "not statable" list to stated theorems.
  - The other statable end theorems are stated as at r73: Artin's bootstrap, Grothendieck existence and algebraization, both de Jong theorems, Hodge index, the Weil bound.
  - The module docstring names the rest with the missing carrier: §5.7, §1.23, §2.19–§2.20, §2.22, §3.6, §4.4, §5.8. Its §3.6 bullet is now true at both pins.

### Seeded locators

All Stacks items were checked in the cached book (book.pdf, 7654 pages), at statement number and page.

- **§0.2.** 01LX (27.4.6), 01T2, 01TQ, 01S7, 02K8, 01WI, 01QO, 01SB (29.11.7). At `2fd255d9`: `RelativeSpec/Basic.lean:462`, `Unit.lean:179`, `MorphismProperties.lean:69/82/94/120/132`.
- **§0.8.**
  - 0AUW (15.22.11, p. 1244), 038F, 01UA, 004Z, 054L (29.37.21), 04KV, 056T, 033N, 057G, 055U (37.38.5–37.38.6, pp. 3288–3289).
  - `ega-iv-3` line 7512: Théorème 12.2.4 is on p. 183, with (v) geometrically reduced and (viii) geometrically integral.
  - See R03 (a).
- **§0.20.**
  - 032F, 032R, 032M, 032N, 032G, 0333, 032O, 032U, 032V, 0334 (10.162.15, items (1)–(3)), 0AVK, 032W, 032I, 03GH, 09E1, 07QV, 0335, 032S.
  - At `2fd255d9`: `Japanese.lean:118/125/148/205/221/228/320/359/375/629`, `UniversallyJapanese.lean:67/112/117`, `Nagata.lean:65/76/86/97/109/124/171/178`, `IntegralClosure/MvPolynomial.lean:82`, `Normalization/Finite.lean:120`.
  - See R03 (b).
- **§0.25.**
  - `bhatt-scholze-2017`: Definition 3.10 and footnote 6 (p. 12), Proposition 3.13 and Definition 3.14 (p. 13).
  - `zhu-2017` line 2439: Proposition A.20 (p. 51). It is stated for spaces pfp over a perfect field. The README's wider form holds: a separated finitely presented model is universally closed iff the existence part of the valuative criterion holds, and a valuation ring's perfection is a valuation ring dominating it.
  - See R03 (c).
- **§1.4, §1.8.** 025Y (65.6.1, p. 5271), 03MJ, 04RD (67.22.1–67.22.2), 025W (65.5.10), 02X0, 02X2 (65.7.1, 65.7.3).
- **§1.15.**
  - 04TW, 04TY (78.9.1, 78.9.3), 022U (Example 39.5.1), 03P8 (59.24.1), 04SK (80.11.1).
  - Poonen, author's online version: Warning 5.12.6, Proposition 5.12.14, Example 6.5.5, Proposition 6.5.9, Theorem 6.5.10 (i), Remark 6.5.11.
- **§1.17.**
  - 048E, 048J, 048Q (83.5.4), 048T (83.5.6), 049Y (83.5.17), 04AA, 04AE, 04S6 (80.10.1), 04SK, 06PG, 06PH, 0BRH (15.112.7), §39.23.
  - Rydh, 2012-05-04 manuscript: Proposition (3.8) p. 13, Definition (3.17) p. 18, Lemma (4.3) and Theorem (4.4) p. 20, Proposition (4.7) with (B′) pp. 20–21, Remark (4.9)(4) p. 22.
- **§2.14.**
  - `morel-voevodsky` (printed page = PDF page + 43): Proposition 1.8 (pp. 98–99), Proposition 1.9 and Example 1.10 (p. 99), Definitions 1.12–1.13 and Proposition 1.16 (p. 100), Lemmas 1.17–1.18 (p. 101).
  - Voevodsky, arXiv:0805.4578v1: Theorem 3.2, Definition 3.3, Lemma 3.5.
- **§2.18 (changed).** 0D66 (20.45.2 (2), p. 1896), 0D67 (Situation 20.45.3, p. 1896), 0D68, 0D6C (Theorem 20.45.8, p. 1899: cover, intersection and negative self-Ext hypotheses).
- **§2.19.**
  - 0A9E, 0A9I (Stacks states `i ≤ c ⇒ i ≤ c − N`, equivalent to the README's strict form), 0B6I, 0FWI, 0E9U, 0AU0, 0AA1, 0DA7, 0A9W, and the eight tags listed under r73's R04 above.
  - Nayak, arXiv:math/0406501v1: §2.1 [A]–[D] and Theorem 2.2.4. Block–Holstein–Wei, arXiv:1511.08659v3: Corollary 3.
- **§3.3.**
  - 0AYR (33.44.1), 0AYS, 0AYX, 0DJ5, 0AYY, 0B59, 0AYZ (33.44.11), 0BUG (7), 0BS2, 0BS3 (3)–(4), 0BS4, 0C1A.
  - At `2fd255d9`: `VectorBundle/Degree.lean:82/102/116/132/150/168`, `FixedRank.lean:106`, `Geometrically/GlobalSections.lean:99`.
- **§3.6.** 0BA0 (44.6.7 (1), p. 3930), 0C1A (p. 4447); `milne-av` III Remark 1.4 (p. 86), Theorem 1.6 (p. 88), Remark 1.11 and Propositions 1.13–1.14 (p. 90); `poonen-stoll-1999` §8 (p. 1126); `bhargava-gross-wang-2017` Proposition 21 (p. 10).
- **§5.2, §5.5.** Sections 42.12 (02R3), 42.14 (02RA), 42.15 (02RF), 42.19 (02RV, with Lemma 42.19.3 the localisation sequence), 42.20 (02S0), 42.29 (02T7), 42.41 (0AZ0), 42.54 (0FBI), 42.59 (0FEZ); 02TY (42.36.3), 063J (31.22.1), 0FF2, 0FF3.

### Library declarations opened

- **Branch pin (`358314d4`, Mathlib `f6090c70`).** `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:416/428` (`restrictAdjunction`, the `IsLeftAdjoint` instance), `Algebra/Homology/DerivedCategory/ExactFunctor.lean:43/223`, `AlgebraicGeometry/Restrict.lean:245/256` (`homOfLE_ι`, `homOfLE_homOfLE`).
- **Main pin (`2fd255d9`, Mathlib `1b1ccf4b`).** The same Mathlib declarations (`Sheaf.lean:414/426`), `Modules/Restriction/Basic.lean:49/65`, and the 47 Tau Ceti lines listed under the seeded locators.
- **Duplication.** Neither pin has a derived restriction functor or a gluing theorem for derived objects: `grep mapDerivedCategory` in Tau Ceti `2fd255d9` finds only `Algebra/Homology/DerivedCategory/` files, none on schemes. Neither pin proves a complete Noetherian local ring is Nagata (`grep IsAdicComplete` in the three Nagata and Japanese files is empty), so the two §0.20 theorems stand.

### Cross-roadmap citations and ownership

- `scratch/citations.md` lists no cross-roadmap citation that resolves nowhere. Its Lean-name leads are this roadmap's own names.
- `scratch/overlaps.md` lists no dropped id in either direction. The four conflicting heads are covered by R02.
- `roadmaps grep '0D6C|0D66|BBD gluing|derivedObject_gluing|derivedHom_isSheaf|derivedRestrict'` returns only this pull request. No second owner of the gluing theorems was found.

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `derivedHom_isSheaf` | `K = L = O_X[0]`; `K = O`, `L = O[1]` on `𝔸² ∖ 0` | `Hom(O_U, O_U[i]) = H^i(U, O) = 0` for `i < 0`, Hom sheaf `O_X`; `Hom(K, L[−1]) = H⁰(O) ≠ 0`, and `U ↦ H¹(U, O)` is 0 on affines but `∋ x⁻¹y⁻¹` globally | Pass: the Ext hypothesis is needed |
| `derivedObject_gluing` | `ℙ¹`, `K_U = O(−2)[1]\|_U`; `B = ∅`, `X = ∅`; `K = O ⊕ O[1]` | self-`Ext^i = H^i(U, O) = 0` for `i < 0`, glues to `Ω¹[1]`; `D(O_∅) = 0`, unique solution; `Hom(K, K[−1]) ⊇ Hom(O, O) ≠ 0`, excluded by `hExt` | Pass |
| `derivedRestrict` Checks | `Spec ℤ`, `U = D(2)` | `(ℤ/2)~ ↦ 0`; `[O →(·2) O]`: `H¹ = (ℤ/2)~`, restricts to 0 | Pass |
| §0.2 `relativeSpec_modulesEquiv` | `S = Spec k`, `A = k[t]`, `F = O` | `p^*p_*F = A ⊗_k A`, kernel `∋ t⊗1 − 1⊗t ≠ 0` / over `p^*A`: `A` | Pass |
| §0.8 `flat_over_dedekind` | `k[t,x]/(tx)`; `k[t,x]/(x², tx)`; `S = Spec k` | `t·x = 0`: not flat, `V(t)` not dominant; `t·x = 0`: not flat, not reduced; over a field all flat | Pass: both hypotheses needed |
| §0.8 `quasi_sections` | generic point of `𝔸¹_k`; point with `κ = L` separable | `κ = k(t)`, not closed in fibre, excluded; section over `Spec L` | Pass |
| §0.20 Checks | `R_r = k[t_i², t_i³]_{i ≤ r}`; countable case | `T_r` generated by `2^r` monomials (`r = 1`: `{1, t_1}`); `t_j ∉ k[t_j², t_j³]`, no finite generating set | Pass |
| §0.25 pfp | `𝔽_p[t]^perf`; `𝔽_p[x_1, x_2, …]^perf` | model `𝔽_p[t]`; infinite transcendence degree, no model | Pass; R03 (c) |
| §1.8 chart products | `F = G = H = Spec k`, `W = Spec k ⊔ Spec k` | `U ×_W V = ∅` / `U ×_H V = Spec k` | Pass |
| §1.15 torsors | `μ_p` over `𝔾_m`; `μ_2/ℚ` | generic fibre `k(t)[s]/(s^p − t)` purely inseparable, not étale-locally trivial; classes `ℚ^×/(ℚ^×)²` | Pass |
| §1.17 `finiteGroupQuotient_projective` | `ℤ/2` on `ℙ¹_ℤ`, `x ↦ −x`; swap on `ℙ¹ × ℙ¹` | invariants of `O(2k)`: forms in `x², y²`, `N = 1`, fibre at 2 is Frobenius; `H⁰(O(2k,2k))^{S_2} = H⁰(ℙ², O(2k))`, `L_Q = O(2)` | Pass |
| §1.17 `IsGeometricQuotient` | `Spec k[ε]/ε² → Spec k`, identity relation | topological clauses hold; `k → k[ε]/ε²` not an isomorphism | Pass |
| `artinBootstrap` | `F = h_X`, atlas `𝟙` | `𝟙` is flat, locally finitely presented, surjective | Pass |
| §2.14 `brownGersten_vanishing` | `F = Cone(A[0] → RΓ_Nis(a_Nis A))` | `F(∅) ≃ A[1]`; `F(pt ⊔ pt) ≃ Cone(A → A ⊕ A) ≃ A[0]` | Pass: `F(∅) ≃ 0` is needed |
| §2.14 dimension | `Spec ℝ` | `H^q_Nis = 0` for `q > 0` / `H²_ét(𝔾_m) = ℤ/2` | Pass |
| §2.19 `upperShriek_smooth`, `_lci` | `𝔸¹_k → Spec k`; `Spec k → 𝔸¹` | `Ω¹[1] = O·dx[1]` agrees with 0AA1's `O[1]`; `RHom(k, k)`: `H⁰ = H¹ = k` / `Li^*k ⊗ k[−1]`: degrees 0, 1 | Pass |
| §3.3 degree | double line `V(z²) ⊂ ℙ²`; genus 2 | `χ(O_X(n)) = 2n + 1`, `deg O(1) = 2`, pullback to `ℙ¹` has degree 1; `deg O = 0 ≠ χ(O) = −1` | Pass |
| `Curve.vectorBundleDegree_pullback` | `z ↦ z²` on `ℙ¹`, `E = O(1)` | `χ(O(2)) − χ(O) = 3 − 1 = 2` / `2 · 1` | Pass |
| §3.3 `curve_serre_duality_ext_hom` | node skyscraper `K` on the nodal cubic | `dim Ext¹(K, K) = dim (𝔪/𝔪²)^∨ = 2` / `dim Hom(K, K ⊗ ω) = 1`: locally free `U` needed | Pass |
| §3.6 Picard torsors | pointless real conic | `Pic X = 2ℤ`, `Pic_{X/ℝ}(ℝ) = ℤ`, cokernel `ℤ/2 = Br ℝ` | Pass |
| §5.2 pushforward | `𝔸¹ → Spec k`; `Spec k' → Spec k` of degree `d` | `[0] = div(t) ∼ 0` but `deg = 1`; both sides `d[𝔸¹_k]` | Pass |
| §5.5 `Chow.gysin` | origin of `𝔸¹` along `z ↦ z²`; `{1} → 𝔾_m → 𝔸¹` | `[Spec k[z]/z²] = 2[pt]` for `U = 𝔸¹` and `U = 𝔸¹ ∖ {1}`; `(ji)^![𝔸¹] = [1] = i^!j^![𝔸¹]` | Pass |
| §5.12 `bezout_inequality` | line with itself; skew lines in `ℙ³`; double line and a line in `ℙ²` | `1 ≤ 1`; `0 ≤ 1`; `1 ≤ 2·1` | Pass |
| `hodge_index` | `ℙ¹ × ℙ¹`, `H = (1,1)`, `D = (1,−1)` | `D·H = 1 − 1 = 0`, `D² = −2 ≤ 0` | Pass |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² = x³ + x` over `𝔽₃` | `0 ≤ 0`; points `1 + 0 + 2 + 1 = 4`, `\|4 − 4\| ≤ 2√3` | Pass |
| `grothendieck_existence` | `A = k[[t]]`; `𝔸¹_A` | `lim A/t^{n+1} = A`; `Σ tⁿxⁿ ∈ lim A_n[x] ∖ A[x]` | Pass: properness needed |
| §5.10 `Num(E × E)` Check | `y² = x³ + x` over `𝔽̄_p` | `j = 1728`; `p ≡ 1 mod 4`: rank 4; `p ≡ 3 mod 4`: rank 6 | Pass |

## Not verifiable

- **Fulton 1998.** It is the primary locator in §5.2, §5.5 and §5.12 (Theorems 1.4, 1.7, 6.2–6.5, Examples 8.4.6 and 12.3.1). It is a Springer book with no legal open copy and is not in the manifest, so it was not opened. The Stacks counterparts for §5.2 and §5.5 were verified; §5.12 has none.
- **de Jong 1996 and Hartshorne 1977.** The manifest settles both as uncertified. They are cited by locator only.
- **Gabber–Kelly (§2.14, "compare").** No cached text was found, and this review edits no manifest.
- **Poonen 2017, printed pages.** I read the author's online version. The README cites it by numbered items only, which were all found.
- **Elaboration at main's pins.** Only the branch pins can be elaborated with the commands this review allows. Whether `derivedRestrictComp` elaborates at `2fd255d9`/`1b1ccf4b` is unchecked; every declaration its body names exists at both pins.
- **Ownership against open pull requests.** Checked through `scratch/overlaps.md` and `roadmaps grep` for the new gluing objects. I did not read every open README.

## Source issues

- none
