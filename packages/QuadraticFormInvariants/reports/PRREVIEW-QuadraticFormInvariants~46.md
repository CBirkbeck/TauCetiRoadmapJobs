# Review of QuadraticFormInvariants (pull request #1215 at 3ef2860)

**Verdict:** needs changes

All seven findings are P3. The mathematics held up: the five headlines elaborate against the pins with no diagnostics. The sampled EKM, Kahn and Serre locators say what the README says. 171 cited Tau Ceti declarations were `#check`ed, and each matches its README statement.

## R01 (P3) — The local-classification headline forces both spaces into one universe

Location: `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` line 100: `[Invertible (2 : K)] {V W : Type v} [AddCommGroup V] …`, stating Layer 6D.

Claim: README 6D (and Conventions: `QuadraticMap.Equivalent` "already compares forms on different spaces") states the classification for any two regular forms. The example only admits `V` and `W` in the same universe.

Witness: Tau Ceti's discharging theorem has independent universes: `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean` line 185, `variable {V W : Type*}`. The example is strictly narrower than both its README statement and its source.

Repair: `universe u v w` (line 37) and `{V : Type v} {W : Type w}` (line 100). Tested on a scratch copy: it elaborates against the pins with no diagnostics, still closed by `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq Q hQ hR`.

## R02 (P3) — Four open pull requests change this folder, the heads conflict, and no order is stated

Location: the pull request's description, which mentions neither QuadraticFormInvariants nor a merge order. This head drops the alias block (`discr`, `wittRing`, `hilbertSymbol_mul`, …) from `Suggested.lean`.

Claim: #617, #1411 and #1797 each rewrite this folder's `README.md` and `Suggested.lean` differently, and #1187 (Tau Ceti bump to `ab00ba392`) edits this `Suggested.lean`. All four conflict with this head. Nothing says which lands first.

Witness: `Suggested.lean` at #1797 line 144, at #617 line 113 and at #1411 line 156 keep `theorem hilbertSymbol_mul`, which this head removes (its README line 44 maps it to `TauCeti.hilbertSymbol_mul_right`). The overlap index records the conflicts.

Repair: in this pull request's description, add one paragraph covering two things.
- What the pull request does to QuadraticFormInvariants (and to GlobalQuadraticForms).
- A merge order: this pull request lands before #617, #1411 and #1797, which drop their QuadraticFormInvariants changes or rebase onto this head. Also say whether #1187's pin bump lands before or after this pull request; whichever lands second rebases its edit of this `Suggested.lean`.

## R03 (P3) — An edit outside the pull request's named folders

