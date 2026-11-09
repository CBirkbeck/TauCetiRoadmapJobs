# Review of CategoricalOperatorAlgebras (pull request #888 at 3e67101)

**Verdict:** needs changes

The folder has not changed since the previous review. This full review re-checks all of it. The ownership conflict with the QuantumGroups revision is still there (R01), and the pass found three new defects: the pinned Tau Ceti pivotal API is described as missing and planned again in CA2a (R02), Hartglass–Penneys I Theorem 5.23 is stated beyond the countability its source assumes (R03), and two CA8 headlines are missing from the `Suggested.lean` docstring (R04).

## R01 (P2) — CA1a/CA2a still have two open owners: this folder and the QuantumGroups revision #1705

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". The same claim is in the Downstream consumers bullet at lines 2145–2151. Lines 47–49 make TemperleyLiebOperatorAlgebras Layer 3 the owner of the unitary Temperley–Lieb category.

**Claim.** CA1a and CA2a own these objects, and QuantumGroups consumes them.

**Witness.** QuantumGroups #1705 at `4a56324`, README lines 33–41: "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities; §0.3 … unitary Temperley–Lieb category. CategoricalOperatorAlgebras CA1a–CA2a … consume these objects". Lines 1791–1794 repeat it.

**Status.** Its new head adds the balanced unitary dual functor to §0.2's single-home list (commit "§0.2 balanced unitary dual functor named in ownership and consumers"), so the overlap now also covers Penneys's Theorem A objects. The sign ε is defined at three places: line 394 here, #1705 line 302 and #1649 line 201. On main, `TauCetiRoadmap/QuantumGroups/README.md` line 42 still cites "CategoricalOperatorAlgebras CA1a,CA2a" as its supplier. Neither description states an order between #888 and #1705.

