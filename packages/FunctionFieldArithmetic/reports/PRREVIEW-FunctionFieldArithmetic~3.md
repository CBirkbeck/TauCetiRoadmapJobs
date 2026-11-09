# Review of FunctionFieldArithmetic (pull request #1474 at b6f153b)

**Verdict:** needs changes

Incremental re-review of the 79 changed README lines since c5d655e (34 insertions, 45 deletions; `Suggested.lean` unchanged). The gate fails on two statement-hygiene hits in untouched Lean. The changed §§4.2 and 4.4 cite one supplier id that an open pull request drops, and one that only open revisions define. Four findings: one P2, three P3. The rewritten mathematics of §§4.2 and 4.4 is correct (table below).

## R01 (P2) — §4.4 still cites LocalFieldsRamification Layer 3, which #617 removes

**Location.** `TauCetiRoadmap/FunctionFieldArithmetic/README.md` line 1274 (rewritten in this change): "*Needs:* Layers 3.2 and 4.3; LocalFieldsRamification Layer 3 (quotient compatibility);". The same id is cited at lines 133, 311–314, 808, 1081, 1135, 1143 and 1698.

**Claim.** §4.4 needs the quotient theorem for the upper numbering ("Herbrand's theorem passes to quotients", line 1263). It takes this from a supplier section that disappears when #617 merges.

**Witness.** At #617 (head 3442338), `Completed/LocalFieldsRamification/README.md` has Layers 0–2 only (headings at lines 299, 367, 476). Its lines 51–60 hand Herbrand functions, upper numbering and the quotient theorems to the pinned Tau Ceti, and line 232 names `map_restrictNormalHom_upperRamificationGroup`.

**Repair.** Cite the pinned Tau Ceti directly. List these under `### From Tau Ceti`:

- `TauCeti.LocalFieldsRamification.lowerRamificationGroup` (`NumberTheory/LocalField/RamificationGroup.lean:99`);
- `upperRamificationGroup` (`Herbrand/Basic.lean:421`);
- `herbrand` (`Herbrand/Basic.lean:258`);
- `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`);
- `hasseArf` (`Herbrand/HasseArf/Abelian.lean:50`).

At line 1274, replace "LocalFieldsRamification Layer 3 (quotient compatibility)" with `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`. Make the same replacement, with the name that matches, at each other line listed above. Then remove the `### From TauCetiRoadmap.LocalFieldsRamification` subsection, or reduce it to a pointer.

**Test.** All five names elaborate at the pin (scratch `#check`). They hold for every `IsNonarchimedeanLocalField`, equal characteristic included. They are what #617's own contract cites (its lines 232 and 244), so the citation holds before and after #617 merges. Row "Quotient compatibility" of the table recomputes the theorem on the §4.4 tower.

## R02 (P3) — Unit-filtration reciprocity is cited from ClassFieldTheory Layer 7, which states it only at open revisions

**Location.** README lines 128–130, 284–287, 1119–1123, 1157–1160, 1255–1258 and 1275–1277. For example, lines 284–287: "Layer 7 also supplies unit-filtration reciprocity for every nonarchimedean local field, equal characteristic included: `map_unitFiltration_normResidue` … and its absolute form `closure_map_artinMap_unitFiltration`."

**Claim.** This change deletes the roadmap's own derivation of `Art_{L/K}(U_K^(r)) = Gal(L/K)^r`, which leaves a single owner and is right. It now imports the result from a ClassFieldTheory Layer 7 that exists only in open revisions. The pull request's description names neither revision in its depends-on block or its merge-order paragraph.

**Witness.**

- Main's `TauCetiRoadmap/ClassFieldTheory/README.md` Layer 7 (lines 1312–1431) states neither name nor the theorem.
- #1411 (draft) declares both names (its `Suggested.lean` lines 777 and 826).
- #1215 (another author) declares them as `normResidue_map_unitFiltration` and `closure_map_artinMap_unitFiltration_eq_upper`, with an alias table (its README lines 268–269).

**Repair.** Name #1411, the ClassFieldTheory revision that declares the cited names, in the description's depends-on block and merge-order paragraph, ahead of this pull request. #1215 cannot serve as the dependency, because it is another author's revision of a roadmap on main.

If #1411 is not to merge first, cite main instead. Add one sentence to §4.2 deriving the finite statement from three ingredients:

- the pinned `TauCeti.ClassFieldTheory.unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (`ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64`);
- `map_restrictNormalHom_upperRamificationGroup`;
- ClassFieldTheory Layer 6's finite reciprocity, whose kernel is the norm group (main README line 1310).

The argument: a subgroup `H` contains `Art(U^(r))` exactly when it contains `G^r`. Then obtain the absolute form by passing to the limit over finite quotients.

**Test.** Both revisions state the theorem for every `IsNonarchimedeanLocalField` (#1411 lines 391–394 and 777–785; #1215 lines 94–103). So the README's "in either characteristic" is accurate at either head. The fallback is checked on `K_{π,2}`, `Q = 3` (table row "Norm-group form").

## R03 (P3) — Gate statement-hygiene: `artinSchreierWitt_galois` concludes `Nonempty (… ≃+ …)`

**Location.** `TauCetiRoadmap/FunctionFieldArithmetic/Suggested.lean` lines 118–121: "theorem artinSchreierWitt_galois (n : ℕ) : Nonempty (aswQuotient p F n ≃+ Additive (ContinuousMonoidHom (Field.absoluteGaloisGroup F) (Multiplicative (ZMod (p ^ n)))))".

**Claim.** The gate's statement-hygiene rule fails at line 119. As stated, the theorem asserts an abstract isomorphism, not the pairing `x ↦ (σ ↦ σy − y)` that README §3.1 (lines 852–869) specifies.

**Witness.** Take `F = 𝔽₃`, `n = 1`. Both sides are cyclic of order 3. `Nonempty` is witnessed equally by the pairing `e` (Frob ↦ 1), by `−e` (the inverse convention, Frob ↦ 2) and by `2e`.

**Repair.** Replace the theorem by the statement below, which pins `e` by the solution pairing and carries an `exists_*` name, as the rule allows. Rename it in README lines 852 and 865.

```lean
theorem exists_addEquiv_aswQuotient_characters (n : ℕ) :
    ∃ e : aswQuotient p F n ≃+
      Additive (ContinuousMonoidHom (Field.absoluteGaloisGroup F) (Multiplicative (ZMod (p ^ n)))),
      ∀ (x : WittVector p F) (y : WittVector p (AlgebraicClosure F)),
        WittVector.frobenius y - y = WittVector.map (algebraMap F (AlgebraicClosure F)) x →
        ∀ (σ : Field.absoluteGaloisGroup F) (m : ℤ),
          WittVector.truncate n
              (WittVector.map (σ : AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F).toRingHom y - y) =
            WittVector.truncate n (m : WittVector p (AlgebraicClosure F)) →
          Multiplicative.toAdd ((Additive.toMul (e (QuotientAddGroup.mk x))) σ) =
            (m : ZMod (p ^ n)) := by
  sorry
```

**Test.** Inserted in place of the original, the statement elaborates under the file's section variables at the pins (only `sorry` warns). On `F = 𝔽₃`, `n = 1`, take `y₀ ∈ 𝔽₉` with `y₀³ − y₀ = 1`. This forces `e(1)(Frob) = 1`, which excludes `−e`.

## R04 (P3) — Gate statement-hygiene: `artinSchreierWitt_infiniteCharacters` concludes `Nonempty (… ≃+ …)`

**Location.** `Suggested.lean` lines 128–133: "Nonempty ((WittVector p F ⧸ (artinSchreierWitt p F).range) ≃+ Additive (ContinuousMonoidHom (Field.absoluteGaloisGroup F) (Multiplicative (PadicInt p))))".

**Claim.** The gate's statement-hygiene rule fails at line 130. As in R03, the conclusion does not pin the `ℤ_p`-valued pairing of README lines 863–869.

**Witness.** Take `F = 𝔽₂`. Both sides are `ℤ₂`. Multiplication by `3` or by `−1` witnesses `Nonempty` as well as the pairing does.

**Repair.** Replace the theorem by the statement below and rename it in README line 866.

```lean
theorem exists_addEquiv_aswQuotient_padicCharacters
    (p : ℕ) [Fact p.Prime] (F : Type*) [Field F] [CharP F p] :
    ∃ e : (WittVector p F ⧸ (artinSchreierWitt p F).range) ≃+
      Additive (ContinuousMonoidHom (Field.absoluteGaloisGroup F)
        (Multiplicative (PadicInt p))),
      ∀ (x : WittVector p F) (y : WittVector p (AlgebraicClosure F)),
        WittVector.frobenius y - y = WittVector.map (algebraMap F (AlgebraicClosure F)) x →
        ∀ (σ : Field.absoluteGaloisGroup F) (n : ℕ) (m : ℤ),
          WittVector.truncate n
              (WittVector.map (σ : AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F).toRingHom y - y) =
            WittVector.truncate n (m : WittVector p (AlgebraicClosure F)) →
          PadicInt.toZModPow n (Multiplicative.toAdd ((Additive.toMul (e (QuotientAddGroup.mk x))) σ)) =
            (m : ZMod (p ^ n)) := by
  sorry