Location: `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions, from commit "ClassFieldTheory: review repairs with consumers kept building".

Claim: the folders this pull request owns are QuadraticFormInvariants, ClassFieldTheory and GlobalQuadraticForms. This file belongs to none of them, and the description does not mention it.

Witness: `git diff --stat origin/main...HEAD` without those three folders lists exactly this file. Its hunks rename `ClassFieldTheory.artinMap` to `TauCeti.ClassFieldTheory.artinMap`, `ClassFieldTheory.kummerEquiv_mixed` to `TauCeti.ClassFieldTheory.kummerEquivOfCharZero`, and so on.

Repair: say in the description that this is ClassFieldTheory's consumer repair for its renames, so that LocalGaloisGroups is recorded as this pull request's own folder. Alternatively, move the edit to a separate pull request that merges together with this one.

## R04 (P3) — The supplier table names a file that does not exist

Location: README line 302, Layer 1 row: "`LinearAlgebra/QuadraticForm/Hyperbolic.lean`, `Witt/{Decomposition,Cancellation,Extension}.lean`, `OrthogonalGroup.lean`, `CartanDieudonne/Basic.lean`".

Claim: the reflections and the orthogonal group are cited from `LinearAlgebra/QuadraticForm/OrthogonalGroup.lean`.

Witness: there is no such file at the pinned Tau Ceti. The directory `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/` holds `Basic.lean`, which README line 622 correctly cites. All 173 other `TauCeti/` paths in the README exist.

Repair: replace `OrthogonalGroup.lean` with `OrthogonalGroup/Basic.lean` in the table.

## R05 (P3) — One old → new line points at the wrong replacement

Location: README lines 47–48: "hilbertSymbol_unramified → `TauCeti.exists_unramified_class`, which produces the unit `Δ` of 6A, with `TauCeti.hilbertSymbol_unramified` for its evaluation".

Claim: a consumer of the old name is sent first to `exists_unramified_class`.

Witness: main's `Suggested.lean` line 1216, `hilbertSymbol_unramified u hu b`, evaluates `(u,b)` as `±1` by the parity of `v(b)`, given the norm criterion `hu`. That is `TauCeti.hilbertSymbol_unramified` (`Δ` implicit); `exists_unramified_class` only asserts that such a unit exists.

Repair: "hilbertSymbol_unramified → `TauCeti.hilbertSymbol_unramified`, with the unit implicit; `TauCeti.exists_unramified_class` produces a unit satisfying its hypothesis."

## R06 (P3) — Two statements about consumers do not match the consumers

Location: (a) README line 2703: "QuadraticFormInvariantsPartII, which continues this roadmap past its exclusions: Layers 1, 4 and 7B". (b) README lines 24–28 and `Suggested.lean` docstring lines 23–28, which say `RegularFormClass` and `formClass` are names "that a roadmap on main imports from this namespace".

Witness for (a): the Part II README (lines 67–70 and its "From TauCetiRoadmap.QuadraticFormInvariants" contract) imports Layers 1, 4, 7A, 7B and 9.

Witness for (b): on main only `GlobalQuadraticForms/Suggested.lean` line 367 opens `(formClass discr)` from this namespace, and nothing imports `RegularFormClass`. At this head GlobalQuadraticForms no longer imports this module.

Repair:
- (a) Write "Layers 1, 4, 7A, 7B and 9".
- (b) Say that `formClass` is exported for this file's own statements. Drop `RegularFormClass` from the `export` and from the sentence, since no file uses it.

## R07 (P3) — Five cited works are not in the manifest

Location: README References and the locators throughout. Lam (cited 32 times, marked "PRIMARY"), Gille–Szamuely, Delzant, O'Meara 1955 and Grove are cited but have no entry in `packages/QuadraticFormInvariants/sources.toml`.

Witness: the manifest's ids are `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985` and `ekm2008`. The sources service found no legal copy of Lam or Gille–Szamuely.

Repair: add the five works to the manifest as `uncertified`, each with its DOI or ISBN and the locators the README uses (Lam I–VII and X, p. 119, p. 120; Gille–Szamuely 1.1.9, 1.5.2, 4.4, 4.7; Delzant's C. R. note; O'Meara 1955; Grove, characteristic-two chapters).

## Verified sound

**Gate.**
- The worker's gate passes at 3ef2860.
- My run gives 0 on every check except `outside-folder=4`. The four files are the ClassFieldTheory and GlobalQuadraticForms README and `Suggested.lean`, which belong to this pull request's own folders.
- The gate's outside-folder check does not cover `Completed/`; R03 rests on the diff itself.

**Build.**
- `lake env lean Suggested.lean`: exit 0, no diagnostics at all. The five headlines are discharged by Tau Ceti terms, so there is no `sorry` warning.
- A scratch `#check @` of every declaration in the file gives:
  - `hilbertSymbol : {K} [Field K] → Kˣ → Kˣ → ℤˣ`;
  - `localHasse : {K} [Field K] {n} (Fin n → Kˣ) → ℤˣ`;
  - `hasseInvariant_eq_localHasse` with the four local-field instances and `Invertible 2`.
- This matches the README ("defined over every field"); no binder is lost.
- A negative control, `localHasse ![a, −a] = 1` over an arbitrary field, closes by `simp` with `TauCeti.hilbertSymbol_neg_self`.

