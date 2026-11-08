# Review of CategoricalOperatorAlgebras (pull request #888 at a926373)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` and `Suggested.lean` at `a926373`. The 225 lines changed since `acb81cf` are read in context, and so is every other passage of the README.

## Previous findings

- **R01 (P2), two open owners of the CA1a/CA2a objects: not repaired.** The README's lines 25–30 and 1796–1798 are unchanged, and so are both QuantumGroups revisions: #1705 is still at `a938955c` and #1649 still at `968db790`. Neither cites this roadmap, and the pull request description does not mention them. Carried below as R01.
- **R02 (P3), Checks: repaired.** (i) Lines 1612–1617 add the pair-of-Hilbert-spaces Check, where `F(c₁,c₂)=(0,c₁)` has transpose `(d₂,0)`. This gives dimension 6 against 1 for `F^t=F`. Lines 1605–1611 now say plainly that the `ℂ^k` dimension count does not discriminate. (ii) Lines 427–436 add the spherical-state Check ("the weights `1/5` and `4/5` give `2/5` on both sides"). (iii) Lines 1005–1013 add the `J_X` Check (`1−[X]=1−n`, `K₀(O_n)=ℤ/(n−1)`, zero action gives `O_X=T_X`). (iv) Lines 730–735 add the Stinespring Check ("`K=M₂(ℂ)` has dimension 4"). Each is recomputed in the table below.
- **R03 (P3), headings: repaired as requested.** Line 10 is now `## Scope and ownership` and line 43 `## Conventions`. Every layer ends with `### Examples` and `### Dependencies` (lines 314/323, 517/524, 639/646, 740/746, 802/809, 913/920, 1028/1035, 1191/1196, 1625/1633, 1784/1790), and line 1803 is `## References`. The layers keep `## CA1.` … `## CA10.` headings. This matches the closest siblings on main (`## F1.` in FreeProbability, `## D1.` in OperatorAlgebraDynamics, `## Q1.` in QuantumGroups), and 84 of the 142 roadmaps on main also do without `## Layer k:`. Not raised.

## R01 (P2) — The C*-category and unitary-duality objects of CA1a and CA2a still have two open owners

Carried from the previous report (its R01). Nothing has changed at either head.

**Location.** `README.md` lines 25–30 ("C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories with solutions of the conjugate equations … (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a"). Also lines 1796–1798 (Downstream).

**Claim.** This roadmap is the single owner, and QuantumGroups consumes CA1a and CA2a.

**Witness.** On main this is true: `TauCetiRoadmap/QuantumGroups/README.md` line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a". At the open revisions it is false:
- #1705 (`a938955c`), lines 21–23, says "Layer 0 owns … elementary C*-categories with standard conjugates". Its §0.2 (line 194 onward) builds `‖f†f‖=‖f‖²`, the dagger Karoubi completion, standard solutions, `d(X)≥1` and the signed self-duality `bar(r)r=εφ_X`.
- #1649 (`968db790`) does the same in lines 21–23 and §0.3 (line 236).
- A grep of both heads finds "CategoricalOperatorAlgebras" zero times.

**Repair.** A revision of a roadmap on main is never a dependency, so this folder keeps its text and remains the owner. The fix is on the QuantumGroups side, and both revisions are by the same author. In #1705 and #1649, replace §0.2 (respectively §0.3) and the C*-category and standard-conjugate parts of their Layer 0 scope with citations of CA1a and CA2a, as main's line 42 does. Until that is done, state the order in this pull request's description: #1705 and #1649 are rebased to consume CA1a and CA2a before either merges.

## R02 (P3) — "Masuda–Tomatsu, Lemma 8.2" points into a paper the References do not list

**Location.** `README.md` lines 1443–1445 ("Prove the required implication from central to strong freeness (Masuda–Tomatsu, Lemma 8.2, as cited by Tomatsu Remark 2.17(1))"). The only Masuda–Tomatsu entry in References (lines 1836–1839) is arXiv:0802.0344.

**Claim.** The lemma is in the cited Masuda–Tomatsu paper.

**Witness.**
- Tomatsu (arXiv:1812.04222), Remark 2.17(1), p. 16, cites "[38, Lemma 8.2]". Its bibliography identifies [38] as Masuda–Tomatsu, *Classification of minimal actions of a compact Kac algebra with amenable dual*, Comm. Math. Phys. 274 (2007).
- In that paper (arXiv:math/0604348), Lemma 8.2 is in the Appendix, p. 64: properly centrally nontrivial is equivalent to strongly outer.
- arXiv:0802.0344 has Sections 1–4 only and no Lemma 8.2.