**Repair.** Someone must decide the merge order of QuantumGroups relative to this roadmap. The previous review set out both options; they are unchanged.
- **QuantumGroups after this roadmap** (the order main's line 42 assumes). No edit here. #1705 deletes its §0.2–0.3 restatements and cites CA1a/CA2a and TemperleyLiebOperatorAlgebras Layer 3.
- **QuantumGroups first.** Once a QuantumGroups revision with Layer 0 has merged, replace "single home here" at lines 40–46, for the objects that overlap, with a citation of QuantumGroups §0.2. Make the matching change at lines 47–49 for §0.3. Delete the QuantumGroups bullet at lines 2145–2151. Keep here what §0.2 does not build: W*-categories and W*-Cauchy completion, the multitensor grading groupoid, Penneys's Theorem A and the braided sign law.

**Tested.** After either option, the sign ε of a simple self-dual object has exactly one definition. The dependency check on this README prints 0 problems at this head. The second option adds a supplier edge to QuantumGroups, which is on main, and the check allows edges to main.

## R02 (P2) — The Tau Ceti contract misdescribes the pin and CA2a plans the pinned pivotal API again

**Location.** README lines 116–118: "`…Rigid.DoubleDual` (closed braided double duals). The chosen-dual pivotal comparison for general unbraided multitensor categories is a CA2a target." Lines 2281–2283 repeat it. CA2a builds on it at lines 376–377 (left-dual transport) and 386–387 ("Construct its pivotal comparison and left/right traces").

**Claim.** Tau Ceti has only closed braided double duals, so this roadmap must build the unbraided pivotal comparison, the left-dual transport and the traces. This also gives CA2a a second owner: PivotalSpherical Layer 1 on main (lines 283–290), which the README already cites at lines 119–126, owns this class and these comparisons.

**Witness.** Pinned Tau Ceti `2fd255d9` (also main's pin):
- `TauCeti.PivotalCategory` (`Monoidal/Pivotal/Basic.lean:76`) needs only `[RigidCategory C]`;
- `TauCeti.leftDualIsoRightDual` (`Pivotal/LeftDual.lean:67`);
- `TauCeti.leftTrace`, `rightTrace`, `leftDim`, `rightDim` (`Pivotal/Trace.lean:88–101`).

**Repair.**
1. In the From Tau Ceti bullet, replace the sentence at lines 117–118 with these pinned modules and declarations:
   - `…Rigid.DualFunctor`: `TauCeti.doubleRightDualFunctor`.
   - `…Pivotal.Basic`: `TauCeti.PivotalCategory`, `TauCeti.pivotalIsoApp`.
   - `…Pivotal.LeftDual`: `TauCeti.leftDualIsoRightDual`, `TauCeti.dualFunctorIso`.
   - `…Pivotal.Trace`: `TauCeti.leftTrace`, `TauCeti.rightTrace`, `TauCeti.leftDim`, `TauCeti.rightDim`.
   - `…Pivotal.Spherical`: `TauCeti.SphericalCategory`.
   - `…Pivotal.Torsor`: `TauCeti.PivotalCategory.instTorsor`.
   - `…Pivotal.Grading`: `TauCeti.PivotalCategory.characterEquiv`.
   - `…Grading.Universal`: `TauCeti.universalGradingGroup`.
   - `…Pivotal.PseudoUnitary`: `TauCeti.IsPseudoUnitary`, `TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory`.
   - `…Pivotal.FrobeniusSchur`: `TauCeti.frobeniusSchurIndicator`.
2. At lines 386–387, state the target as "construct the `TauCeti.PivotalCategory` instance that the unitary dual functor induces, and prove positivity of its `TauCeti.leftDim` and `TauCeti.rightDim` and the bi-involution".
3. At lines 376–377, transport left duals through `TauCeti.leftDualIsoRightDual`.
4. At lines 414–418, add one clause each:
   - pseudounitarity here is for multitensor categories, extending `TauCeti.IsPseudoUnitary`, which covers fusion categories over ℂ;
   - the grading groupoid extends `TauCeti.universalGradingGroup`, whose classification `characterEquiv` assumes `[Simple (𝟙_ C)]` (`Pivotal/Grading.lean:44`).
5. Delete the clause at lines 2281–2283.

**Tested.** `End†(Hilb_fd⊕Hilb_fd)` admits no braiding, because `X₁₂⊗X₂₁≅X₁₁` is not isomorphic to `X₂₁⊗X₁₂≅X₂₂`. Even so, `#check @TauCeti.PivotalCategory` at the pin elaborates to `(C) → [Category C] → [MonoidalCategory C] → [RigidCategory C] → Type`, so the unitary dual functor's comparison is an instance of that class. Its `leftDim X=2` and `rightDim X=1/2` at `t=4` are the values of the Check at lines 467–470. The groupoid stays a target, because this category has two unit summands.

## R03 (P3) — Hartglass–Penneys I Theorem 5.23 is stated for uncountable graphs; the source assumes countable ones

**Location.** README lines 1082–1084: "For a connected graph prove `A(Λ,μ)=∅` implies `S(Λ,μ)∩K(F(X))=0` … (Theorem 5.23 and Corollary 5.24, p. 39)". The setting at lines 1020–1022 allows arbitrary cardinality. The Check at lines 1117–1122 then concludes "`S(Λ,μ)` meets no compact operator" for a star with uncountably many leaves.

**Claim.** The theorem holds for connected graphs of any cardinality, on the cited source. The README gives its own route past the source's countability for the K-theory statement (lines 1073–1078), but not for this one.

**Witness.** `HartglassPenneys2014I` line 297 (Notation 2.11, p. 8): vertex and edge sets are countable. Theorem 5.23's proof (lines 1734–1736) uses Lemma 5.21, which the source extends beyond finite graphs only "by standard embedding arguments" (lines 1721–1722).

**Repair.**
1. Write "For a countable connected graph … (Hartglass–Penneys I, Notation 2.11, p. 8; Theorem 5.23 and Corollary 5.24, p. 39)".
2. In the star Check, state the compact-intersection claim for countably infinitely many leaves. Keep the uncountable star for the K₀ claim only, which the continuity route at lines 1073–1078 proves.
3. Alternative: keep arbitrary cardinality and add the route that proves it.

**Tested.** Take the countable star: centre weight 2, leaves indexed by ℕ with weight 1.
- `a_μ(c)=Σ_ℕ 1=∞`, every leaf has `a_μ=2>1`, so `A=∅`.
- The graph is connected, countable and not locally finite, so Theorem 5.23 as printed gives `S∩K=0`.
- Theorem 5.25 ("for any Λ", line 1753) gives `K₀` free on `ℕ⊔{c}` and `K₁=0`.

## R04 (P3) — The `Suggested.lean` docstring omits two CA8 headlines

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` lines 36–38: "CA8, the canonical planar C*-towers: weak closures II₁ factors of Jones index `δ²`, `K₀(A_k) ≅ ⊕_(v ∈ VΓ) ℤ`, Watatani index `δ²` and Pimsner–Popa bases of `N(δ²)` elements".

**Claim.** This bullet lists the CA8 headlines that are not statable at the pins.

**Witness.** README lines 17–18 give as end theorems "the Morita classes, K-theory, ordered K₀ and Watatani index of the canonical planar C*-towers (CA8)", and lines 1227–1248 state them. The bullet omits the Morita equivalence and the ordered K₀.

**Repair.** Add to the bullet "pairwise strong Morita equivalence of the `A_k`; `A₀` simple, uniquely tracial, of stable rank one, with `K₀(A₀)^+` and scale `Σ(A₀)` given by the trace". The missing-carrier clause stays as it is.

**Tested.** These statements lack the same carriers. Neither pinned library has a planar algebra (Mathlib's only hit is a comment in `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:385`), and neither has operator K₀ of C*-algebras.

## Previous findings

- **R01 (previous review): not repaired.** The folder is unchanged, and #1705 moved from `a9eaeef` to `4a56324` while keeping, and widening, its single-home claim. It is carried above as R01.
- **R02 and R03 of the review before that: still repaired.** The text at lines 1703, 1712–1714, 1566–1578 and 2252–2260 is unchanged.

## Verified sound

### Gate, build and form

**Gate.** My run of `gate … --base origin/main` at `3e67101` ends with `OK`, every counter 0:
- `set_option`, `blob`, `latex`, `tex`, `prnum`;
- `sorry-data`, `sorry-examples`, `residue`, `private-paths`;
- `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`;
- `statement-hygiene`, `forbidden`, `dropped`;
- `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`;
- `layer-ids`, `target-ids`, `depcheck`, `metadata`;
- `stray-files`, `dirty`, `outside-folder`, `source-material`.

The worker's run adds `build=0`.

**Folder contents.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md` (2285 lines), `Suggested.lean` (51 lines) and `metadata.toml`. The branch's `lake-manifest.json` equals main's (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 9 s with no diagnostic. The file declares nothing, so there is nothing to `#check` per declaration, no one-tactic probe, and no padding.

**Docstring.** The missing-carrier claims hold at the pins:
- no dagger, C*- or W*-category: Tau Ceti's `Dagger` files are overconvergent algebras;
- no planar algebra, Jones index or hyperfinite factor;
- no operator conditional expectation: every `ConditionalExpectation` hit is measure-theoretic;
- no `CStarModule` tensor product;
- no operator K-theory or Cuntz–Pimsner algebra: Tau Ceti's `Toeplitz` files are Hardy-space operators.

So no headline is statable. R04 is the one gap in the list.

**Policy greps.** The README has no process words, LaTeX delimiters, pull-request numbers or `lemma`.

### Dependency check

`gate --depcheck … --movable --content …` prints `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. This roadmap is at position 227 of the merge order.
- VonNeumannAlgebras is at 5, CStarAlgebras at 7, HilbertModules at 8, OperatorKTheory at 9 and Subfactors at 206.
- FreeProbability, OperatorAlgebraDynamics, PivotalSpherical and QuantumGroups are on main.
- CStarClassification (228) and TemperleyLiebOperatorAlgebras (243) are named only as a scope deferral and as a consumer.

No gaps are declared. `overlaps.md` and `citations.md` list nothing to act on.

### Library names, `#check`ed at the pins in one scratch file (27 names, all elaborate)

**Mathlib.**
- Categories and monoidal structure: `MonoidalCategory`, `MonObj`, `Mon`, `Functor.Monoidal`, `LaxMonoidalFunctor`, `NatTrans.IsMonoidal`, `MonoidalPreadditive`, `MonoidalLinear`.
- Bicategories and centres: `Bicategory`, `EndMonoidal`, `HalfBraiding`, `Center`.
- Duals and idempotents: `ExactPairing`, `exactPairingCongrLeft`, `HasRightDual`, `Idempotents.Karoubi`.
- Analysis: `CStarModule`, `WithCStarModule`, `VonNeumannAlgebra`.
- `Mathlib/CategoryTheory/Monoidal/DayConvolution.lean` exists.

**Tau Ceti.**
- `TauCeti.exactPairingCongrLeft_evaluation`.
- `TauCeti.PivotalCategory`, `doubleRightDualFunctor`.
- `leftTrace`, `rightTrace`, `leftDim`, `rightDim`.

**Read from source.** Four names are in Tau Ceti modules whose `.olean` files are not built, so I read them from the source at the pin:
- `TauCeti.leftDualIsoRightDual` (`Pivotal/LeftDual.lean:67`);
- `TauCeti.PivotalCategory.characterEquiv` (`Pivotal/Grading.lean:49`);
- `TauCeti.IsPseudoUnitary` (`Pivotal/PseudoUnitary/Basic.lean:73`);
- `TauCeti.universalGradingGroup` (`Grading/Universal.lean:53`).

`TauCeti.doubleDualMap` (`Rigid/DoubleDual.lean:72`) is the closed braided map, so the README's description of that one module is right.

### Cross-roadmap citations resolved

**On main.**
- VonNeumannAlgebras:
  - Layers 4, 5, 6, 11, 12 and 13 (lines 970, 1339, 1495, 2785, 3388, 3688);
  - V13b (line 3740): tensor permanence of semidiscreteness, the II∞/III_λ/III₀/III₁ classification, `Ct(R_(0,1))=Int(R_(0,1))` and `ker mod = closure Int`, which the flip step uses;
  - V4.Normality.
- Subfactors §§1.1–1.2, 2.1–2.5, 3.2–3.3, 5.1, 6.1–6.4, 7.1–7.2, 8.1–8.2 and 9.1–9.2 (lines 308–1529). Subfactors' scope (lines 72–73) defers Q-systems and module C*-categories to this roadmap.
- HilbertModules H1–H3; CStarAlgebras Layers 1–5; FreeProbability F2–F4.
- OperatorAlgebraDynamics D6 owns `O_n` (line 590).
- PivotalSpherical Layers 0–4, 9 and 11 (lines 257–626).

**At open heads.**
- OperatorKTheory #866 at `1377338`: K2.3 continuity and σ-unital Morita invariance (line 600), K3.2 six-term sequence (line 762), K4–K6 (lines 933, 1128, 1302), K7.6 Toeplitz–Cuntz algebras and `O_∞` (line 1904). It plans no Cuntz–Pimsner algebra.
- TemperleyLiebOperatorAlgebras #867: Layer 3 consumes CA1a/CA2a (lines 1319–1369).
- VonNeumannAlgebras #1041 keeps Layers 4–13 and V13b.

**Ownership by object.** I searched main and the open heads for Q-systems, Cuntz–Pimsner and Toeplitz–Cuntz–Krieger algebras, W*-categories, tube algebras, anchored planar algebras, the Ocneanu ultrapower, centrally trivial endomorphisms, Watatani index, free graph algebras, bicommutant categories and unitary dual functors.
- Only this roadmap owns them, apart from QuantumGroups #1705 (R01).
- VonNeumannAlgebras treats centrally trivial automorphisms only, which CA9 consumes as V12.
- The Q-system hits in HabiroNahmSeries and RefinedTraceMethods, and the tube-algebra hit in ArcTopologyAndDescent, are unrelated objects.

### Seeded sample

I drew 15 of the 109 page-locator lines of CA1–CA10 with `shuf`, seeded with the head SHA followed by `-14`: 628, 633, 831, 1008, 1231, 1398, 1645, 1646, 1694, 1713, 1718, 1720, 1738, 1741, 1813. All 15 are exact at the printed page and support the statement as written. The rows are below.

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CHJP Cor. 3.37, line 627–628 | one-object `Hilb(ℤ/2)`, `Q=1⊕g`; `Hilb_fd`, `Q=M_n` | `X=n₀1⊕n₁g`: `X⊗X̄=(n₀²+n₁²)1⊕2n₀n₁g`; `n₀²+n₁²=1=2n₀n₁` has no solution in ℕ; `M_n=ℂⁿ⊗(ℂⁿ)‾` | completeness of QSys(C) is `QSys(QSys(C))≃QSys(C)`; `CHJP2021` line 1164, p. 27 | none |
| CHJP Thm A, Lemma B, line 633 | `B=ℂ`, `Q=M₂` in `C*Alg(ℂ→ℂ)` | `\|Q\|=M₂(ℂ)`; `X=M₂` as ℂ–M₂ correspondence, `X⊗_(M₂)X̄≅K(X)=M₂`, dim 4 = dim Q | lines 122, 131 (p. 3), §4 at line 1207 | none |
| JP *Realizations* Cor. E, line 831 | `N⊆N⋊(ℤ/2)²`, `N⊆N⋊ℤ/3`, outer | 5 subgroups ↔ 5 algebras `ℂ[H]⊆ℂ[G]`; ℤ/3: 2 and 2 | line 235, p. 6 | none |
| Katsura Prop. 8.1, line 1008 | `X=ℂⁿ` over ℂ; zero action | `J_X=ℂ`, `K(F(X))≅K`, `K₀: ℤ→ℤ`, `[1]↦[rank-one]` iso; `J_X=0`: `0→0` | line 715, p. 17; Morita from `J_X⊆F(X)J_X` full | none |
| HP II Remark 4.18, line 1231 | shaded TL(√2), Γ=A₃ | `V(Γ₊)={f₀,f₂}`, `V(Γ₋)={f₁}`: `K₀(A_(0,+))=ℤ²`, `K₀(A_(0,−))=ℤ=K₀(A_(1,+))`; ranks 2≠1 | lines 649–656, p. 16 | none |
| HP2015 Thm 3.5; HP2020 3.15–3.16, line 1398 | `Hilb(ℤ/2)` in `R_λ`; type I `B(H)` | `R_λ`: outer `⊗Ad diag(1,−1)`, `End=ℂ`, `Hom(g,1)=0`; `Bim(B(H))≃Hilb` forces `Hom(g,1)≠0` | lines 910, 776, 789 (pp. 17, 16) | none |
| Tomatsu Prop. 2.7, line 1645 | II∞, `ρ=Σv_i·v_i*`, `σ=Σw_i·w_i*` (n=2); `id` vs ρ | `u=Σw_iv_i*`: `uρ(x)u*=σ(x)`; both `τ∘φ=τ/2` (r=2); `id`: `τ∘φ=τ` (r=1) | line 457, p. 10; same rank needed | none |
| Tomatsu §2.4 setting, line 1646 | `R_II₁` | finite, excluded; README line 1643 "infinite factor with separable predual" = line 376, p. 8 | as stated | none |
| MT Def. 4.1, line 1694 | `M_n`; `R_II₁` with `α=⊗Ad diag(1,−1)` | `(M_n)_ω=ℂ`: all ρ centrally trivial; `x_n=[[0,1],[1,0]]` at slot n, `α(x_n)=−x_n`, so `α^ω≠id` | line 1364, p. 30 | none |
| Izumi Thm 3.3 + Rem. 3.8, line 1713 | `R_½`; III₀ | `σ_t` inner ⇔ `2^(−it)=1` ⇔ `t∈(2π/log 2)ℤ`; III₀ has higher-dimensional modular endomorphisms (line 722) | lines 376, 716 (pp. 9, 17) | none |
| MT Thm 4.6, line 1718 | `id⊕σ_t^φ` on `R_III₁`; `R_II₁` | sum, conjugate `σ_(−t)` centrally trivial; on `R_II₁` two isometries with `v₁v₁*+v₂v₂*=1` force `τ(1)=2τ(1)` | line 1401, p. 31; infinite needed | none |
| MT2007 Lemma 8.3, line 1720 | `β=id⊕α`, α centrally free | β centrally nontrivial, yet `a=v₁≠0` gives `β^ω(x)v₁=v₁x=xv₁` | line 3071, p. 65; irreducibility needed | none |
| MT Props 4.8–4.9, line 1738 | `σ_t^φ` on `R_III₁`; `L(F₂)⊗̄B(ℓ²)` | `σ_t^(φ⊗τ)=σ_t^φ⊗id`; `M_ω=ℂ`, not II₁, excluded | lines 1460, 1464, 1478 (p. 33) | none |
| MT p. 35, II∞ step, line 1741 | `ρ=Ad u`; 2-fold amplification | `Hom(id⊗id,ρ⊗ρ̄)=Hom(id,ρ)⊗Hom(id,ρ̄)`; `Ad u`: `ℂu`; amplification: `Hom(id,ρ)∋v₁,v₂` (reducible) | lines 1543–1552 | none |
| HP2020 Lemma 3.6, Cor. 3.8, line 1813 | `R_λ`, `σ_(t₀)`; `R_III₁` with `Hilb(ℤ)`; `L(F₂)⊗̄B(ℓ²)` | `λ^(it₀)=−1`, `t₀∉(2π/\|log λ\|)ℤ`; `σ_(nt)` outer for n≠0 by `T={0}`; `M_ω=ℂ` | lines 608, 618 (p. 13); II∞/III₁ and finite Irr(C) needed | none |
| CA2a Penneys Thm A, lines 420–434 | `Hilb(ℤ/2)`; `End†(Hilb_fd⊕Hilb_fd)`, t=4 | `χ(g)²=1⇒χ=1` (ℂ× allows ±1); `dim_L=2`, `dim_R=½`, ratio 4; weights 1/5, 4/5 give 2/5 = 2/5; equal weights give 1 vs ¼ | as stated | R02 (carrier) |
| CA2a signed self-duality, lines 394–410 | `J(a,b)=(−b̄,ā)`, `J′(a,b)=(b̄,ā)`; ℂ | `J²=−1`, `J′²=1`; on ℂ `J²(a)=\|c\|²a=a`; `(J⊗J)²=+1=(−1)(−1)` | as stated | R01 (owner) |
| CA2b Penneys Thm C, lines 485–495 | `u₁—w—u₂`; TL Gram | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; `det[[δ²,δ],[δ,δ²]]=δ²(δ²−1)>0` for δ>1 | as stated | none |
| CA3 normalization, lines 636–648 | `M_n`, `⟨x,y⟩=n⁻¹Tr(x*y)` | `mm†=n²`; `m′=n⁻¹m`: `m′m′†=1`, `i′†i′=n²`, `i′†m′=i†m`; `d_Q⁻¹` rescaling gives `n⁻²`; `f′=nf`: `f′(1)=n·1=i₂′(1)` | as stated | none |
| CA4 JP *Q-systems* Thm A, lines 730–736 | trivial object; transpose on `M₂` | `d_Q=1`, `A(1)=ℂ`; `Σe_ij⊗e_ij↦` flip, eigenvalue −1 | as stated | none |
| CA5 JP *Realizations* Thm A, lines 822–829 | `N⋊ℤ/2`; `N⋊ℤ` | `d_Q=2`; ℤ: infinite index, connected, not compact | as stated | none |
| CA6 HPT *Anchored* Thm A, lines 917–919 | `V=C=Hilb_fd`, `x=ℂ^k`; `V=Hilb(ℤ)`; `P[0]=ℂ²` | `dim P[n]=k^n` vs `k^(2n)`; infinite support; `‖(1,0)‖²=½` | as stated | none |
| CA7 Katsura Thm 8.6, lines 995–1001 | `ℂⁿ`, n=1,2,3; zero action; `ℓ²(I)` | `1−[X]=1−n`: (ℤ,ℤ), (0,0), (ℤ/2,0); `J_X=0`: `O_X=T_X`; `ℓ²(I)`: `K₀=ℤ`, `K₁=0` | line 764, p. 18, no separability | none |
| CA7 HP I Thm 5.25, lines 1068–1078 | one loop, μ=1; one edge (16,1) | `C([−2,2])`: `K₀=ℤ`, `K₁=0`; `a²μ(w)=4=a⁻²μ(v)`; `a=½`: ¼ vs 64 | line 1753; README's continuity route covers uncountable graphs | none |
| CA7 HP I Thm 5.23, lines 1082–1085 | countable and uncountable star | countable: `a_μ(c)=∞`, leaves 2>1, A=∅, source applies; uncountable: excluded by Notation 2.11 | stated beyond source, no route | R03 |
| CA8 HP II Thms A–C, Cor. 5.18, lines 1227–1252 | TL(√2), A₃ | `K₀=ℤ³`, `τ_*(a,b,c)=a+√2b+c`; `[p_(f₁)]−[p_(f₀)]` trace `√2−1` in Σ; `[p_(f₀)]−[p_(f₂)]` trace 0 | as stated | R04 (docstring) |
| CA8 HP II Thm 6.13, Watatani, lines 1266–1311 | δ²=2, (3+√5)/2, 3, 4; `ℂ⊂ℂ²` | N=3,3,4,5; index `(3,3/2)` vs `2·1` | line 1229, p. 27 | none |
| CA9 HNP Thm A, transpose, lines 1341–1356 | Hilb, `F=−⊗ℂ^k`; pairs, `F(c₁,c₂)=(0,c₁)` | `F^t=−⊗(ℂ^k)‾`; dims 6 vs 1 for `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | as stated | none |
| CA9 existence and uniqueness, lines 1379–1410 | `R_λ`, `R_II₁`, `R_III₁`; `M_n` | `M_n⊗̄R_II₁≅R_II₁≠M_n`; `R_λ` has two non-isomorphic fully faithful `Hilb(ℤ/2)` representations | as stated | none |
| CA9 right standardizability, lines 1504–1511 | `R_II∞`, `H=pL²(M)` with p finite | a unital normal left action `M→pMp` would send an isometry onto a proper isometry of a finite algebra: impossible; so the support is infinite and `~1` | sound | none |
| CA9 Tomatsu Thm D, factor case, lines 1799–1808 | a factor M | `Z(M)=ℂ`, so the invariant state is automatic; source (lines 76–80) is for properly infinite M | as stated | none |
| CA10 HPT *Classification*, lines 2081–2102 | `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)`; `r=±id` | tube dims 4, 9, `36=1+1+4+9+9+4+4+4`; `ūru⁻¹=(−i)r(−i)=−r` | as stated | none |
| Owner of ε (R01) | this README; #1705; #1649; main QuantumGroups | lines 394; 302; 201; main line 42 cites CA1a,CA2a | two single-home claims | R01 |
| Unbraided pivotal comparison (R02) | `End†(Hilb_fd⊕Hilb_fd)`, no braiding | `TauCeti.PivotalCategory` needs only `[RigidCategory C]`; `leftDim X=2`, `rightDim X=½` at t=4 | pinned, not missing | R02 |

The rows of the earlier tables for the untouched statements stand: the text they computed on is byte-identical at this head.

## Not verifiable

- **Kosaki 1986**, §3 and Lemma 3.2 (J. Funct. Anal. 66): `uncertified`, paywalled; cited through `Burns2011`.
- **Izumi 1993**, Theorem 3.5 (Math. Scand. 73): `uncertified`; cited as recalled in Masuda–Tomatsu 2009, Theorem 4.16.
- **Popa 1995**, Theorem 3.5(ii) and Corollary 4.4: `uncertified`, no legal open copy.
- **Izumi 2003**, published page numbers (Amer. J. Math. 125): I read the arXiv text (`Izumi2003`); the README cites arXiv printed pages and says so at line 2247.

## Source issues

- **Misprint** in `HartglassPenneys2014II` at Remark 4.18, printed p. 16: the source gives A_n with n≥3 as the principal graphs of TL(δ) for δ=2cos(π/k), k≥3. It should read k≥4, since δ=2cos(π/k) has graph A_(k−1) and δ>1 is assumed. This affects nothing.