**Dependency check.** `depcheck: 237 roadmaps, 2293 edges, 0 problem(s)`. ClassFieldTheory declares no dependency on this roadmap (its README lines 216–220), so there is no cycle.

**Names (800 backticked identifier spans).**
- 723 resolve at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, either as written or under `TauCeti.`.
- The rest are file names, notation (`G_K`, `D₁₆`), roadmap names and namespaces, plus prototypes resolved on main:
  - `Completed/LocalFieldsRamification/Suggested.lean` lines 708, 720, 857 and 870, including the `ramificationIndex K L = 1` wrappers the README describes;
  - `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` lines 431, 3868, 5145, 5332, 5537 and 5846.

**Paths.** 173 `TauCeti/` paths exist. The table's relative paths exist apart from R04.

**Library declarations opened (171 `#check`s, two scratch files).** Each elaborated type matches its README statement:
- Layer 5:
  - `quaternionClass` with `_comm/_mul/_mul_left/_mul_sq_left/_mul_sq_right/_sq/_one_sub/_neg_self/_self/_congr`;
  - `hasseInvariant_add`, `hasseInvariant_mk_rankOne_mul` (exponents `x.rank.choose 2` and `x.rank − 1`) and `omearaHasseSymbol_eq`;
  - `eq_iff_discr_eq_and_hasseInvariant_eq` (rank ≤ 3);
  - `cliffordInvariant_eq_hasseInvariant_mul` (exponents `(rank−1).choose 2` and `(rank+1).choose 4`) and its `I²` form (`m.choose 2`);
  - `cliffordInvariant_add_of_signedDiscr_eq_zero` (only `x` in `I²`; `y` arbitrary);
  - `cliffordHomI2`, `_two_torsion`, `_eq_zero`, `cliffordHomI2Bar_mk` and `fundamentalIdeal_pow_eq_addClosure` (`0 < n`);
  - `QuaternionAlgebra.instIsCentral/instIsSimpleRing`, `completeSquareEquiv`, and the base-change lemmas.
- Layer 6:
  - `card_squareClass` (`4·q^(natCastValuation K 2)`), `unitFiltration_le_square` and `not_unitFiltration_le_square`;
  - `quadraticDefect_eq_maximalIdeal_zpow_or_odd`, `exists_unramified_class` (`v(Δ−1) ≤ v(4)`), `hilbertSymbol_unramified` and `hilbertSymbol_comm` (only `Invertible 2`);
  - `hilbertSymbol_mul_right` (`2 ≠ 0`, local), `hilbertSymbol_oddResidue_formula`, `hilbertSymbol_padicTwo`, and `toMatrix_hilbertSymbolForm_padicTwo = !![1,0,0;0,0,1;0,1,0]`;
  - the rank-2, 3 and 4 isotropy criteria, `exists_of_realization` and `exists_rank_eq_discr_eq_localHasse_eq_iff`;
  - `quaternionSubgroupSignEquiv`, `natCard_quaternionSubgroup = 2`, and the three universe-0 Milestone 2 statements;
  - `index_normGroup_of_isCyclic` (`K L : Type`, cyclic Galois, local).
- Layers 7–9:
  - `cup_kummerClass_eq_zero_iff`, `brauer2EquivH2_quaternionClass`, `brauerCohomologyEquiv_quaternionClass`, `brauerCohomologyEquiv_uliftEquiv`;
  - `RingEquiv.unitsContinuousH2Congr`, which is a genuine pullback along transported Galois groups and coefficients (`Congr.lean` line 147) and is not defined through the comparison;
  - `brauer2EquivH2_hasseInvariant/_cliffordInvariant`, `sw2Class_add`, `galoisEvens_add`, `galoisRes_galoisEvens`, `galoisEvens_galoisRes`, `galoisRes2_eq_zero_iff`;
  - `galoisEvens2_kummerClass` with its `_of_trace_eq_zero/_one_add/_sqrt` forms, `equivalent_traceTransfer_smul_sq_weightedSumSquares_of_sq` (`Tr a ≠ 0`), `discr_formClass_scharlauTransfer_smul_sq`, and `sw1Class_formClass_traceTransfer_smul_sq`.