```

**Test.** The statement elaborates at the pins. On `F = 𝔽₂`, the value at Frob must be `≡ 1 mod 2ⁿ` for every `n`, so it is `1`; multiplication by `3` and by `−1` are both excluded.

## Previous findings

- None. The previous report (at c5d655e, verdict accepted) raised no findings. Its R01 and R02 accounted for the report before it, and both were repaired then.

## Verified sound

**Scope.** The head is b6f153b1dd04986199f7f76502ad6368dc83c9ce. `git diff origin/main...HEAD` outside the roadmap folder is empty; the 743 outside paths in the change list come from the merge of main. Only README.md changed in the folder. The worktree was clean before and after this review.

**Gate rerun:**

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=2 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The two hits are R03 and R04. The build passes.

**Dependency check:**

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The change moves ownership of unit-filtration reciprocity down to ClassFieldTheory, which is on main and earlier in the order. It adds no upward edge.

**Elaboration and signatures.** `lake env lean` on a scratch copy of `Suggested.lean` gives exactly 12 warnings, all `sorry`, and no errors. `#check @` for all 19 declarations matches the elaborated signature list and the README; no section binder is lost. The pins moved with the merge of main: Mathlib 1b1ccf4, Tau Ceti 2fd255d. All 26 backticked `TauCeti.*` names in the README resolve at the new Tau Ceti pin. `Suggested.lean` is unchanged, so the previous one-tactic probe stands (12 admissions, none closes; no padding).

**Changed mathematics.**

- The new §4.2 paragraph (lines 1119–1124) is correct. Inversion preserves `U_K^(r)`, so the `[u⁻¹]_f` action of lubinTate_artin carries `U_K^(r)` to its own image under `(O/𝔭^m)ˣ ≅ Gal(K_{π,m}/K)`.
- Both rewritten Checks (lines 1157–1163) recompute.
- The scope bullet (lines 61–62) now matches lubinTate_artin.
- Removing the old derivation leaves no restatement of a ClassFieldTheory target.

**Pinned declarations opened.** All paths are under `TauCeti/NumberTheory/`.

| File:line | What it states |
| --- | --- |
| `LocalField/Herbrand/Basic.lean:421`, `:258` | `upperRamificationGroup = G_{ψ(v)}`; `herbrand` |
| `LocalField/RamificationGroup.lean:99` | `lowerRamificationGroup` |
| `LocalField/Herbrand/UpperQuotient.lean:98` | `(G^v)` restricts onto `(G/H)^v` |
| `LocalField/Herbrand/HasseArf/Abelian.lean:50` | Hasse–Arf for finite abelian extensions of any `IsNonarchimedeanLocalField` |
| `ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64, 121, 129` | `U(K,v) ⊆ N(M)` iff `G^v = 1`; the conductor in upper numbering; character conductor equals Artin conductor. Either characteristic; no reciprocity map enters |

**Cross-roadmap citations resolved (6).**

| Citation | Where opened | Result |
| --- | --- | --- |
| ClassFieldTheory Layers 6–7 (README 280–287, 1012–1015) | main README 1222–1311 and 1312–1431 | Layer 6: finite reciprocity, kernel the norm group. Layer 7: Artin map, conductors, no unit-filtration reciprocity (R02) |
| ClassFieldTheory scope (README 130–131) | main README 230–256 | It excludes Lubin–Tate and Artin–Schreier–Witt theory, as stated |
| `map_unitFiltration_normResidue`, `closure_map_artinMap_unitFiltration` | #1411 `Suggested.lean` 777, 826; #1215 README 268–269, `Suggested.lean` 94, 124 | Both revisions state them for any nonarchimedean local field. #1215 README 186–188 expects this import |
| LocalFieldsRamification Layer 3 | main `Completed/LocalFieldsRamification/README.md` 724; #617 head | Present on main, absent at #617 (R01) |
| Consumers of §4.2 | FunctionFieldArithmeticPartII README 85, 9543 | They cite §§4.1–4.2 for Artin and norm quotients, which are unaffected |
| Other consumers of the same object | PadicPeriodRings README 119; LocalAnabelianGeometry README 145 | Both take unit-filtration reciprocity from ClassFieldTheory Layer 7, so it has a single owner |

**Seeded sample.** The targets §4.2 and §4.4 fall in the changed text and were verified against the texts. The other 13 targets are untouched, and their rows are carried from [R2].

| Target | Locator | Outcome |
| --- | --- | --- |
| §4.2 | yoshida lines 47–64 (Theorem A, pp. 411–412); line 125 (characteristic 0 or `p`); line 430 (Definition 4.10, p. 422); line 572 (Proposition 5.10, p. 425); lines 637, 651 (Theorem 5.15, Corollary 5.16, p. 427); line 686 ((iv), p. 428); line 854 (Theorem 6.11, p. 432); line 905 (Theorem 6.15, p. 433) | All match. (iv) needs `H ⊇ 1+𝔭^m`; the README's "open" supplies this |
| §4.4 | kw lines 1074–1084 (§4.5.1, p. 21); line 1135 (Theorem 4.12, pp. 21–22); lines 1153–1155; line 1169 (Lemma 4.13, p. 22); lines 1178–1180; line 1184 (Proposition 4.14, pp. 22–23) | Kosters–Wan take `H_r = τψ(U_r)` from Serre XV Theorem 2, the result now imported. Quotient compatibility is at lines 1153–1155. The README's clamp correction stands |

**Ownership and overlaps.** The one dropped-id item of the overlap list is R01. No open pull request changes this roadmap. This change adds no owned object, so the vocabulary-closest roadmaps are unaffected.

**Remark (untouched text, no change requested).** Line 808 cites LocalFieldsRamification for Hasse–Arf; the R01 repair covers it.