**Repair.**
- Add to References: Masuda–Tomatsu, *Classification of minimal actions of a compact Kac algebra with amenable dual*, Comm. Math. Phys. 274 (2007), arXiv:math/0604348, Lemma 8.2 (Appendix, p. 64), for central freeness implying strong freeness.
- At line 1444, write "(Masuda–Tomatsu 2007, Lemma 8.2; Tomatsu, Remark 2.17(1))".

## R03 (P3) — Two statements narrower than their sources

**Location.**
- (a) `README.md` lines 1252–1256: "This constructs the fully faithful realization in Bim(R), R hyperfinite II₁. Tensor the realized bimodules with … B(ℓ²) or the hyperfinite III₁ factor".
- (b) Lines 938–940: "For separable B and countably generated X build the Toeplitz KK-equivalence with B and the cyclic six-term K sequence".

**Claim.**
- (a) Existence of fully faithful representations is asserted for R_II₁, R_II∞ and R_III₁ only.
- (b) The Pimsner six-term sequence, a headline in the `Suggested.lean` docstring, is asserted only for separable B and countably generated X.

**Witness.**
- (a) Henriques–Penneys (arXiv:1511.05226), Theorem 3.5, p. 17, proves the result for every hyperfinite factor that is not of type I. So does Henriques–Penneys (arXiv:2004.08271), Corollary 3.16, p. 16. Both tensor the II₁ embedding with R through `R⊗̄R_II₁≅R` (arXiv:1511.05226, Lemma 3.4, p. 16).
- (b) Katsura (arXiv:math/0309088), Theorem 8.6, p. 18, gives the exact sequence with first map `ι_*−[X]` for every C*-correspondence over every C*-algebra. Separability appears only in the KK statements after it.