**Seeded sample (13 targets).**
- "Quaternion algebras are central simple": `ekm2008` lines 20422–20428 (§98.E, p. 389) and 20446–20459 (Ex. 98.10, p. 390). EKM requires a nonsquare `a`; the README routes square `a` through the split case. ✓
- "The quaternion symbol in `Br(K)`": Fact 98.13(1)–(3), lines 20478–20528, pp. 390–391. ✓ (Gille–Szamuely 1.5.2 and Lam III.2.11 are not verifiable.)
- "The Hasse invariant", "Classification in dimension at most three", "The Clifford invariant": Lam only (not verifiable). The formulas were checked independently (table rows 10–13).
- "The `I²` homomorphism": Ex. 14.1, Lemma 14.2 and Thm 14.3 at lines 3432–3450 (pp. 63–64). Lemma 14.2 assumes both forms even-dimensional, as the README says; the extension to odd `r` was checked (row 13). ✓
- "Base change and the remaining API": §98.C, lines 20352–20372 (p. 388). ✓
- "The symbol": `TauCeti.hilbertSymbol_def` equals the README definition. ✓
- "The classical construction": the Tau Ceti hypotheses match. Serre *CiA* III.1.2 is settled as uncertified.
- "Milestone 1": Fact 98.13(3)–(4), lines 20523–20534 (p. 391). ✓ (O'Meara is uncertified.)
- "Milestone 2": the Tau Ceti universe claims match. Serre *LF* XIV §2 is uncertified.
- "Compatibility with the cup product": Ex. 99.5, lines 20851–20860 (p. 395), "(a) ∪ (b) = (a,b)". ✓
- "The value of the Evens norm on a Kummer class":
  - `kahn1984` lines 763–765 (Lemme II.2.1, p. 241) give exactly both cases;
  - the basis `1, √d/a` is at lines 782–788;
  - Théorème 2 is at line 55 (p. 224), with `char ≠ 2` and `E/F` finite separable at lines 36–38;
  - Prop. II.3.5 is at lines 1044–1058 (p. 248);
  - `serre1984cmh` lines 560–562 (Théorème 1′, p. 668) has the `(2)(d_E)` term with `d_E` the discriminant of `E`, as the README stresses. ✓

**Other locators checked.**
- EKM Ex. 99.1(3)–(4) (lines 20800–20821, p. 394) and Ex. 99.7 (line 20901, p. 395).
- EKM §10 (p. 55), and "Arf invariant, 62" in the index.
- EKM II §7 is cited by Mathlib `Radical.lean` lines 17 and 34.

**Cross-roadmap citations resolved.**
- ClassFieldTheory Layers 5 and 14 at this head (headings at lines 1023 and 2026), and its declarations `muNRep`, `kummerClass`, `kummerCupPairing`, `localSymbol`, `invMap`, `h2MuEquivZMod`, `finiteHilbertInvariantAt`, `hilbertProductFormula` and `brauerGroupEquivBr` at the pin.
- ProfiniteCohomology Layers 0–4, 8–10, 12 and 13, SemisimpleAlgebras Layers 4 and 6, and LocalFieldsRamification Layers 0–2, on main.
- Anchors that others cite still exist: `#layer-1-hyperbolic-planes-and-witt-theory` and `#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.
- OrthogonalSpinGroups' three imported names are kept.
- Every dropped name is cited only by main's GlobalQuadraticForms, which this pull request rewrites.
- QuaternionArithmetic and GeometryOfNumbersAndQuadraticArithmeticPartII cite Layers 2, 4, 6, 6C and 9, which all exist.

**Ownership.**
- Br ≅ H² via crossed products: the other crossed-product owners found by `roadmaps grep` concern C*-algebras. SchemeAndStackFoundations cites this roadmap's Layer 7B.
- The Hilbert symbol: ClassFieldTheory and IntegralLattices both name this roadmap's 6C as its owner.
- GeometryOfNumbersAndQuadraticArithmeticPartII declares `gap:quadratic-extension-witt-exactness` on this roadmap's Layer 9 (the Scharlau exact sequence for `F(√a)/F`), which this README does not state. It is a consumer's declared gap, so it is not a finding here.

**Headlines and padding.**
- The README's three high points are all stated, plus the cup-norm theorem.
- Each of the five examples closes with one Tau Ceti term, because Tau Ceti already proves them. They are the headlines, not padding.
- `hasseInvariant_eq_localHasse` needs a rewrite chain, and the private helper only serves its proof.
- The Br ≅ H² comparison is not among the README's high points.

**Outside the two reviewed files.** `STATUS.md` (unchanged) links `README.md#completion-audit-2026-10-28`, a heading this head removes. Regenerating `STATUS.md` fixes this.

### Adversarial table

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Four-fold TFAE (L2 headline) | `a=1`; `(−1,−1)/ℝ`; `(2,5)`, `(5,5)/ℚ₂`; `a=c²` | `(1,b)`: `b=((b+1)/2)²−((b−1)/2)²`, `⟨1,−1,−b⟩` iso at `(1,1,0)` → all 5 true. `ℝ`: `−1≠x²+y²`, `⟨1,1,1⟩` aniso, `ℍ` division → all false. `(5,5)`: `5=5²−5·2²` → true. `(2,5)`: Serre exponent `ω(5)=1` → false. `a=c²`: norm form vanishes at `(c,1,0,0)` → true | holds | none |
| 2 | Local classification (6D) | `⟨1,1⟩` vs `⟨5,5⟩`, `⟨1,1⟩` vs `⟨−1,−1⟩` over `ℚ₂`, `ℚ₃`; `⟨1⁴⟩` vs `⟨(−1)⁴⟩/ℝ` | `ℚ₂`: `d=[1],[1]`; `s=+1,+1`; `⟨1,1⟩` represents `5=1+2²` → isometric ✓. `s=+1` vs `(−1,−1)₂=−1` → not isometric ✓. `ℚ₃`: `(−1,−1)₃=+1`, `1+1≡−1 (3)` lifts → isometric ✓. `ℝ`: `(4,[1],+1)` both, not isometric (local hypothesis needed) | holds; universe | R01 |
| 3 | Cup-norm (7C) | `a=c²`; `b=−a`; `(−1,−1)/ℝ`; `(2,5)`, `(5,5)/ℚ₂` | `a=c²`: `(a)=0`, `b=(x−cy)(x+cy)` solvable. `b=−a`: witness `(0,1)` and `(a)∪(−a)=0`. `ℝ`: both sides false. `(2,5)`: cup ≠ 0 ↔ `5≠x²−2y²`. `(5,5)`: cup 0 ↔ `5=5²−5·2²` | holds | none |
| 4 | Evens value (L9) | `ℚ₂(i)`, `a=1+2i`; `a=1`; `a=√d`; restriction | `1+2i`: `Tr=2`, `N=5` → `(2)∪(5)+(2)∪(−1)=(2)∪(5)≠0` [`(2,5)₂=−1`, `(2,−1)₂=+1`]. `a=1`: `(2)∪(−d)+(2)∪(d)=(2)∪(−1)=0=N(0)`. `√d`: `(2)∪(d)` both. `res`: `(a+ā)∪(−aā)=(a)∪(ā)` by `(u,v)=(u+v,−uv)` | holds | none |
| 5 | Relative `w₂` (L9) | `a=1`; `a=x`; `a=1+2i/ℚ₂(i)` | `a=x`: LHS `w₂⟨1,−1⟩=0`; RHS `(2)∪(d)+(2)∪(d)+(d)∪(−d)=0`. `1+2i`: LHS `w₂⟨2,−10⟩=(2)∪(5)`; RHS `0+(2)∪(5)+(−1)∪(5)` with `(−1,5)₂=+1` → `(2)∪(5)` | holds | none |
| 6 | `hasseInvariant_eq_localHasse` | `n=0,1`; `⟨a,b⟩`; `⟨−1,−1⟩/ℚ₂` | `n≤1`: both sides 1. `⟨a,b⟩` forces `ε[(a,b)]=(a,b)_K`, so `ε` is unique. `ℚ₂`: `ε[ℍ]=−1=(−1,−1)₂`. `#Q(K)=2` gives injectivity | holds | none |
| 7 | `localHasse` Checks | `![a,−a]` any field; `![−1]`, `![−1,2]/ℚ₂` | `(a,−a)=+1` (simp closes in scratch). `![−1]`: empty product `+1`; with diagonal terms `−1`. `![−1,2]`: `s=+1`; O'Meara `(−1)(+1)(+1)=−1=s·(−2,−1)₂` [`x²+2y²≡1,3 (8)`] | holds | none |
| 8 | Quaternion central simple (L5) | `a` nonsquare/square; `ℍ[K,a,0,b]` | EKM 98.E needs `F(√a)` a field; square `a` is split. General hypothesis `c(b²+4a)=b·4a≠0` at `b=0` | holds | none |
| 9 | Symbol API, binary congruence | `⟨2,−1⟩≅⟨1,−2⟩` | `⟨2,−1⟩` represents `1=2−1`, so `[(2,−1)]=[(1,−2)]=1`. The symmetric bilinear `B` with `B([−1],[2])=1` meets the three axioms and fails congruence ✓ | holds | none |
| 10 | `s(λq)`, `s(q⊥r)` (L5) | termwise derivation; `n=0`; `⟨a⟩⊥⟨b⟩` | `∏(λaᵢ,λaⱼ)=s·(λ,−1)^{C(n,2)}·(λ,d)^{n−1}`; `n=0` ℕ-junk exponent 0 vs true `(λ,[1])⁻¹=1`; `⟨a⟩⊥⟨b⟩`: `1·1·[(a,b)]` | holds | none |
| 11 | Classification dim ≤ 3 | general rank 2; `⟨1,1⟩` vs `⟨−1,−1⟩/ℝ` | rank 2: `(a,b)=(a,−ab)`, `(c,d)=(c,−ab)`; equal ⇔ `ac∈N(K(√−ab))` ⇔ isometric. `ℝ`: `d=[1]` both, `s=1` vs `[ℍ]` | holds | none |
| 12 | Lam V.3.20 (L5, L8) | `⟨1ⁿ⟩/ℝ`, `n=1..8`; `⟨−1³⟩`; `⟨1³,−1⟩`; `⟨1,−1³⟩`; `⟨1⁶,−1⟩`; `I²` | `C(n+1,4) mod 2 = 0,0,1,1,1,1,0,0` vs `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ`. `Cl₃,₁≅M₄ℝ` vs `1·[ℍ]³·[ℍ]⁵=1`. `Cl₁,₃≅M₂ℍ` vs `[ℍ]^{3+3+5}=[ℍ]`. `C₀(⟨1⁶,−1⟩)≅Cl₆,₀≅M₄ℍ` vs `A₇=15`, `B₇=70` → `[ℍ]`. `C(2m+1,4)≡C(m,2)` for `m=1..6` | holds | none |
| 13 | `c(q⊥r)=c(q)c(r)`, `q∈I²` | `⟨1⁴⟩⊥⟨1⟩`, `⟨1⁴⟩⊥⟨1³⟩`, `⟨1,1⟩⊥⟨1⟩/ℝ`; exponent parity | `[ℍ]=[ℍ]·1`; `1=[ℍ]·[ℍ]`; off `I²`: `[ℍ]≠1·1`. `(−1,δ)` exponent `2m²+2mk−2m`; `(−1,−1)` exponent even for `m∈{1,2,3}`, `k∈{0..4}` | holds | none |
| 14 | 6B defects over `ℚ₂` | `1, 5, −1, −5, 5/4` | `0, 4ℤ₂, 2ℤ₂, 2ℤ₂` (`−5≡3 (8)`); `5/4−(1/2)²=1` → `δ=0` | holds | none |
| 15 | 6C Gram matrix on `{−1,2,5}` | Serre `ε,ω` at `1,3,5,7` | `ε=0,1,0,1`, `ω=0,1,1,0`; rows `(1,0,0),(0,0,1),(0,1,0)` = `toMatrix_hilbertSymbolForm_padicTwo` | holds | none |
| 16 | 6D isotropy rank 3, 4 | `⟨1,1,1⟩/ℚ₂`; `⟨1⁴⟩/ℚ₂` | rank 3: `s=+1≠(−1,−d)=(−1,−1)₂=−1` → anisotropic (`−1` is not a sum of two squares in `ℚ₂`). rank 4: `d=[1]`, `s=+1≠(−1,−1)₂` → anisotropic (`−1≡7` is not a sum of three squares; the unique quaternary) | holds | none |
| 17 | Realization exceptions | `(1,[1],−1)`, `(2,[−1],−1)`, `(2,[1],−1)/ℚ₂` | first two excluded (empty product; `(a,−a)=+1`); third realized by `⟨−1,−1⟩`: `d=[1]`, `s=−1` | holds | none |
| 18 | Ramified-base control | `K=ℚ₂(π)`, `π²=2`, `a=5` | `(π+½)²−5(½)²=2+π+¼−5/4=1+π`; families `≡1 mod (2)`, `1+π≢1 mod π²` | holds | none |
| 19 | 6B case 3 caveat | `ℚ₂(√2)`, `d=1` | `e=2`; `#𝒪ˣ/𝒪ˣ²=8`; `U(4)·squares` has index ≥ 4 in `𝒪ˣ`; unit norms have index 2 | holds | none |
| 20 | `Pin⁺` conventions | `t=(e₁−e₂)/√2`; Mathlib `pinGroup` | `t²=I`; `e₁t` = rotation by `π/4`, `(e₁t)⁴=−I`; unitary vector: `−Q(v)=1` ⇒ `v²=−1` (order 4) | holds | none |
| 21 | ULift square (7B.5) | transport definitions | `unitsContinuousH2Congr` = pullback along `absoluteGaloisGroupCongr`, `unitsCoeffCongr`; `uliftEquiv` = `CSA.baseChange (ULift K)` | holds | none |
| 22 | Old → new list | main's 18 dropped names | each target's signature matches except `hilbertSymbol_unramified` | slip | R05 |
| 23 | Supplier table paths | 173 + 23 relative | all exist except `OrthogonalGroup.lean` | slip | R04 |
| 24 | Consumer claims | Part II contract; main importers | Part II imports 1, 4, 7A, 7B, 9; `RegularFormClass` imported by none | slip | R06 |

## Not verifiable

- Lam, *Introduction to Quadratic Forms over Fields* (2005): every Lam locator, including the sampled V.3.16, V.3.18, p. 119, V.3.20, p. 120 (Wall caution), V.3.21, V.3.4 and III.2.11. Not in the manifest or the sources cache. The sources service found no legal copy (AMS GSM 67). The formulas were checked by computation (rows 10–13).
- Gille–Szamuely (2017), 1.1.9, 1.5.2, 4.4 and 4.7. The service reached only the CUP landing page; there is no open copy.
- O'Meara 1963 (63:17–18, 63:20, 63:23), Serre *A Course in Arithmetic* (III.1.2 Thm 2 and corollary; IV Thms 6–7, Prop. 6) and Serre *Local Fields* (X; XIV §2): settled as uncertified in the manifest and cited by locator.
- Delzant (1962), O'Meara (1955) and Grove (2002): not in the manifest (R07); no text read.

## Source issues

- none