**Adversarial table: fresh rows (13).** These cover the changed statements and the targets of R01–R04.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| §4.2 consumed unit-filtration reciprocity at a Lubin–Tate level (README 1119–1123, Check 1157–1160) | K=𝔽₃((T)), π=T, K_{π,2}; r=0,1,2 | unit images (O/𝔭²)ˣ, U¹/U², 1 have orders 6,3,1. Lower orders G₀..G₃ = 6,3,3,1 (yoshida line 902 count, q=3, m=2); φ(2)=(3+3)/6=1, so G¹=G₂ and upper orders are 6,3,1 | Pass; the lower-numbering model gives 3≠1 at r=2 | Check confirmed |
| Same, characteristic two | 𝔽₂((T)), K_{π,2}; r=0,1,2 | (𝔽₂[T]/T²)ˣ={1,1+T}: images 2,2,1. Lower G₀=G₁=2, G₂=1; φ(1)=1, upper 2,2,1 | Pass | None |
| Same, depth zero on an unramified layer | unramified quadratic L over 𝔽₃((T)) | Art(U⁰)=1=G⁰; Art(T) is Frobenius, order 2; putting Kˣ in place of U⁰ gives 2≠1 | Pass | None |
| Same, wild Artin–Schreier layer | 𝔽₂((T)), y²−y=T⁻¹; r=1,2 | lower break 1, upper break φ(1)=1: G¹ order 2, G²=1. [T⁻¹,1+T)=−1=1≠0, so Art(U¹) has order 2; U² generators (1−aT)², (1−aT^i) with i≥3 odd pair to 2a=0 and 0; conductor 2 | Pass | None |
| Inversion preserves U^(r) (README 1121–1123) | Q=3, u=1+T; Q=5, u=2 | u⁻¹≡1+2T mod T², in U¹: [u] and [u⁻¹] give the same order-3 image of U¹. Q=5: [2⁻¹]=[3]; U⁰ image is all 4 classes either way | Pass | None |
| Check: units trivial on the unramified ℤ_p-extension (README 1161) | 𝔽₂((T)); u=1+T versus π=T | unramified coordinate v(u)=0 gives the identity; v(T)=1 gives Frobenius, a topological generator of ℤ₂ | Pass | None |
| Check: image on the Lubin–Tate tower (README 1161–1163) | Q=3; r=1, m=1,2,3; r=0 | finite images U¹/U^m have orders 1,3,9; limit 1+𝔭 of index 2 in Oˣ; r=0 gives Oˣ, all of Gal(K_π/K) (totally ramified) | Pass | None |
| §4.4 route through the absolute form (README 1255–1258) | p=2, x=[T⁻¹], r=1,2,3 | least j with 2^j≥r is 0,1,2, Schmid–Witt images ℤ₂,2ℤ₂,4ℤ₂; README bound min(v(c_i)+max(0,⌈log₂(r/i)⌉))=0,1,2 gives the same groups; K₁,K₂ conductors 2 and 1+1·2^(2−1)=3 | Pass | None |
| Quotient compatibility, Tau Ceti `map_restrictNormalHom_upperRamificationGroup` (R01 repair) | K₂→K₁ for x=[T⁻¹], p=2; K_{π,2}→K_{π,1}, Q=3 | G² (order 2 in ℤ/4) maps to 1=(G/H)², K₁ having upper break 1; G¹ maps onto. Q=3: G⁰ (6) onto 𝔽₃ˣ (2); G¹ (3) to 1, the tame G¹ | Pass | R01 |
| Norm-group form at the pin, `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (R02 fallback) | K_{π,2}, Q=3, N=⟨π⟩×U² (yoshida line 572) | U¹⊄N and G¹≠1; U²⊆N and G²=1. Subgroups containing Art(U¹)=C₃ are C₃,C₆, exactly those containing G¹ | Pass | R02 |
| `artinSchreierWitt_galois` as stated (R03) | F=𝔽₃, n=1 | ℘=0 on W(𝔽₃): quotient order 3; Hom(Ẑ,ℤ/3) order 3. `Nonempty` holds for the pairing e, for −e (inverse convention) and for 2e alike: Frob ↦ 1, 2, 2 | True, does not pin the map | R03 |
| Repaired finite statement (R03) | F=𝔽₃, n=1, y₀∈𝔽₉ with y₀³−y₀=1; F=𝔽̄₂ | Frob(y₀)−y₀=1 forces m=1 and e(1)(Frob)=1; −e gives 2, excluded. Algebraically closed F: both sides 0 | Pass | R03 |
| Repaired infinite statement (R04) | F=𝔽₂ | W(𝔽₂)/℘=ℤ₂, Hom_cont(Ẑ,ℤ₂)=ℤ₂; value ≡1 mod 2ⁿ for all n forces e(1)(Frob)=1; the current form is also met by multiplication by 3 or −1 | Pass | R04 |

**Adversarial table: carried rows (197).** These are the rows of [R2] for every statement this change leaves untouched; [R2] itself carried most of them from [R1]. Only the row "4.2 ramification/unit comparison" is replaced, by the fresh §4.2 rows above. Neither the computations nor their source reads were repeated here.

[R1]: packages/FunctionFieldArithmetic/reports/PRREVIEW-FunctionFieldArithmetic~1.md
[R2]: packages/FunctionFieldArithmetic/reports/PRREVIEW-FunctionFieldArithmetic~2.md

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| Positive idele degree and J_F/C_F convention | F₂(t), div(t)=[0]−[∞] | degree=1−1=0 on the principal idele; quotient degree also 0 | Pass, [R2] | None (untouched) |
| Weighted degree, Yu sign and norm | q=2, uniformizer at a degree-2 place | divisor and idele degrees both 2; Yu=−2; norm=2⁻²=1/4; dropping residue degree gives 1/2 | Pass, [R2] | None (untouched) |
| Constant-field reciprocity | constant C₃ cover, degree-2 idele | arithmetic exponent=2=−(−2) mod3; geometric exponent=−2=1 mod3 | Pass, [R2] | None (untouched) |
| Degree-surjectivity transfer, §0.2 | F₂(t), idele t⁻¹ at ∞; hypothetical place degrees 2,3 | degree at ∞=1 on both sides; deg(P₃−P₂)=3−2=1 without effectiveness | Pass, [R2] | None (untouched) |
| Picard degree-one consequence, §0.3 | P¹/F₂; excluded pointless real conic | Cl=Pic=Z and Cl⁰=J(F₂)=0; h=1. Real divisor degree image=2Z, not Z | Pass, [R2] | None (untouched) |
| Scheme/Jacobian numerator, §5.4 | E:y²=x³+x+1 over F₅ | N₁=9,N₂=27; X²+3X+5 reverses to L=1+3T+5T²; L(1)=9 | Pass, [R2] | None (untouched) |
| Recurrence and g-count recovery, §5.6 | same E, S₀=2,S₁=−3,S₂=−1 | S₂+3S₁+5S₀=−1−9+10=0; a₁=N₁−6=3; a₂=5a₀=5 | Pass, [R2] | None (untouched) |
| Empty-root-list recovery | P¹/F₂, g=0 | all S_r=0; numerator=1, degree=0; N_r=2^r+1 | Pass, [R2] | None (untouched) |
| Infinite-character headline, §3.1 | F₂, class 1 | ℘=0; quotient=W(F₂)=Z₂; Hom_cont(Zhat,Z₂)=Z₂; Fr evaluation is 1 on both sides | Pass, [R2] | None (untouched) |
| Infinite image and zero Check | F₂, classes 1,0; n=1,2,3 | reductions of 1 have orders 2,4,8; infinite image Z₂. Zero gives 0,0,0 and image size 1 | Pass, [R2] | None (untouched) |
| Inverse-Frobenius sign Check | F₃, class 1; n=1,2 | arithmetic values 1,1; inverse values −1 mod3=2, −1 mod9=8; negative pairing swaps them | Pass, [R2] | None (untouched) |
| Algebraically closed Check | algebraic closures of F₂,F₃, finite and infinite length | recursive separable equations x^p−x=c are solvable; quotient=0 and character group=0, both cardinality 1; zero-image quotient retains 1 | Pass, [R2] | None (untouched) |
| Truncation versus reduction | F₂, class 5; n=1,2,3 | both sides evaluate at Fr to 1 mod2,1 mod4,5 mod8; orders 2,4,8; truncation 5→1→1 | Pass, [R2] | None (untouched) |
| Imperfect-field generality | F₂(t), [t]; extension with s²=t | [t]−[s]=℘[s], so quotient images agree; length1,2 orders=2,4, matching cyclic character image orders | Pass, [R2] | None (untouched) |
| Enlarged finite constants | F₄, class 1 | Fr evaluation=Tr_W(F₄)/Z₂(1)=2; lengths1,2,3 give 0,2,2 of orders1,2,4; infinite class is nonzero | Pass, [R2] | None (untouched) |
| Reduced local representative, §3.2 | p=3,K=F₃((T)),[T⁻²] | at length1 T⁻⁶−T⁻²=℘(T⁻²); reduced index2, coefficient1; zero model loses a nonzero class | Pass, [R2] | None (untouched) |
| Chebotarev progression, §5.8 | constant C₂ cover of P¹/F₂ | degree1 nonidentity count3, identity count0; compatible coefficient1/1=1, not1/2 | Pass, [R2] | None (untouched) |
| Explicit bound and limit, §5.8 | trivial cover P¹/F₂; r=1,2,3,4 | rπ=3,2,6,12; main=3,5,9,17; errors0,3,3,5; bounds r·2^(r/2)+r exceed them; normalized bound tends to0 | Pass, [R2] | None (untouched) |
| Nonabelian/geometric denominator | geometric S₃, class of 3-cycles | size2/order6=1/3; inverse class still size2; constant C₃ instead gives coefficient1 | Pass, [R2] | None (untouched) |
| DWP density-zero role | finite quotient, empty Haar-null fibre | Haar mass0,count0,proportion0; full compatible constant coset has mass/proportion1 and is excluded | Pass, [R2] | None (untouched) |
| 0.1 weighted degree and principal degree | 𝔽₂(t), div(t)=[0]−[∞] | 1−1=0; idele supported at a degree-2 place has degree 2 | Pass, [R2] | None (untouched) |
| 0.1 absolute value and Yu sign | q=2, uniformizer at degree 2 | local norm=2⁻²=1/4; Yu degree=−2; 2^(−2)=1/4 | Pass, [R2] | None (untouched) |
| 0.1 central determinant degree | scalar degree 1, GL₂ | determinant degree=2=2·1; GL₀ has degree 0 | Pass, [R2] | None (untouched) |
| 0.1 arithmetic/geometric Frobenius | constant C₃ extension, place degree 1 | arithmetic class=1; geometric class=−1=2 mod 3 | Pass, [R2] | None (untouched) |
| 0.1 constant extension splitting | degree d=2 place, extensions r=2 and r=3 | gcd=2,1; new place degrees=1,2; residue degrees over original field=2,6 | Pass, [R2] | None (untouched) |
| 0.2 degree-one divisor headline | 𝔽₂(t); hypothetical available degrees 2,3 | deg[∞]=1; deg(P₃−P₂)=3−2=1; this need not be effective | Pass, [R2] | None (untouched) |
| 0.2 finite-constant hypothesis | pointless real conic | divisor degrees=2ℤ; 1 absent, while Picard-scheme degree-1 component has one real point | Pass, [R2] | None (untouched) |
| 0.3 divisor/line-bundle/Picard comparison | ℙ¹/𝔽₂ and ℙ¹/𝔽₃ | Cl=Pic=ℤ by degree; Cl⁰=J(k)=0, each of cardinality 1 | Pass, [R2] | None (untouched) |
| 0.3 Brauer obstruction boundary | real conic | Pic(X)=2ℤ; Pic_X/ℝ(ℝ)=ℤ; cokernel=ℤ/2, so finite-field conclusion cannot be generalized unchanged | Pass, [R2] | None (untouched) |
| 1.1 two-chart inverse ideals | k(t), D=2∞ | k[t]∩t²k[1/t]_(1/t)=span(1,t,t²), dimension 3; unreversed infinite ideal gives dimension 0 | Pass, [R2] | None (untouched) |
| 1.1 zero and negative divisor | D=−∞ | intersection={0}, dimension 0; multiplicative valuation at 0 is 0≤exp(−1), so 0 is retained | Pass, [R2] | None (untouched) |
| 1.1 divisor-addition/ideal multiplication | D=∞, E=2∞ | infinite ideals t⁻¹·t⁻²=t⁻³, matching D+E=3∞ | Pass, [R2] | None (untouched) |
| 1.1 pole/zero shifts and principal ideals | D=0, x=t, r=−1,0,2 | pole ideals t,1,t⁻²; zero ideals t⁻¹,1,t²; div(t) is generated by t on each chart | Pass, [R2] | None (untouched) |
| 1.2 reduced-basis headline | k(t), D=2∞, rank 1 | d=(2), v=1; shifts r=−3,−2,0 give dimensions 0,1,3=max(0,3+r) | Pass, [R2] | None (untouched) |
| 1.2 uniqueness of sorted invariants | elliptic x-map, D=0, rank 2 | d=(0,−2); shifted dimensions at r=0,1,2 are 1,2,4; rival (−1,−1) gives 0 at r=0 | Pass, [R2] | None (untouched) |
| 1.2 invariant sum | genus 1, D=0, rank 2 | sum d=−2=0+1·(1−1)−2 | Pass, [R2] | None (untouched) |
| 1.2 inseparable parameter | F=𝔽₂(t), x=t², D=0 | rank=2, basis 1,t, d=(0,−1); shifted dimensions 1,3,5=2r+1 for r=0,1,2 | Pass, [R2] | None (untouched) |
| 1.2 nonexact constants | F=𝔽₄(t) over 𝔽₂, x=t, D=0 | rank=2, d=(0,0); dim L(0)=2; sum=0=2(1−0)−2 | Pass, [R2] | None (untouched) |
| 2.1 divisor lattices and diagonal | ℙ¹/𝔽₂, D=0,∞,−∞ | diagonal intersections have cardinalities 2,4,1; dimensions 1,2,0 | Pass, [R2] | None (untouched) |
| 2.1 inclusions and finite indices | D=0, E one degree-2 place, q=2 | index A(E)/A(D)=4=2^(deg(E−D)); reversed inclusion fails | Pass, [R2] | None (untouched) |
| 2.1 sum/intersection | local exponents −1,2 | πO∩π⁻²O=πO; sum=π⁻²O, matching min=−1/max=2 | Pass, [R2] | None (untouched) |
| 2.1 quotient/RR index | ℙ¹, D=−2∞ | dim L(D)=0; adelic cokernel dimension=1; Euler difference=−1=deg D+1−g | Pass, [R2] | None (untouched) |
| 2.2 local self-dual volume | q_v=4, differential orders −2,0,2 | vol O=4,1,1/4=4^(−n_v/2); dual-lattice volume products=1 | Pass, [R2] | None (untouched) |
| 2.2 global volume and covolume | ℙ¹/𝔽₂, ω=dt | ord∞ω=−2; vol A(0)=2; integral-measure quotient volume=1/2, self-dual quotient volume=1 | Pass, [R2] | None (untouched) |
| 2.2 divisor scaling | same curve, D=2∞ | vol A(D)=8=2^(2+1); ratio to A(0)=4=2² | Pass, [R2] | None (untouched) |
| 2.2 change differential | dt→t dt on ℙ¹ | orders gain +1 at 0 and −1 at ∞; local multipliers 2⁻¹/² and 2¹/² multiply to 1 | Pass, [R2] | None (untouched) |
| 2.3 Fourier indicator | ℙ¹/𝔽₂, D=0, ω=dt | transform value at 0 is 2; support A(−2∞); second scalar 1/2, product 1 | Pass, [R2] | None (untouched) |
| 2.3 translated indicator | finite F₃ quotient, translate by 1, frequency 1 | positive transform phase=e^(2πi/3), while inverse convention gives e^(−2πi/3) | Pass, [R2] | None (untouched) |
| 2.3 Schwartz spanning | F₃ local residue quotient | all centered-lattice functions take equal values at residues 1,2; translated point indicator takes 1,0 | Pass, [R2] | None (untouched) |
| 3.1 Witt operator real body | p=2, a=[t] at length 2 | Frob(a)−a=(t²+t,t²+t³); coordinatewise subtraction would give second coordinate 0 | Pass, [R2] | None (untouched) |
| 3.1 truncation and Q₀ | p=2, lengths 0,1,2 | Q₀=0; truncate ℘[t]=t²+t=℘₁(t); length-zero quotient has one element | Pass, [R2] | None (untouched) |
| 3.1 finite Q_n over constants | F=𝔽₂, n=1,2 | Frob=id; quotient groups have orders 2,4, matching Hom_cont(ℤ̂,ℤ/2ⁿ) | Pass, [R2] | None (untouched) |
| 3.1 Hilbert 90 identity extension | L=F, n=0,1,2 | 1−σ=0, trace=id; kernel=all, image=0, trace range=all on both sides | Pass, [R2] | None (untouched) |
| 3.1 Hilbert 90 wild trace | y³−y=t, degree 3 | Tr(1)=3=0; Tr(−y²)=−(3y²+2)=1 in characteristic 3 | Pass, [R2] | None (untouched) |
| 3.1 Witt trace versus coordinates | p=2, y²+y=t, length 2 | [y]+[y+1]=(1,y(y+1))=(1,t); coordinate sum would be (1,0) | Pass, [R2] | None (untouched) |
| 3.1 field degree/order | F=𝔽₂(t), class [t] in Q₂ | 2[t]=(0,t²) has nonzero AS class t; 4[t]=0; field degree=4, not 2 | Pass, [R2] | None (untouched) |
| 3.1 cyclic-subgroup classification | order-4 class a, classes a and 3a | characters differ by factor 3, cyclic subgroup has the same 4 elements; generated field degree=4 in both cases | Pass, [R2] | None (untouched) |
| 3.1 localization kernel | p=3, class t⁻², completion at ∞ | with s=1/t, solution −Σ_{j≥0}s^(2·3^j) gives y³−y=s²; local class=0 while global pole class≠0 | Pass, [R2] | None (untouched) |
| 3.1 infinite dual topology | F=𝔽₂; Q∞=ℤ₂ | continuous ℤ₂-linear dual=ℤ₂; finite-level quotients have sizes 2ⁿ; not the torsion group ℚ₂/ℤ₂ | Pass, [R2] | None (untouched) |
| 3.2 reduced representatives | p=3, coefficient c₂=1, others 0 | class [T⁻²] has one allowed prime-to-3 pole; T⁻⁶ reduces to T⁻² at length 1 | Pass, [R2] | None (untouched) |
| 3.2 Witt constants and nonlinearity | p=2, [1+T]−[1] at length 2 | coordinates (T,T), not (T,0); its pole-free positive part has zero local ASW class | Pass, [R2] | None (untouched) |
| 3.2 exact constant coefficient choice | k=𝔽₄, β=[u], Tr(u)=1 | β projects to a generator of Q₁; [1] has trace 0 and is not a generator | Pass, [R2] | None (untouched) |
| 3.2 finite truncation/ramification | β+p[T⁻m], n=1,2 | n₀=0,n_c=1; degrees p,p²; residue degrees p,p and ramification indices 1,p | Pass, [R2] | None (untouched) |
| 3.3 one-pole comparison | p=3,m=2 | different exponent=(3−1)(2+1)=6; 2g−2=−6+6=0; g=1 | Pass, [R2] | None (untouched) |
| 3.3 localization at other places | same curve, ∞ | pole class nonzero at 0; positive-power local series gives class 0 at ∞; three rational points above ∞ | Pass, [R2] | None (untouched) |
| 3.3 point-count check | y³−y=t⁻² over 𝔽₃ and 𝔽₉ | counts 4 and 16; L=1+3T² gives 3+1=4 and 9+1−(−6)=16 | Pass, [R2] | None (untouched) |
| 4.1 formal module/action | O=𝔽₂[[π]], f=πX+X² | formal addition X+Y: f(X+Y)=f(X)+f(Y); [0]=0,[1]=X,[π]=f | Pass, [R2] | None (untouched) |
| 4.1 tangent and strict coordinate laws | same f, identity coordinate | linear coefficients 0,1,π; identity derivative 1; scalar 2 in characteristic 3 is not strict | Pass, [R2] | None (untouched) |
| 4.1 torsion module/cardinality | Q=3, m=1,2 | torsion sizes 3,9; primitive sizes 2,6=(Q−1)Q^(m−1) | Pass, [R2] | None (untouched) |
| 4.1 torsion field/Galois degree | Q=2, m=1,2 | field degrees 1,2; unit groups modulo π,π² have orders 1,2 | Pass, [R2] | None (untouched) |
| 4.1 norm of uniformizer | Q=2,m=1, f=πX+X² | nonzero torsion root=π; field is K; its norm is π, valuation 1 | Pass, [R2] | None (untouched) |
| 4.1 relative construction | unramified degree d=2,Q=2,m=2 | residue degree 2, ramification degree 2, total degree 4; norm valuation image=2ℤ | Pass, [R2] | None (untouched) |
| 4.1 lower/upper ramification | Q=2,m=2, nontrivial principal unit | torsion displacement valuation=2; lower break=1, upper break=1, conductor=2 | Pass, [R2] | None (untouched) |
| 4.2 local existence headline | H=K×; H=ord⁻¹(2ℤ) | unique fields K and unramified quadratic; indices/degrees 1 and 2 | Pass, [R2] | None (untouched) |
| 4.2 wild existence | K=𝔽₂((T)), y²−y=T⁻¹ | extension degree/index=2; U² killed, U¹ not killed; conductor=2 | Pass, [R2] | None (untouched) |
| 4.2 Kronecker–Weber and Artin image | unramified quadratic and ramified quadratic | first requires constant tower, second requires torsion tower; degree projection of K× is ℤ, completion is ℤ̂ | Pass, [R2] | None (untouched) |
| 4.2 inverse unit convention | Q=5, unit residue 2, first torsion level | arithmetic Artin acts by [2⁻¹]=[3]; geometric convention acts by [2] | Pass, [R2] | None (untouched) |
| 4.3 Schmid–Witt constant symbol | k=𝔽₃, a=1, b=T² | trace-residue value=2; valuation formula ord(b)Tr(a)=2·1=2 mod 3 | Pass, [R2] | None (untouched) |
| 4.3 bilinearity and trivial factors | a=0 or b=1; constants a=1,b=T,T² | values 0,0 and 1,2; [1,T·T)=1+1=2 | Pass, [R2] | None (untouched) |
| 4.3 finite/nonfinite dual carrier | n=1 versus infinite length | T^p has exponent class 0 modulo (K×)^p; at length 2 its valuation class is p≠0 mod p² | Pass, [R2] | None (untouched) |
| 4.4 finite conductor formula | p=3,m=2; n=1,2; v(c)=0,1 | conductors 3,7 for unit coefficient; n=2,v(c)=1 gives 3; constant-only gives 0 | Pass, [R2] | None (untouched) |
| 4.4 primitive normalization | x=2[T⁻¹], x₀=[T⁻¹] | n₀=1; normalized G¹ bound 1−1=0; evaluation on x has image 2ℤ₂, not ℤ₂ | Pass, [R2] | None (untouched) |
| 4.4 missing-clamp negative control | p=2, x=β+2[T⁻³], r=1 | correct bound=1+max(0,ceil(log₂(1/3)))=1; unclamped bound=0; inertia 2ℤ₂≠ℤ₂ | Pass, [R2] | None (untouched) |
| 4.4 compositum conductors | conductors exponents 2 and 3 | ideal lcm=π³; exponent max(2,3)=3, not 5 | Pass, [R2] | None (untouched) |
| 4.5 ray quotient and degree splitting | ℙ¹/𝔽₃, m=0,[0]+[∞],2∞ | degree-zero groups of sizes 1,2,3; quotient adds a discrete ℤ degree direction | Pass, [R2] | None (untouched) |
| 4.5 quotient versus selected conductor | wild quotient B=ℤ/2, select trivial character | quotient conductor exponent 2; selected conductor 0 | Pass, [R2] | None (untouched) |
| 4.5 completion/truncation coordinates | T-adic O, N=0,1,2 | quotients 0,k,k[T]/T²; sizes 1,q,q²; the N=0 unit group has one element | Pass, [R2] | None (untouched) |
| 4.5 coordinate-change compatibility | T′=T+T² modulo T³ | T=T′−T′² mod T′³; composing gives T mod T³, so the truncation comparison is not identity on coefficients | Pass, [R2] | None (untouched) |
| 4.6 rigidified Picard dimension | g=0, modulus lengths N=0,1,2 | dimensions 0,0,1; using g+N−1 at N=0 would give −1 | Pass, [R2] | None (untouched) |
| 4.6 reduced/nonreduced unit sequence | ℙ¹, m=0+∞ versus 2∞ | kernels G_m versus G_a; over 𝔽₃ point counts 2 versus 3 | Pass, [R2] | None (untouched) |
| 4.6 non-split modulus | single degree-2 point over 𝔽₃ | Res 𝔽₉×/𝔽₃× has order 8/2=4; one-dimensional torus, not additive group of order 3 | Pass, [R2] | None (untouched) |
| 4.6 rigidification and base-change automorphisms | m rational point; dual-number base | scalar 1+ε preserves the identity frame only if ε=0; normalized units on 2∞ are 1+bT and multiply by adding b | Pass, [R2] | None (untouched) |
| 4.6 torsor/Brauer distinction | real conic, degree-2 m | Pic_m¹(ℝ)=empty; Pic_X¹(ℝ) has one point; hence scheme torsor does not imply rational section | Pass, [R2] | None (untouched) |
| 4.7 Abel map and high-degree fibre | ℙ¹, m=2∞, n=1,2 | vector-torsor fibre ranks 0,1=n−2−0+1; n=1 Abel map A¹→G_a is t↦t | Pass, [R2] | None (untouched) |
| 4.7 ordinary modulus boundary | m=0, ℙ¹, n=0,1 | ordinary Abel fibres are P⁰,P¹, dimensions 0,1; positive-modulus affine formula is not used | Pass, [R2] | None (untouched) |
| 4.7 Rosenlicht modulus | t: G_m→G_m; t:A¹→G_a | least moduli 0+∞ and 2∞ respectively; modulus ∞ alone gives J=0 and cannot factor the nonconstant additive map | Pass, [R2] | None (untouched) |
| 4.7 nontrivial genus threshold | g=1,N=1,n=2 | rank=n−N−g+1=1; n=1 lies below sufficient bound 2g+N−1=2 | Pass, [R2] | None (untouched) |
| 4.8 ray/rigidification coordinate | k=𝔽₅, local unit u=2 | idele gives (O,u⁻¹)=(O,3); unit-sequence boundary gives (O,2); 2·3=1 | Pass, [R2] | None (untouched) |
| 4.8 principal relation and tensor | principal f=2, tensor unit frames u=2,v=3 | constant principal idele is zero in ray quotient; tensor frame u⁻¹v⁻¹=1=(uv)⁻¹ | Pass, [R2] | None (untouched) |
| 4.8 degree and empty modulus | ℙ¹,m=0, divisor d∞, d=−1,0,2 | line bundles O(−1),O,O(2), degrees −1,0,2 on both sides | Pass, [R2] | None (untouched) |
| 4.9 multiplicative Lang cover | G_m/𝔽₃, Frob−id | Lang map z↦z²; equation z²=t has two geometric sheets and connected function field; inverse sign would invert deck class | Pass, [R2] | None (untouched) |
| 4.9 additive Lang cover | G_a/𝔽₃ | Lang map y↦y³−y; y³−y=t has degree 3 and derivative −1=2, hence étale on A¹ | Pass, [R2] | None (untouched) |
| 4.9 degree-d Frobenius | G_a/𝔽₃, v degree 2 | two iterations give y⁹−y=t+t³=Tr_𝔽₉/𝔽₃(t); subtracting 2a gives [v]−2a | Pass, [R2] | None (untouched) |
| 4.10 B-torsor classification | B=0; B=ℤ/4, θ=0 | degrees 1 and 4; connected components 1 and 4; zero character need not mean identity cover for fixed nontrivial B | Pass, [R2] | None (untouched) |
| 4.10 connectedness | B=ℤ/4, θ=2deg | image size 2; components=4/2=2; each component is a constant quadratic cover | Pass, [R2] | None (untouched) |
| 4.10 geometric connectedness/constants | B=ℤ/3, θ=deg mod3 on ℙ¹ | connected components 1; geometric components 3; constant degree 3=[B:0] | Pass, [R2] | None (untouched) |
| 4.10 norm subgroup | constant quadratic cover | norm degrees=2ℤ; cover degree=2=index; kernel of degree itself would have infinite index | Pass, [R2] | None (untouched) |
| 4.10 pushout and splitting independence | replace a by a+b, θ(b)=1 mod3, d=2 | geometric contribution changes −2=1; constant contribution +2; total change 0 mod3 | Pass, [R2] | None (untouched) |
| 4.10 least conductor tame boundary | z^(q−1)=t, q=2,3 | q=2 degree1/conductor0; q=3 degree2/conductor 0+∞, exponent1 at each point | Pass, [R2] | None (untouched) |
| 4.10 wild least modulus | y²−y=t on A¹ | same open for ∞ and 2∞; Swan1, conductor2; character factors through 2∞ only | Pass, [R2] | None (untouched) |
| 4.10 conductor as character maximum | B=(ℤ/2)², local character depths 1,3 | joint kernel first contains U³; maximum=3; trivial character depth0 does not determine quotient conductor | Pass, [R2] | None (untouched) |
| 5.1 effective divisors/zeta definition | ℙ¹/𝔽₂, n=0,1,2,3 | A_n=1,3,7,15; generating series coefficients equal these integers | Pass, [R2] | None (untouched) |
| 5.1 placeCount and pointCount | ℙ¹/𝔽₂, r=0,1,2 | place counts B₁=3,B₂=1; N₀=0 by empty divisors, N₁=3,N₂=3+2=5 | Pass, [R2] | None (untouched) |
| 5.1 Euler product headline | same curve, coefficient T² | three degree-1 places contribute binomial(4,2)=6; one degree-2 place adds1; total7=A₂ | Pass, [R2] | None (untouched) |
| 5.1 logarithmic derivative headline | same curve, r=1,2,3,4 | rA_r=3,14,45,124; convolutions give 3,9+5,21+15+9,45+35+27+17 | Pass, [R2] | None (untouched) |
| 5.1 Möbius inversion/base extension | q=2, r=2 | B₂=(N₂−N₁)/2=(5−3)/2=1; base-extension rational points N₂=5 | Pass, [R2] | None (untouched) |
| 5.2 large-degree count headline | ℙ¹/𝔽₂,n=0,2; E/𝔽₅,g1,h9,n1 | (q−1)A_n=1,7,36; RHS=2¹−1,2³−1,9(5−1), respectively | Pass, [R2] | None (untouched) |
| 5.2 sharp bound | genus1,n=0 | hypothesis 2≤1 fails; A₀=1, whereas unguarded RHS=h(5⁰−1)=0 | Pass, [R2] | None (untouched) |
| 5.3 rationality and degree headline | ℙ¹/𝔽₂ | Z=(1−T)⁻¹(1−2T)⁻¹; numerator1, degree0=2g, leading coefficient1=2⁰ | Pass, [R2] | None (untouched) |
| 5.3 genus-one numerator/reciprocity | E:y²=x³+x+1 over 𝔽₅ | N₁=9; L=1+3T+5T²; a₂=5a₀=5, a₁=9−6=3, L(1)=9=h | Pass, [R2] | None (untouched) |
| 5.3 functional equation | same L | 5T²L(1/(5T))=5T²+3T+1=L(T) | Pass, [R2] | None (untouched) |
| 5.4 scheme/Jacobian reversal | same E | charpoly X²+3X+5 reverses to 1+3T+5T²; constants 5 versus1 distinguish the two | Pass, [R2] | None (untouched) |
| 5.4 root bound and counts | same E | discriminant −11, both root norms √5; S₂=9−10=−1, N₂=26−(−1)=27 | Pass, [R2] | None (untouched) |
| 5.5 constant extension | same E, r=2 | L₂=1+T+25T²; L(T)L(−T)=1+T²+25T⁴=L₂(T²) | Pass, [R2] | None (untouched) |
| 5.5 rational curve extension | q=2,r=2 | Z₂(T²)=1/((1−T²)(1−4T²)); Z(T)Z(−T) has the same denominator | Pass, [R2] | None (untouched) |
| 5.6 data predicate and uniqueness headline | g=0, q=0,1,2 | P.coeff0=1, natDegree≤0 force P=1 in all three cases | Pass, [R2] | None (untouched) |
| 5.6 data for junk q values | g=1,N₁=9,q=0,1,5 | unique P=1+8T, 1+7T+T², 1+3T+5T²; leading degree may drop at q=0 | Pass, [R2] | None (untouched) |
| 5.6 Newton recovery with g2 | q=2, N₁=3,N₂=13 | a₁=0; 2a₂=13−4−1=8 so a₂=4; symmetry a₃=0,a₄=4; P=1+4T²+4T⁴ | Pass, [R2] | None (untouched) |
| 5.6 actual L-polynomial data headline | E/𝔽₅, g1,N₁9 | r=1 identity 1·3=(9−5−1)·1=3; symmetry fixes a₂=5 | Pass, [R2] | None (untouched) |
| 5.7 characteristic-series definition | rank-one module, u=2 in ℤ/5 | series1−2T; one shift gives inverse, coefficient T is2 rather than−2 | Pass, [R2] | None (untouched) |
| 5.7 representative and base-change API | [A→¹A], u=id; A→A/2 | series(1−T)/(1−T)=1 before/after reduction; acyclic replacement contributes1 | Pass, [R2] | None (untouched) |
| 5.7 perfect versus projective cohomology | [ℤ/4→²ℤ/4], u=id | termwise determinant ratio1; H⁰=H¹=ℤ/2, nonprojective over ℤ/4 | Pass, [R2] | None (untouched) |
| 5.7 finite-ring local Euler factor | Λ=𝔽₃×𝔽₃, inertia(−1,1) | invariants0×𝔽₃; determinant(1,1−T); inverse(1,(1−T)⁻¹), not1 | Pass, [R2] | None (untouched) |
| 5.7 lift independence/unit constant | unramified line Frobenius a=2 in 𝔽₃; zero stalk | P=1−2T and P=1; constant term1 in each; multiplying Frobenius lift by inertia acts identically on invariants | Pass, [R2] | None (untouched) |
| 5.7 cohomological identity headline | constant 𝔽₃ sheaf on ℙ¹/𝔽₂ | H⁰,H² factors1−T,1−2T; inverse product agrees with Euler zeta, H¹ dimension0 | Pass, [R2] | None (untouched) |
| 5.7 traces do not determine determinant | id on 𝔽₂² versus zero-dimensional module | all power traces0 in both; determinants1−T² and1 differ | Pass, [R2] | None (untouched) |
| 5.8 finite counts/conjugacy/additivity | constant C₂ cover of ℙ¹/𝔽₂ | degree1 counts identity0, nonidentity3; disjoint union count3=0+3; empty count0 | Pass, [R2] | None (untouched) |
| 5.8 progression and explicit bound | trivial cover ℙ¹/𝔽₂, r1,2 | rπ=3,2; main terms3,5; errors0,3; bounds√2+1 and6, respectively | Pass, [R2] | None (untouched) |
| 5.8 geometric/nonabelian coefficient | G=S₃, N=G, class of 3-cycles | class size2, coefficient2/6=1/3; each inverse remains in class. Constant C₃ with N=1 instead has coefficient1 | Pass, [R2] | None (untouched) |
| 6.1 affine adelic points | G=G_a,G_m,α₂ over 𝔽₂(t) | G_a(A)=A; G_m(A)=A× with integral units; α₂(K)=α₂(A)={0}, so smoothness is not silently assumed | Pass, [R2] | None (untouched) |
| 6.1 discrete diagonal/finite stabilizers | G_a, standard integral compact | K∩∏O_v=𝔽_q has q elements; G_m gives 𝔽_q× with q−1 elements | Pass, [R2] | None (untouched) |
| 6.1 model independence | enlarge S by one place | one local integral restriction replaced by the full completion; restricted-product union unchanged | Pass, [R2] | None (untouched) |
| 6.2 function modules/central quotient | G=GL₁, ℙ¹, Ξ degree subgroup3ℤ | double quotient=ℤ/3; all/cpt/cusp modules R³ since no proper parabolic | Pass, [R2] | None (untouched) |
| 6.2 omission of central quotient control | same with Ξ=0 | double quotient=ℤ; finite-support functions R^(ℤ) differ from all functions R^ℤ | Pass, [R2] | None (untouched) |
| 6.2 scalar extension and Hecke | 3-point quotient R=ℤ[1/2]→ℚ | finite-support scalar extension gives ℚ³; translation permutes the three coordinate functions | Pass, [R2] | None (untouched) |
| 6.3 probability constant term | constant function1, any allowed unipotent quotient | integral1=1; zero function gives0, so constant nonzero function is not cuspidal for a proper parabolic | Pass, [R2] | None (untouched) |
| 6.3 stabilizer weights | Heisenberg group, p=2 | orbit weights1/4,1/4,1/2 sum1; unweighted equal averaging1/3 gives different values on an orbit indicator | Pass, [R2] | None (untouched) |
| 6.3 coefficient hypothesis | p=2,R=𝔽₂ versus R=ℤ[1/2] | 1/2 undefined in the first; 2·(1/2)=1 in the second, as required | Pass, [R2] | None (untouched) |
| 6.3 transitivity/equivariance | finite product additive quotient of order4 | iterated average of point indicator=(1/2)(1/2)=1/4=single average; right translation permutes terms | Pass, [R2] | None (untouched) |
| 6.4 reduction root sign | GL₂, g=diag(π^a,1), a=−1,0,1 | log_q\|α(g)\|=1,0,−1=−a; sign reversal changes the escaping chamber | Pass, [R2] | None (untouched) |
| 6.4 anisotropic and torus cases | G=1; anisotropic torus modulo compact centre quotient | no proper-parabolic conditions; finite quotient gives finite-support functions automatically; G=1 module R | Pass, [R2] | None (untouched) |
| 6.4 uniform support and finite generation | GL₁ ℙ¹ modulo degree3, Noetherian R | common support has3 points; module R³ finitely generated; removing Ξ makes quotient ℤ and loses this conclusion | Pass, [R2] | None (untouched) |
| 6.4 flat base change | finite kernel matrix [2]:R→R | R=ℤ[1/3], kernel0; flat ℚ gives0; nonflat 𝔽₂ gives full 𝔽₂, showing flatness matters | Pass, [R2] | None (untouched) |
| 6.5 algebraic eigenvalues/number field model | cyclic 3-point Hecke translation | matrix characteristic polynomial X³−1; eigenvalues1,ζ₃,ζ₃² lie in ℚ(ζ₃), not necessarily ℚ | Pass, [R2] | None (untouched) |
| 6.6 raw versus normalized Satake | GL₂,q_v=4, first Hecke operator | raw4X₁+X₂; normalized2(X₁+X₂); normalized constant term has characters2,1/2 and eigenvalue2(2+1/2)=5=q+1 | Pass, [R2] | None (untouched) |
| 6.6 nested constant terms | GL₃ upper Borel through Levi(2,1) | unipotent dimensions1+2=3; modulus exponents add, so successive square-root factors multiply to the Borel factor | Pass, [R2] | None (untouched) |
| 6.7 Yu nonvanishing headline | n=1 character; zero-vector control | character at identity1≠0; zero vector takes value0 in every degree and is explicitly excluded | Pass, [R2] | None (untouched) |
| 6.7 differential/degree cancellation | g=0,n=2, ω=dt | diagonal Yu degree n(n−1)(g−1)=−2; scalar degree1 contributes2; total0 | Pass, [R2] | None (untouched) |
| 7.1 unramified inducing-character obstruction | E/𝔽₃:y²=x³+2x²+2x, degree2 self-isogeny | E(𝔽₃)={O,(0,0)}; fibre polynomial x²+2x+2 has no root; kernel class maps to η=−1, so odd n is obstructed | Pass, [R2] | None (untouched) |
| 7.1 even n and constant cover | same η,n=2; constant quadratic extension | η²=1 on pullback kernel; constant-cover kernel0; character (−1)^degree upstairs restricts correctly | Pass, [R2] | None (untouched) |
| 7.1 arbitrary finite ramification | local quadratic character conductor2 | a sufficiently small unit subgroup U² is killed, U¹ need not be; open-level extension allows this character | Pass, [R2] | None (untouched) |
| 7.2 induced section normalization | split H₁=GL₂,q_v=4,s=0 | δ_P^(1/2)=\|π\|^(1/2)=1/2; unnormalized exponent s+1/2 and normalized exponent s both give1/2 | Pass, [R2] | None (untouched) |
| 7.2 spherical and arbitrary flat sections | identity/unipotent and scalar multiple2Φ | normalized values1,1; scaled values2,2, so spherical normalization excludes rescaling | Pass, [R2] | None (untouched) |
| 7.2 full fixed-centre parameter | split GL₂, whole-group parabolic | central degrees2ℤ; solutions z²=1 are ±1; identity component alone loses one component | Pass, [R2] | None (untouched) |
| 7.2 cuspidal continuation headline | P=H_n; proper split rank1 Borel | whole-group series one term f, denominator1; Borel constant term two Weyl terms | Pass, [R2] | None (untouched) |
| 7.2 Levi discrete decomposition headline | unitary determinant character on GL₂ | unipotent restriction1, constant term1; square-integrable modulo centre but not cuspidal, hence residual branch necessary | Pass, [R2] | None (untouched) |
| 7.2 discrete-data continuation headline | whole-group residual datum | E=f, intertwiner=id, denominator1; no pole or residue is invented by induction from P=G | Pass, [R2] | None (untouched) |
| 7.2 Siegel convergence/rationality | n=1,q=3,s=1; n=0 | 1>1/2 lies in the asserted region; n0 gives one-term constant series1; period changes q⁻s by exp(−2πi)=1 | Pass, [R2] | None (untouched) |
| 7.2 nonunitary split twist | χ₀=absolute value, g fixed | twist multiplies all summands by the same \|det g\|; relative convergence ratio unchanged1 | Pass, [R2] | None (untouched) |
| 7.3 Hermitian trace pairing | 𝔽₄/𝔽₂, basis1,u with u²+u+1=0 | Tr(x·bar(y)) Gram=[[0,1],[1,0]], determinant1; diagonal rank1 pairing matrix[1] | Pass, [R2] | None (untouched) |
| 7.3 split trace pairing | matrix units E₁₂,E₂₁ | Tr(E₁₂E₂₁)=1; Tr(E₁₂E₁₂)=0; no factor2 | Pass, [R2] | None (untouched) |
| 7.3 Fourier sign/dual | finite 𝔽₃ additive quotient, frequency1 | sum_b ψ(b)ψ(−b)/3=1; opposite extracted frequency gives(1+ζ₃+ζ₃²)/3=0 | Pass, [R2] | None (untouched) |
| 7.3 rational versus adelic Levi | n1,T=1; α_v=π at one place only | local new index π² at that place,1 elsewhere is not rational; rational α=t has global norm1 and rational new index t² | Pass, [R2] | None (untouched) |
| 7.3 local Levi covariance | split rank1,q_v=3, α=(π,1), χ=1,s=0 | factor \|detα\|^(1/2)=3⁻¹/²; omitting Jacobian would give3¹/² | Pass, [R2] | None (untouched) |
| 7.3 factorization volume | g=0,1; n=1,2 | prefactors q,q⁴ and1,1; product-integral quotient volumes q⁻¹,q⁻⁴ and1,1 | Pass, [R2] | None (untouched) |
| 7.3 singular-index control | T=0, split rank1 | constant coefficient has s and−s terms; nonsingular product theorem is not applied | Pass, [R2] | None (untouched) |
| 7.3 ramified local rational factors | Φ_v=0,Φ_v,2Φ_v | factors0,W,2W; unramified split unit line at q3,s0 has W=2/3 | Pass, [R2] | None (untouched) |
| 7.4 representation density | split q3, rank1,N2, Gram1 andπ | counts6,12 modulo9; divide by9 to get2/3,4/3; inert unit line count12/9=4/3 | Pass, [R2] | None (untouched) |
| 7.4 rank and empty embedding | n=0; m=0<n=1 | representation counts1 and0; densities1 and0 | Pass, [R2] | None (untouched) |
| 7.4 cross-dual and half-length | split L=(O,πO), L′=(O,O) | L∨=(π⁻¹O,O); L′/L total length1, half-length1/2, exponent2ℓ′=1 | Pass, [R2] | None (untouched) |
| 7.4 weight polynomial | a=0,1,2; inert q2 | m=1,1−T,(1−T)(1+2T); split a2 uses(1−T)(1−2T) | Pass, [R2] | None (untouched) |
| 7.4 self-dual density and interpolation | n=1,j=0,q3 | split denominator1−1/3=2/3; inert1+1/3=4/3; normalized self-dual value1 | Pass, [R2] | None (untouched) |
| 7.4 nonzero denominator | q2,i=1,j=0, η=±1 | factors1/2 and3/2; neither0. q1 would give a zero factor and is excluded | Pass, [R2] | None (untouched) |
| 7.4 rank-one polynomial | Gramπ, split/inert | overlattice sums1+T and1−T; at T=1 yield2 and0, matching representation obstruction in inert case | Pass, [R2] | None (untouched) |
| 7.4 polynomial functional equation | inert length2 | P=1−T+T²; T²P(1/T)=T²−T+1; constant/leading coefficients1,1 | Pass, [R2] | None (untouched) |
| 7.4 equal-characteristic-two reciprocity | Q=π⁻¹O_𝔽₄²/O_𝔽₄² | three isotropic lines; (1−T)(1+2T)+3T²=1+T+T²=T²P(1/T) | Pass, [R2] | None (untouched) |
| 7.4 negative-integrality control | rank1 Gramπ⁻¹ | L not contained in L∨; quotient L∨/L unavailable; polynomial theorem correctly excludes it | Pass, [R2] | None (untouched) |
| 7.5 local Whittaker/density headline | unit line, split/inert q3,s0 | Den=1, W=L₁⁻¹=1∓1/3, hence2/3 and4/3 | Pass, [R2] | None (untouched) |
| 7.5 oscillator dimension/interpolation | n1,j1, q3 | source rank n+2j=3; argument T=q⁻²=1/9, not −1/3 from an erroneous one-rank increment | Pass, [R2] | None (untouched) |
| 7.5 Whittaker vanishing | inert rank1 Gramπ,s0 | Den(1)=1−1=0, so W=0; self-dual line instead has W=4/3 | Pass, [R2] | None (untouched) |
| 7.6 FYZ coefficient headline | g0,n1, Serre-self-dual E of total degree−2 | exponent −(−2)(s−1/2)−(−2)/2=2s; coefficient χ(detE)q^(2s)L₁⁻¹, Den=1 | Pass, [R2] | None (untouched) |
| 7.6 genus-one and rank-zero cases | g1,degree E0; n0 | exponent0, normalized polynomial1; coefficient χ(detE)L_n⁻¹. n0 gives1 | Pass, [R2] | None (untouched) |
| 7.6 local-to-global density degree | one degree-d place, local length r | local q_v^(−2s) powers give degree2dr in q⁻s, matching the global torsion degree | Pass, [R2] | None (untouched) |
| 7.6 nonintegral Fourier index | one local nonintegral entry, spherical section | local integral vanishes0 by translation character; global coefficient product0 | Pass, [R2] | None (untouched) |
| 7.6 ramified section dependence | replace one local section by2Φ | one factor doubles and global integral doubles; a section-independent density replacement would not | Pass, [R2] | None (untouched) |
| Worked elliptic example | E/𝔽₅, rational x-parameter | pole orders x=−2,y=−3; L(4∞)=span(1,x,x²,y), dimension4=4+1−1 | Pass, [R2] | None (untouched) |
| Worked wild reduced basis | y³−y=t⁻², x=t⁻¹ | pole orders x=−3,y=−2; d=(0,−1,−2), shifted r1 dimension3, r2 dimension6, agreeing 3r for r≥1 | Pass, [R2] | None (untouched) |

## Not verifiable

No new item. The changed passages cite only yoshida and kw, both read legally. The settled limitations of [R2] stand unchanged:

- hess: uncertified;
- rosen: uncertified;
- goss: uncertified;
- stichtenoth: uncertified;
- sga4half: uncertified (statement read in Stacks Tag 03UZ);
- roquette: waived.

No source was fetched and no missing-reference request was made. Ownership was checked against the open pull requests whose files the brief provides and the `roadmaps grep` index.

## Source issues

- **Error** in kw at Theorem 4.12, p. 21 (kw line 1136): the source says `φ₁(U_r)` has `i`-th component `p^⌈log_p(r/i)⌉ W(k)`, which is negative for `i > r`; it should be `p^max(0, ⌈log_p(r/i)⌉) W(k)`, the generators having `j ≥ 0`; affects a stated result.
- **Error** in kw at Proposition 4.14, p. 23 (kw lines 1189–1194): the source says the bound `b` uses `⌈log_p(r/i)⌉` unclamped, so for `p = 2`, `x = β + 2[T⁻³]` and `r = 1` it gives `b = 0` and `H′¹ ⊋ H′⁰`; it should clamp at `0`, giving `b = 1`; affects a stated result (the conductor formula is unaffected).