**Repair.**
- (a) Add the target `R⊗̄R_II₁≅R` for hyperfinite non-type-I R (arXiv:1511.05226, Lemma 3.4; input: VonNeumannAlgebras V13b's classification of injective factors). Then construct the fully faithful realization in Bim(R) for every such R. Keep II∞ and III₁ as the instances that representation uniqueness and CA10 use. Tested on R = R_λ (0<λ<1) and C = Hilb(ℤ/2): an outer ℤ/2-action on R_λ gives `g↦_gL²(R_λ)`, fully faithful, which the current text never constructs.
- (b) State the K-theory six-term sequence for every C*-correspondence, citing Katsura, Theorem 8.6. Keep the Toeplitz KK-equivalence and the description of the first map in `KK(J_X,B)` under separable B and countably generated X. Tested on X = ℓ²(I) over ℂ with I uncountable (not countably generated): `1` is not compact, so `J_X=0`, and Theorem 8.6 gives `K₀(O_X)=ℤ`, `K₁(O_X)=0`, a case the current statement excludes.

## R04 (P3) — Three groups of targets have no source anywhere in the README

**Location.**
- (a) `README.md` lines 926–946: Katsura's ideal `J_X=φ⁻¹(K(X))∩(kerφ)^⊥`, covariance, the universal and gauge-invariant uniqueness theorems, the Toeplitz equivalence and the six-term sequence.
- (b) Lines 484–499: the correspondence between connected right planar modules and indecomposable pivotal right module C*-categories with simple basepoint.
- (c) Lines 1417–1427: the general Ocneanu ultrapower `M^ω=N^ω/T^ω` and `M_ω⊆M′∩M^ω`.

**Claim.** Every theorem carries a locator.

**Witness.**
- (a) "Katsura" occurs 0 times in the README. Hartglass–Penneys Part I, the only CA7-related source listed, follows Pimsner and assumes the left action is by compact operators (arXiv:1401.2485 line 166). It does not treat `J_X`.
- (b) No reference covers it. The source is Coles–Huston–Penneys–Srinivas, Theorem A (arXiv:1810.07049, p. 3; body statement §2.3, p. 10). Subfactors 7.3 (main, line 1328) hands exactly this equivalence to this roadmap.
- (c) No locator is given. Tomatsu §2.2 (p. 5) and Masuda–Tomatsu (arXiv:0802.0344) §2.4 (p. 5) define exactly these `T^ω`, multiplier algebra, centralizing sequences and `M_ω⊂M′∩M^ω`.

**Repair.**
- (a) Cite at the claims, and add to References: Katsura, *On C*-algebras associated with C*-correspondences*, J. Funct. Anal. 217 (2004), arXiv:math/0309088. Use Definition 3.2 (`J_X`, p. 5), Definition 3.4 (covariance), Theorem 6.4 (gauge-invariant uniqueness, p. 14), Propositions 8.1–8.2 and Theorem 8.6 (p. 18).
- (b) Cite "Coles–Huston–Penneys–Srinivas, Theorem A" at line 485 and add the paper to References.
- (c) Cite "Tomatsu §2.2; Masuda–Tomatsu §2.4" at line 1417, and extend the two References entries accordingly.

## R05 (P3) — CA10 restates "the centre of a fusion category is fusion", which PivotalSpherical Layer 11 owns on main

**Location.**
- `README.md` lines 1676–1677: "Recover the unitary half-braiding from these simple modules and prove Z(C) is unitary fusion".
- The supplier row at lines 98–101 ("Layers 0–4 and 9").
- CA10's `*Needs:*` (line 1782) and Dependencies (line 1792), which omit PivotalSpherical.

**Claim.** CA10 proves that Z(C) is a fusion category.

**Witness.** `TauCetiRoadmap/PivotalSpherical/README.md` (main) line 626 has "Layer 11: the centre of a fusion category is a fusion category". Layer 11 builds the induction functor `⊕_S S⊗X⊗Sᘁ` with its half-braiding, semisimplicity of `Center C` in characteristic 0, simple unit, finitely many simples, and `dim Z(C)=(dim C)²`.

**Repair.**
- Cite PivotalSpherical Layer 11 for finite semisimplicity, simple unit and finiteness of `Center C`, and add "Layer 11" to the supplier row and to CA10's `*Needs:*` and Dependencies.
- Keep in CA10 only what Layer 11 does not state: unitary half-braidings and `Z†(C)=Z(C)`, the dagger and canonical spherical unitary dual functor, the tube-algebra identification, and finite semisimplicity of the relative `Z_C(E)`.
- Tested on C = Hilb(S₃): Layer 11's formula gives `dim Z(C)=6²=36`, equal to the CA10 Check's `1+1+4+9+9+4+4+4`.

## Verified sound

**Gate and build.**
- The full push gate (`gate … --base origin/main`) at this head prints every check at 0: `set_option`, `sorry-data`, `prnum`, `round-labels`, `layer-ids`, `target-ids`, `depcheck`, `stray-files`, `outside-folder`, `source-material`, `statement-hygiene`. The worker's run also has `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` exits 0 in 16.5 s with no diagnostic. The file declares nothing, so there is no `sorry`, no one-tactic probe, no `#check` signature comparison and no fully qualified name that could clash with a sibling file.

**Dependency check.** `gate --depcheck … --movable --content …` printed `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: VonNeumannAlgebras 6, CStarAlgebras 8, HilbertModules 9, OperatorKTheory 10, Subfactors 207, this roadmap 229, CStarClassification 230 (a scope pointer only), TemperleyLiebOperatorAlgebras 245 (a consumer).
- On main: FreeProbability, OperatorAlgebraDynamics, PivotalSpherical, QuantumGroups, Subfactors and VonNeumannAlgebras.
- Declared gaps: none (no `design/plan.json`).

**Headline theorems and `Suggested.lean`.** The README's headlines are:
- CA2a: Penneys Theorem A.
- CA2b: Penneys Theorem C.
- CA3: Q-system completion (Chen–Hernández Palomares–Jones–Penneys Theorem 3.36 and Theorem A).
- CA4: Jones–Penneys Theorem A.
- CA5: Jones–Penneys relative equivalence.
- CA6: Henriques–Penneys–Tener Theorem A.
- CA7: six-term sequence and `K_*(S(Λ,μ))`.
- CA8: towers of index δ², `K₀(A_k)`, Watatani index δ², `N(δ²)` bases.
- CA9: Henriques–Nivedita–Penneys Theorem 7.4, representation existence and uniqueness, and the factor case of Tomatsu Theorem D.
- CA10: classification bijection.

The module docstring names all ten with the missing carrier. These carrier claims were checked at the pin. Mathlib has `CStarModule` (`Analysis/CStarAlgebra/Module/{Defs,Constructions,Synonym}.lean`, with no interior tensor product), `CompletelyPositiveMap` (`Analysis/CStarAlgebra/CompletelyPositiveMap.lean`) and `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:67`). There is no dagger or C*-category: a grep for "dagger" finds only `Probability/Kernel/Posterior.lean`. There is also no factor predicate, operator K-theory, Cuntz–Pimsner algebra or planar algebra in Mathlib or Tau Ceti. No headline is statable, and no padding is present.

**Library declarations opened at the pins (14).**
- Mathlib:
  - `HalfBraiding` at `CategoryTheory/Monoidal/Center.lean:53`, with `β : X ⊗ U ≅ U ⊗ X` (the orientation CA6 uses), and `Center` at :72.
  - `MonObj` at `Monoidal/Mon.lean:72` and `Mon` at :251.
  - `EndMonoidal` at `Bicategory/End.lean:24`.
  - `ExactPairing` at `Monoidal/Rigid/Basic.lean:77`, `HasRightDual` at :236 and `exactPairingCongrLeft` at :596.
  - `MonoidalPreadditive` at `Monoidal/Preadditive.lean:35` and `MonoidalLinear` at `Monoidal/Linear.lean:33`.
  - `Linear` at `Linear/Basic.lean:46`.
  - `CStarModule` at `Analysis/CStarAlgebra/Module/Defs.lean:72`, with `inner x (a • y) = a * inner x y`. Over `Bᵐᵒᵖ`, read through `unop`, this is `⟨x,yb⟩=⟨x,y⟩b`, as CA1a says.
  - `Monoidal/DayConvolution.lean` exists.
- Tau Ceti: `TauCeti.exactPairingCongrLeft_evaluation` at `CategoryTheory/Monoidal/Rigid/Basic.lean:44`, `mapExactPairing` at `Rigid/Functor.lean:75`, and `doubleDualMap` at `Rigid/DoubleDual.lean:65` (built from internal Homs, as the contract says).

**Cross-roadmap citations resolved (all present where cited).**
- VonNeumannAlgebras on main:
  - V4 (line 970), with Sakai's theorem at 987.
  - V5 (1339): halving and countable splitting for σ-finite properly infinite algebras.
  - V6 (1495).
  - V11: standard form 2856, tensor commutation 2873, core with `θ_s(u_t)=e^{ist}u_t` and `Tr∘θ_s=e^s Tr` at 3264–3268.
  - V12 (3388): predual-centralizing sequences 3407 and a tracial ultrapower only (3436), so the general Ocneanu ultrapower is correctly owned here.
  - V13 / V13a / V13b (3688–4186).
- Subfactors on main:
  - 1.1 (308), and 1.2 (340) with the opposite weight and unitors.
  - 2.1–2.5 (387–536), with `Ind(E₀)=d(X)²≤[M:N]` in 2.5.
  - 3.2 (697) and 3.3 (774).
  - 5.1 (1021): `E_N` minimal iff extremal iff `d(X)²=[M:N]`.
  - 6.1–6.4 (1089–1210), 7.1–7.2 (1248, 1272), 8.1–8.2 (1384, 1425), 9.1–9.2 (1507, 1529).
  - Its scope (72–77) and 7.3 (1328) assign Q-systems, module categories and the planar-to-C* completions here.
- FreeProbability on main: F2 (184), F3 (255), F4 (353).
- OperatorAlgebraDynamics on main: D6 owns `O_n` (line 457). At the #1137 head (`08edaf59`) it does too (line 2668).
- PivotalSpherical on main: Layers 0–4 and 9.
- CStarAlgebras #860 (`33ddcef7`): C1–C5, with CP maps and Stinespring in Layer 4 (984–1021) and inductive limits in 5.4 (1203).
- HilbertModules #861 (`bbc2ad54`):
  - H1: `MulOpposite.unop`.
  - H2: `θ_(x,y)`, `K_A(A)≅A`, `L_A(A)≅M(A)`.
  - H3: the unitors (the left one for nondegenerate actions), imprimitivity bimodules, conjugates, evaluation unitaries, `K_B(E⊕B)`, the Rieffel correspondence and Morita invariance of simplicity.
- OperatorKTheory #866 (`5dbc4acd`): K1–K6 (boundary maps 663, K4 828, KK 1018, Kasparov product 1191). Its K7.6 Cuntz computation agrees with the CA7 `O_n` Check.
- Consumers:
  - TemperleyLiebOperatorAlgebras #867 (`7cf3feef`): lines 106, 323, 1335, 1339, 1372, 1443 cite CA1a and CA2a only.
  - QuantumGroups on main, line 42.

**Ownership by object** (`roadmaps grep -i --readme-only`, over main and the 467 open heads):
- "Cuntz–Pimsner", "anchored planar", "bicommutant categor", "Watatani" and "Ocneanu ultrapower" occur only here.
- "W*-categor": here and #867 (a deferral to this roadmap).
- "tube algebra": here and #1755 (an unrelated ring-theoretic use).
- "Q-system": here, Subfactors main (assigning it here), #1427 and #1493 (unrelated q-series and ind-object uses).
- "C*-categor" and "unitary dual functor": here, #867 and QuantumGroups main as consumers, and #1705/#1649 as owners (R01).
- FactorRigidity (main) cites HilbertModules H1–H3 for interior tensor products and owns none of these objects.
- The overlaps listing names no pull request that changes this roadmap and no dropped id.

**Policy.** The README contains no process word, pull-request number, LaTeX delimiter or machine path. `roadmaps resolve` reports no unresolved citation or Lean name.

**Source sample (17 locators in 13 texts, all read).**
- Penneys (arXiv:1808.00323): Theorem A, p. 3; Theorem C, p. 4; the §4 dictionary, p. 23; Example 4.7, pp. 25–26.
- Tomatsu (arXiv:1812.04222): Theorem D, p. 2, with Irr(C) countable as a standing assumption (line 61); Definitions 2.2–2.3; Proposition 2.7, p. 10; Remark 2.17(1), p. 16 (R02).
- Masuda–Tomatsu (arXiv:0802.0344): Definition 2.4, p. 4; Corollary 3.16(3)–(4), p. 29.
- Masuda–Tomatsu (arXiv:math/0604348): Lemma 8.2, p. 64.
- Henriques–Penneys–Tener (arXiv:2307.13822): Lemma 3.7, p. 10; the §4 setup, p. 16.
- Henriques–Nivedita–Penneys (arXiv:2411.01678): Theorem 7.4, p. 38; Definitions 4.1 and 4.14, pp. 22 and 26.
- Chen–Hernández Palomares–Jones–Penneys (arXiv:2105.12010): Theorem 3.36 (printed p. 26) and Assumption 2.7.
- Jones–Penneys (arXiv:1707.02155): Theorem A, p. 1; Proposition 4.11, p. 14; Theorem 5.3, p. 19.
- Henriques–Penneys (arXiv:2004.08271): Theorem 3.10, p. 14; Theorem 3.15 and Corollary 3.16, p. 16 (R03a).
- Henriques–Penneys (arXiv:1511.05226): Lemma 3.4, p. 16; Theorem 3.5, p. 17.
- Hartglass–Penneys Part II (arXiv:1401.2486): Theorems A–C, pp. 2–3; Definition 6.11 and Theorem 6.13, p. 27.
- Katsura (arXiv:math/0309088): Definition 3.2, p. 5; Theorem 6.4, p. 14; Theorem 8.6, p. 18 (R03b, R04).
- Coles–Huston–Penneys–Srinivas (arXiv:1810.07049): Theorem A, p. 3 (R04).

Every other sampled locator supports the README as written, with the same hypotheses.

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA2a Penneys Thm A bijections | Hilb(ℤ/2); End†(Hilb_fd⊕Hilb_fd) | `Hom(ℤ/2,ℝ>0)={1}` since `χ(g)²=1`, against `{±1}` in `ℂ^×`. Pair groupoid gives a family `t>0`. Ex. 4.7: `dim_L(E_uv)=λ(u)/λ(v)`, `dim_R=λ(v)/λ(u)`, product 1 | README = source p. 3 | none |
| CA2a spherical-state Check (new) | t=4; t=1 | `dim_L=2`, `dim_R=1/2`. Weights (½,½) give 1 vs ¼; (1/5,4/5) give 2/5 = 2/5. Sphericality means `w_R=t·w_L`, so equal weights only at t=1. The other off-diagonal object (ratio `t⁻¹`) gives the same condition | correct, discriminating | none |
| CA2a sign Checks | `J(a,b)=(−b̄,ā)`, `J′(a,b)=(b̄,ā)`, `J(a)=cā` | `J²=(−a,−b)`, `J′²=id`, `J²a=|c|²a=a`; `(J⊗J)²=(−1)(−1)=+1` | as stated | none |
| CA2b Penneys Thm C, nonsimple `1_±` | u₁—w—u₂ | `1₊=E_(u₁u₁)⊕E_(u₂u₂)`, so `P_(0,+)=ℂ²` and `P_(0,−)=ℂ` (Ex. 4.7). Dictionary p. 23: connected iff `1_±` simple | as stated | none |
| CA2b TL Gram | basis {1,e}; δ=√2, δ=1 | entries `δ², δ, δ²`; det `δ⁴−δ²=δ²(δ²−1)`: 2 at √2, 0 at 1 | positive exactly for δ>1 | none |
| CA2b planar modules ↔ module C*-categories | CHPS Thm A | (1) pivotal right C-module C*-categories with simple basepoint `m=m◁1₀` ↔ (2) connected right planar modules | supported, uncited | R04(b) |
| CA3 normalisations | `Q=M₂`, `⟨x,y⟩=½Tr(x*y)` | ONB `√2e_ij`; `mm†z=n²z=4z`, `i†i=1`; `m′=m/2` gives `m′m′†=1`, `i′=2i` gives `i′†i′=4`; wrong `m/4` gives ¼ | as stated | none |
| CA3 morphism rescaling | `f:ℂ→M₂`, `d₁=1`, `d₂=4` | `f′=2f`; `f′m₁′=√(d₂)/d₁·m₂(f⊗f)=m₂′(f′⊗f′)`; `f′i₁′(1)=2·1=i₂′(1)`; unscaled `1≠2` | as stated | none |
| CA3 completion (CHJP 3.36) | statement | complete iff every Q-system splits as `X⊠X∨` with unitarily separable dual; Assumption 2.7 = CA3's finite local Cauchy completeness | README = source | none |
| CA4 JP Thm A / Prop. 4.11 | trivial Q; `M_n` in Hilb_fd | `m=d_H^(1/2)·`(projected multiplication), `i=d_H^(−1/2)·`(projected cup), `mm*=d_H`; trivial `d=1`; `M_n`: `d_H=d_Q=n²` | as stated | none |
| CA4 Stinespring Check (new) | `θ=½Tr` on `M₂` | `K=M₂` with `⟨a,b⟩=½Tr(a*b)`, dim 4, `v(1)=1`, `⟨1,a·1⟩=½Tr a`. A dilation on `K=ℂ²` forces a vector state (rank-1 density), but the density is `½·1`, rank 2 | correct, discriminating | none |
| CA4 transpose not CP | `c=ℂ²` | `(T⊗1)Σe_ij⊗e_ij`= flip; `e₁⊗e₂−e₂⊗e₁` has eigenvalue −1 | as stated | none |
| CA5 Checks | `N⊂N⋊ℤ/2`, `N⊂N⋊ℤ` (outer) | `d_Q=2=[M:N]`, two invertible summands; ℤ: `N′∩M=ℂ`, index ∞ | discrete does not imply compact | none |
| CA6 Checks | Hilb(ℤ) vs Hilb(ℤ/2); `P[0]=ℂ²`; `x=ℂ²`, n=3 | support ℤ (infinite) vs {0,1}; `ψ(r⁻¹(1,0)(1,0))=½` vs 1; `2³=8` vs `2⁶=64` | as stated | none |
| CA7 `J_X` Check (new) | `X=ℂⁿ` unital, n=1,2,3; zero action | `J_X=ℂ`, first map `1−n`. n=2: `K₀=0`; n=3: `ℤ/2`; `K₁=ker(1−n)=0`. n=1: ℤ, ℤ. Zero action: `J=0`, `O_X=T_X`. Dropping `(kerφ)^⊥` forces `π=0`, so `t(ξ)*t(ξ)=π(⟨ξ,ξ⟩)=0` and `O_X=0` | correct, discriminating | none |
| CA7 six-term generality | `X=ℓ²(I)` over ℂ, I uncountable | not countably generated; `1∉K(X)`, so `J_X=0`; Katsura 8.6 gives `K₀(O_X)=ℤ`, `K₁=0` | README narrower than source | R03(b) |
| CA7 Katsura ideal and covariance | Katsura Def. 3.2, 3.4, Thm 6.4 | `J_X=φ⁻¹(K(X))∩(kerφ)^⊥`, the largest ideal with injective covariant representation | matches; no source cited | R04(a) |
| CA7 weighted moments | `μ=(16,1)` | `x=aL(ε′)+a⁻¹L(ε″)†`; `E(x†x)=a²p_w`, `E(xx†)=a⁻²p_v`; a=2 gives 4 = 4; a=½ gives ¼ vs 64; `c=3` gives `τ(p_v)=48` | orientation pinned | none |
| CA7 loop and principal weights | one loop, μ=1; δ>1 | `T=S+S*`, spectrum `[−2,2]`, `C*(1,T)=C([−2,2])`, `K₀=ℤ`, `K₁=0`; `a_μ=1`, not `<1`; `a_μ(v)=δd_v>d_v`, so `A=∅` | as stated | none |
| CA8 `N(δ²)` (HP-II Def. 6.11) | δ²=2, (3+√5)/2, 3, 4 | 3, 3, 4, 5; source: `N(a)=a+1` for integer a | as stated | none |
| CA8 sharpness (HP-II 6.13) | TL(√2) | `Tr(1₂)=δ²Tr(1₀)`; depth of `A₃` is at least 2, so `[1₂]≠2[1₀]` excludes size 2 | as stated | none |
| CA8 HP-II Thms B, C | TL(√2) | `K₀(A_k)=ℤ³`, `K₁=0`; cone and scale on `K₀(A₀)` (the source misprints `K₀(A_k)`) | README pins `A₀` | Source issue |
| CA8 `A₃` eigenvector | `(1,√2,1)` | `√2=δ·1`; `1+1=2=δ·√2` | as stated | none |
| CA9 HNP 7.4, Defs 4.1, 4.14 | M=ℂ; right modules | `⟨a,b⟩=p_bL²(End(a⊕b))p_a=HS(a,b)`; `⟨c,F†d⟩≅⟨Fc,d⟩`; README's right-module handedness gives `K↦K⊗_A H`, covariant | consistent | none |
| CA9 transpose on pairs (new) | `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | `⟨F(c),d⟩=HS(c₁,d₂)`, dim 6; `F^t=F` gives `HS(c₂,d₁)`, dim 1 | discriminating | none |
| CA9 transpose on Hilb | `F=−⊗ℂ^k` | `HS(c⊗K,d)≅c̄⊗K̄⊗d≅HS(c,d⊗K̄)`, so `F^t=−⊗K̄`; dimension `mnk` for all three candidates, as the Check now says | correct | none |
| CA9 uniqueness (HP 3.10) | type pairs | both type II (II₁ or II∞) or both III₁, p. 14 | README = source | none |
| CA9 existence (HP17 3.5; HP Cor. 3.16) | R=R_λ (III_λ), C=Hilb(ℤ/2) | source covers any hyperfinite non-type-I R via `R⊗̄R_II₁≅R`; README covers II₁, II∞, III₁ only | narrower | R03(a) |
| CA9 Tomatsu Thm D (factor case) | factor M | `Z(M)=ℂ` has one state, so the invariant-state hypothesis is automatic; Irr(C) countable is the source's standing assumption; no injectivity | README = source | none |
| CA9 central ⇒ strong freeness | Tomatsu Rmk 2.17(1) | [38] is CMP 274 (2007); Lemma 8.2 at math/0604348 p. 64; 0802.0344 has §§1–4 only | wrong paper cited | R02 |
| CA9 rank-r approximate innerness | r=2.5; r=2 | MT Def. 2.4: `⌊r⌋+1=3` maps with 2 isometries; r=2: 2 isometries and `v₃=0`; Tomatsu Def. 2.2 uses `⌈r⌉` maps in `M^ω`, same condition `v_iψ=rρ(ψ)v_i` | README = MT Def. 2.4 | none |
| CA9 MT Cor. 3.16(3)–(4) | II∞, III₁ | `Int_r={ρ:τ∘φ_ρ=r⁻¹τ}`; `End(M)₀=Int_r` | README = source | none |
| CA9 II∞ amplification n=2 | `v₁,v₂` Cuntz pair | `φ_ρρ=½Σx=x`; `τφ_ρ=τ/2`; `(D(τ/2):Dτ)_t=2^(−it)`; `ρ̃(u_t)=2^(it)2^(−it)u_t=u_t`; `mod=θ₀` | as stated | none |
| CA9 dual-action sign | VNA main 3267–3268; MT main theorem | `θ_s(h)=e^s h` gives `Tr∘θ_s=e^s Tr`; MT's `θ_(log(r/d))` (negative action) equals README's `θ_(log(d/r))` | consistent | none |
| CA9 End_rev tensor | `u=diag(1,i)`, `v=σ_x` | `uv=[[0,1],[i,0]]`, `vu=[[0,i],[1,0]]`: entry (1,2) needs c=i, entry (2,1) needs c=−i | not proportional | none |
| CA9 `U_(ρ,σ)` direction | `x⊗η↦σ(x)η` | `ρ(a)x⊗η↦σ(ρ(a))σ(x)η`, so the result is `_(σ∘ρ)H₀` | reversed tensor confirmed | none |
| CA9 standardizability | II∞ factor M | a right module with II₁ commutant exists, but a unital normal copy of properly infinite M cannot sit in a finite algebra (proper isometry); so bimodules have properly infinite support, equivalent to 1 | claim (for bimodules) correct | none |
| CA9 Følner | `K=Irr(C)` | `Z≺X⊗(X̄⊗Z)`, so `F·K=Irr(C)` and the symmetric difference is ∅ | as stated | none |
| CA9 ultrapower | Tomatsu §2.2; MT §2.4 | `T^ω`, two-sided multiplier algebra, centralizing `C^ω`, `M_ω⊂M′∩M^ω`, expectation onto M | supported, uncited | R04(c) |
| CA10 HPT Lemma 3.7 | Ψ = identity lift `Z(C)→Z†(C)` | the lemma's hypothesis "Ψ^Z fully faithful" holds | as stated | none |
| CA10 HPT §4 setup | R of type II₁, II∞, III₁ | finite-depth real objects up to conjugation ↔ connected finite-depth unitary anchored planar algebras in `Z(C)^rev` | README = source p. 16 | none |
| CA10 tube algebras | Hilb(ℤ/2), Hilb(ℤ/3), Hilb(S₃) | 4, 9, 36; S₃ module dimensions 1,1,2,3,3,2,2,2 with squares summing to 36 = `(dim Vec S₃)²` | as stated | none |
| CA10 `Z(C)` fusion | PivotalSpherical L11 | induction functor, semisimplicity, simple unit, finite simples, `dim Z(C)=(dim C)²` already on main | restated, uncited | R05 |
| CA10 `r=±id` | `u=i·id` | `ū=−i·id`; `ūru⁻¹=(−i)²r=−r` | conjugate | none |
| CA1a C*-identity, C([0,1]) | `diag(2,1)`; `B=C([0,1])` | 4 = 4; Hilbert–Schmidt gives 5 vs √17; projections {0,1} span ℂ ≠ C([0,1]) | as stated | none |
| CA1a completions | one object, `End=ℂ` | Karoubi completion is Hilb_fd; W*-completion contains ℓ²(ℕ); columns `1/n` (sum π²/6) vs `1/√n` (diverges) | differ | none |
| CA1b nondegeneracy, conjugate | ℂ² on ℂ; zero action; `M₂` | unitor unitary; `⟨a⊗x,a′⊗x′⟩=0` gives `0≠ℂ`; `J(b*ξa*)=aξ*b` | as stated | none |
| Scope / Downstream single home | main QG l. 42; #1705; #1649 | main cites CA1a, CA2a; the revisions own §0.2 / §0.3; 0 mentions | two owners | R01 |

## Not verifiable

- None. Every cited text, and the two uncited ones the repairs use (Masuda–Tomatsu 2007; Katsura 2004; Coles–Huston–Penneys–Srinivas), was read from arXiv through the sources service. No manifest was edited.

## Source issues

- **Misprint** in Hartglass–Penneys Part II (arXiv:1401.2486) at Theorem C, p. 3: the source writes the positive cone of `K₀(A₀)` as a subset of `K₀(A_k)`; it should be `K₀(A₀)`; affects nothing.
- **Misprint** in Masuda–Tomatsu (arXiv:0802.0344) at Definition 2.4, p. 4: the closing sentence writes `Int(N)` as the intersection of `Aut(M)` with `Int₁(N)`; it should be `Aut(N)`; affects nothing.
