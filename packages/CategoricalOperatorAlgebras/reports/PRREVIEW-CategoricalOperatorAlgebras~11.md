# Review of CategoricalOperatorAlgebras (pull request #888 at 363a7e3)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` (2255 lines) and `Suggested.lean` (51 lines) at `363a7e3`. Since `2b38621`, the README changed by 174 lines (all in the supplier table, CA9 and the References); `Suggested.lean` and `metadata.toml` are unchanged. The source sample was drawn fresh: 15 of the 103 lines in CA1–CA10 that carry a page locator, `shuf` seeded with the head SHA followed by `-11`, no target chosen by its heading. Every passage of the README was read, changed or not.

There are three findings: one P2 carried from the two previous rounds (ownership of the CA1a/CA2a objects against the QuantumGroups heads, re-raised because the dispute does not remove the conflict and a human has to settle it), and two P3 locator findings in the new CA9 text.

## Previous findings

- **Previous R01 (P2), three open owners of the CA1a/CA2a objects: not repaired, disputed.** Lines 40–46 and 2135–2137 are unchanged. The repair report marks it `disputed`: citing "QuantumGroups Layer 0" would cite a section that only two open revisions define. That is a correct reading of the rule, but it refutes the proposed repair, not the defect: the heads still each claim single ownership (witness below). Carried as **R01**, re-raised.
- **Previous R02 (P3), type III index and basic-extension tower without a supplier: repaired.** The CA9 *Needs:* line (1946–1947) and Dependencies (1966–1967) now list Subfactors 2.4–2.5, the supplier table (148–156) names Kosaki's sector dimension, `E⁻¹` and `Ind(E)=E⁻¹(1)`, and a new paragraph (1566–1583) builds the tower from Subfactors 2.5's inverse weight and identifies `M⊂M₁` with `σ̄(M)⊂M`. The new paragraph's own locator is **R03** below.
- **Previous R03 (P3), four CA9 statements narrower than their sources: repaired.** Lines 1697–1709 state Lemmas 4.7 and 4.11 "on every such factor" (a factor with separable predual), Theorem 4.6 "on an infinite factor"; line 1740 states Lemma 4.15 on "an infinite factor with separable predual"; lines 1742–1746 state Theorem 4.16 for "a type III₁ factor with separable predual"; Theorem 4.18 and Corollary 4.19 keep R_III₁. These match `MasudaTomatsu2008` lines 1422, 1513, 1401, 1606, 1639, 1656. The `R_λ` instance is now the Check at 1910–1918.
- **Previous R04 (P3), Izumi and Popa cited only through restatements, central triviality not tied to the von Neumann roadmap: repaired, the last part applied differently and correctly.** Izumi 1993, Theorem 3.5 and Popa 1995, Theorem 3.5(ii) and Corollary 4.4 are cited at the claims (1746–1753) and in the References (2227–2236), with the centrally non-trivial form attributed to Masuda–Tomatsu (1751–1753; source lines 1652–1655). The automorphism clause (1688–1694) points to V12's `Ct(M)` rather than V13b; on main V12 is where `Ct(M)` is defined (`VonNeumannAlgebras/README.md` 3406–3412) and V13b only proves `Ct(R_(0,1))=Int(R_(0,1))` (4036), so the author's correction is right.

## R01 (P2) — This head and the QuantumGroups heads each claim to be the single home of the CA1a/CA2a objects

Re-raised: H01.

**Location.** `README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion and the finite-Hilbert and Hilbert-module examples (CA1a), and C*-tensor categories … signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". Lines 2135–2137 repeat it.

**Claim.** These objects have one owner, this roadmap, and QuantumGroups consumes them.

**Witness.** `TauCetiRoadmap/QuantumGroups/README.md` at the open heads:
- #1705 at `0d7cbcc`, lines 33–40: "Section 0.2 is the single home of C*-categories with their orthogonal sums, projection splittings and additive dagger Karoubi completion, the finite-Hilbert and Hilbert-module C*-categories, C*-tensor categories with conjugate solutions, standard solutions, intrinsic dimension and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … come later in the build and consume these"; lines 1777–1780 say this roadmap consumes its §0.2.
- #1649 at `cdeeada`, lines 29–36 and §0.1 (170–224): it builds the same axioms, Karoubi completion with its universal property, `Hilb_f`, standard solutions and `bar(r) r=ε φ_X`, while saying the general theory "is owned later in the build by CategoricalOperatorAlgebras, from which nothing is imported here".
- On main, QuantumGroups line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier, and QuantumGroups is absent from the merge order, so the dependency check places it at position 0, above this roadmap (227).

**Why the dispute does not settle it.** The repair report is right that a revision of a roadmap on main is never a dependency, so this README cannot cite "QuantumGroups Layer 0". But the overlap rule is about ownership, and the heads contradict each other: #1705 says its §0.2 is the single home and this roadmap consumes it; this README says the opposite. Whichever merges second breaks the other's scope statement, and main's own citation (QuantumGroups line 42) is an upward edge under the present order. No edit confined to this pull request resolves it, so this needs a human decision rather than another repair round:
- either QuantumGroups is inserted into the merge order after this roadmap, in which case main's citation of CA1a/CA2a becomes downward, this README's lines 40–46 and 2135–2137 are correct as written, and the QuantumGroups revisions should delete their restatements (#1649 §0.1, #1705 §0.2) and cite CA1a/CA2a again as main does;
- or QuantumGroups stays at position 0, in which case the earlier roadmap owns the overlap, and this README should, once a QuantumGroups revision with Layer 0 has merged, cite that layer for the C*-category axioms, finite linking algebras, orthogonal sums and projection splittings, the dagger Karoubi completion and automatic contractivity, `Hilb_f` and the Hilbert-module category, standard solutions, `d(X)` and the signed self-duality with its sign invariance, keeping here W*-categories and W*-Cauchy completion, unitary dual functors and Penneys's Theorem A, the grading groupoid and spherical states, and the braided sign law.

**Test object.** The sign ε of a simple self-dual object: defined at this README's lines 391–395, at #1649 line 194 and at #1705 lines 245–246. After either resolution exactly one of the three defines it.

## R02 (P3) — Lemma 4.10(3) and the modular-endomorphism definition are cited through Masuda–Tomatsu 2009, which proves neither and defers to Izumi 2003

**Location.** `README.md` lines 1694–1697: "Call ρ modular when its canonical extension ρ̃ above is inner … (Masuda–Tomatsu 2009, §4.2, p. 33, after Izumi)"; lines 1702–1705: "those of a factor of type III_λ, 0<λ≤1, are the `Ad u∘σ_t^φ` … (Lemma 4.10(2)–(3), p. 34)". The References entry (2213–2226) names no Izumi 2003.

**Claim.** Masuda–Tomatsu 2009 is the source for the definition and for the III_λ characterization.

**Witness.** `MasudaTomatsu2008` line 1484 defines modular endomorphisms "[17, Definition 3.1]"; line 1506, the proof of Lemma 4.10, reads "(3) and (4) is already proved [17, Theorem 3.3]"; line 2700 gives [17] as Izumi, *Canonical extension of endomorphisms of type III factors*, Amer. J. Math. 125 (2003), 1–56. Only parts (1)–(2) of Lemma 4.10 are proved in Masuda–Tomatsu. This is the same pattern the previous round's R04 repaired for Theorems 4.16 and 4.18.

**Repair.** At line 1697 cite Izumi 2003, Definition 3.1 for the definition; at line 1705 keep Lemma 4.10(2) for II∞ and cite Izumi 2003, Theorem 3.3 for the III_λ case "as recalled in Masuda–Tomatsu 2009, Lemma 4.10(3)"; add the Izumi 2003 entry to the References (by its locator alone if no legal text is found).

**Tested.** On `R_λ` the Check at 1896–1902 uses exactly this characterization to conclude that `σ_(t₀)` is modular and hence centrally trivial; the statement it relies on is Izumi's.

## R03 (P3) — Kosaki's basic extension for arbitrary factors is cited to a definition stated over a II₁ base

**Location.** `README.md` lines 1566–1569: "For an inclusion N⊂M of factors with a faithful normal conditional expectation E of finite index … construct Kosaki's basic extension `M₁=⟨M,e_E⟩=JN′J` (Jones–Penneys, *Realizations*, Definition 3.3(1), p. 15)"; References line 2163: "Kosaki's basic extension `JN′J` for inclusions of arbitrary factors".

**Claim.** Definition 3.3(1) states the basic extension `JN′J` for arbitrary factors.

**Witness.** `JonesPenneys2017Realizations` line 650 (Notation 3.1, in force for Definition 3.3): "(N, tr_N) is a type II₁ factor with its faithful tracial state, M is a factor containing N"; line 670 writes `⟨M,N⟩={M,e_N}′′=J_φN′J_φ` with the citation "[Kos86]". The source therefore states the identity only when N is II₁, and attributes the general case to Kosaki, *Extension of Jones' theory on index to arbitrary factors*, J. Funct. Anal. 66 (1986), which also owns `E₁=Ind(E)⁻¹·j∘E⁻¹∘j`, `E₁(e_E)=Ind(E)⁻¹` and `Ind(E₁)=Ind(E)` (lines 1572–1574), for which the README gives no locator at all.

**Repair.** Cite Kosaki 1986, §3, for `⟨M,e_E⟩=JN′J`, the dual expectation and `Ind(E₁)=Ind(E)`, at the claim and in the References (its DOI `10.1016/0022-1236(86)90085-6` resolves only to a paywalled page, so by its locator alone), and keep Jones–Penneys Definition 3.3(1) only for the II₁-base form used in CA5.

**Tested.** For `σ=id⊕id` on a type III factor M (Check at 1919–1925) the base `σ(M)≅M` is not II₁, so Definition 3.3(1) does not apply to the instance the README computes; Kosaki's statement does.

## Verified sound

**Gate, build and form.**
- My run of `gate … --base origin/main` at `363a7e3` exits 0 and ends `OK`, every counter 0: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 18 s with no diagnostic. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.
- The Lean file is `import Mathlib`, one module docstring titled "target signatures", and an empty namespace. No declaration, so no `#check` comparison and no one-tactic probe applied, and nothing is padding.
- `roadmaps resolve` (worker's run) found no unresolved citation or Lean name.

**Dependency check.** `gate --depcheck … --movable --content …` prints `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Merge order: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 206, this roadmap 227; TemperleyLiebOperatorAlgebras 243 is a consumer. QuantumGroups, FreeProbability, PivotalSpherical, OperatorAlgebraDynamics, CStarAlgebras, HilbertModules, VonNeumannAlgebras and Subfactors are on main. No gaps declared; `overlaps.md` lists no dropped id and no other pull request changing this roadmap.

**Headline theorems.** CA2a Penneys Theorem A; CA2b Penneys Theorem C and Coles–Huston–Penneys–Srinivas Theorem A; CA3 CHJP Theorem 3.36, Corollary 3.37, Theorem A; CA4 *Q-systems* Theorem A; CA5 *Realizations* Theorem 5.35 and Corollary 7.14; CA6 *Anchored* Theorem A; CA7 Katsura Theorem 8.6 and Hartglass–Penneys I Theorem 5.25; CA8 Hartglass–Penneys II Theorems A–C, Corollary 6.8, Theorem 6.13; CA9 HNP Theorem 7.4, HP2015 Theorem 3.5, HP2020 Theorem 3.10, Tomatsu Theorem D (factor case); CA10 the HPT §4 bijection. The docstring names each with the carrier it lacks; the pins have no dagger, C*- or W*-category, planar algebra, Q-system, Cuntz–Pimsner algebra, Watatani index, operator K-theory or hyperfinite factor (fixed-string searches of both pins, 0 files each, as in the previous round), so none is statable and an empty file is correct.

**Source sample (15 lines), each read at its locator and supporting the README as written:**
- 486: `Penneys2018` Theorem C, line 165, p. 4.
- 494: the dictionary, lines 1055–1073, table on p. 23; "2-shaded connected" ⇔ `1₊,1₋` simple (line 1065).
- 541: Example 4.7, line 1210, p. 25; `1=⊕_v E_(v,v)` (line 1222), so `1₊` has two simples for `V₊={u₁,u₂}`.
- 627: `CHJP2021` Theorem 3.36 line 1131 and Corollary 3.37 line 1164, printed pages 26 and 27 (footers at 1138, 1174).
- 711: `JonesPenneys2017Operator` Theorem 3.20, line 1216, p. 27.
- 721: Theorem 4.28, line 1958, p. 39: K, a ∗-natural transformation π and an isometry v with `θ=Ad(v)∘π`.
- 1269: `HartglassPenneys2014II` Definition 6.11 (line 1224) and Theorem 6.13 (1229), p. 27; proof on p. 28 (1238–1262), with the integer-δ² obstruction `[1₂]≠δ²[1₀]` for depth ≥ 2 at 1259–1262.
- 1304: Remark 5.17, line 1127, p. 25.
- 1355: `HNP2024` Theorem A line 37 (p. 2), Theorem 7.4 line 1540 (p. 38), `A↦A-Mod`.
- 1387: `HenriquesPenneys2015` Lemma 3.4, line 886, p. 16: II case by uniqueness, type III by the flow of weights (lines 888–900).
- 1398: Theorem 3.5, line 910, p. 17; `HenriquesPenneys2020` Theorem 3.15 (776) and Corollary 3.16 (789), p. 16.
- 1409: Theorem 3.10, line 651, p. 14: both II or both III₁.
- 1586–1587: `Tomatsu2018` §2.2, line 215, p. 5 (`T^ω`, multiplier `N^ω`, `C^ω`, `M_ω⊂M′∩M^ω` at 219–227); `MasudaTomatsu2008` §2.4 at line 173, p. 5.
- 2063: `HPT2023Classification` Corollary 3.9, line 537, p. 11, dominance by `⊕_c c⊗X⊗c̄` (539–540).

**New and changed CA9 locators, all checked at the text:** `MasudaTomatsu2008` Definition 4.1 (1364, p. 30), `Int(M)⊂Cnd(M)` (1371, p. 31), Theorem 4.6 (1401), Lemma 4.7 (1422), Propositions 4.8–4.9 (1464, 1478, p. 33) with McDuff defined as `M_ω` of type II₁ (1460), §4.2 (1481–1484, p. 33), Lemmas 4.10 and 4.11 (1494, 1513, p. 34), Theorem 4.12 (1534, p. 35) with its II∞ proof (1543–1552), Definition 4.13 (1580, p. 36), Lemma 4.15 (1606), Theorems 4.16 and 4.18 (1639, 1656, p. 37), Corollary 4.19 and proof (1664–1674, p. 38), III₁ proof of 4.12 (1676–1681), separable-predual convention (71). `HenriquesPenneys2020` Lemma 3.6, Theorem 3.7, Corollary 3.8, Lemma 3.9 (608–634, p. 13). `MasudaTomatsu2007` Definition 8.1, Lemmas 8.2–8.3 (3030–3072, pp. 64–65). `JonesPenneys2017Realizations` Definition 3.3(1) (668–673, p. 15; R03). Izumi 1993: read from the journal's open site (Math. Scand. 73, 307–319, image scan rendered page by page): Theorem 3.5 is on p. 315 and says, for a finite-index pair of III_λ factors (0<λ≤1, with a discrete-decomposition hypothesis when λ<1) with canonical endomorphism γ, that the type II and type III principal graphs of `M₁⊃M` differ exactly when some `γ^k`, k>0, contains `σ_t^τ̂` with `t∉T(M)`. Masuda–Tomatsu's Theorem 4.16 is its first-stage form (and Lemma 4.17 its stage-n form) for III₁, where the extra hypothesis is empty; the README's "as recalled in Masuda–Tomatsu 2009, Theorem 4.16" describes this correctly.

**Library and supplier declarations resolved (main at `f372983`; open heads as named):**
- VonNeumannAlgebras: V12 predual-centralizing sequences and `Ct(M)` (3404–3412); V11 `T(M)`, `S(M)`, Connes spectrum `=log(S(M)∖{0})`, `T(R_λ)=(2π/log λ)ℤ` (3071–3086); V13b `Ct(R)=Int(R)`, `Ct(R_(0,1))=Int(R_(0,1))`, `ker mod=closure Int` (4036–4038).
- Subfactors: 2.4 (490, Kosaki's sector version at 499), 2.5 (536: Haagerup's theorem, `E⁻¹:N′₊→M̂′₊`, `Ind(E)=E⁻¹(1)` for factors, 541–556); no basic extension for non-tracial factors anywhere in Subfactors (grep for Kosaki, `JN′J`, basic extension: lines 23, 82, 420, 499, 543, 549, 567, 589, 1744 only).
- QuantumGroups heads #1649 `cdeeada` and #1705 `0d7cbcc` as in R01; TemperleyLiebOperatorAlgebras #867 `7cf3fee` cites CA1a/CA2a 11 times (consumer).
- Mathlib names cited in Conventions resolve at the pin as in the previous round (`Functor.Monoidal`, `NatTrans.IsMonoidal`, `LaxMonoidalFunctor`, `HalfBraiding`, `Center`, `MonObj`, `EndMonoidal`, `ExactPairing`, `HasRightDual`, `Karoubi`, `CStarModule`, `VonNeumannAlgebra`); unchanged text, not re-opened.
- Ownership sweep (`roadmaps grep` over 468 heads and main) for "basic extension", "Kosaki", "centrally non-trivial", "modular endomorphism", "Ocneanu ultrapower|central sequence algebra": every hit outside this roadmap is unrelated (Fack–Kosaki s-numbers in NoncommutativeGeometry and NoncommutativeIntegration; a "basic extension" phrase in TopologicalKTheory; a Brauer-class reference in KatoEulerSystems). So this roadmap is the single owner of Kosaki's basic extension for non-tracial factors, central non-triviality of inclusions, modular endomorphisms and the general Ocneanu ultrapower, and Subfactors 2.4–2.5 and V11–V13 supply what it consumes.

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 486 Penneys Theorem C | `P_(0,±)` of the dictionary | connected ⇔ `1_±` simple (line 1065); `1₊` of Example 4.7 has `n₊` simples | supported | none |
| 541 bipartite Check | `u₁—w—u₂` | `n₊=2,n₋=1`: `P_(0,+)=End(1₊)=ℂ²`, `P_(0,−)=ℂ` | as stated | none |
| 627 CHJP 3.36/3.37 | `Q=1⊕g` in `Hilb(ℤ/2)` | `X=n₀1⊕n₁g` gives `X⊗X̄=(n₀²+n₁²)1⊕2n₀n₁g`; `n₀²+n₁²=1=2n₀n₁` has no solution in ℕ | Q does not split in C, splits in QSys(C) | none |
| 711 JP Theorem 3.20 | `A(a)=Hom(a,1)` | cyclic module `C` with basepoint 1, dagger the given one | supported | none |
| 721 Stinespring Check | `A=M₂`, `θ=½Tr` | `⟨a,b⟩=½Tr(a*b)` faithful, `dim K=4`; a `K=ℂ²` dilation makes θ a vector state, but `½·1` has rank 2 | discriminating | none |
| 1269 HP II Theorem 6.13 | TL(δ) at `δ²=2,3,4` | `N(2)=3`, `N(3)=4`, `N(4)=5`; depth of `A₃,A₅,A_∞` is `2,4,∞≥2`, so `[1₂]≠δ²[1₀]` applies at integer δ² | route valid at every permitted modulus | none |
| 1304 Remark 5.17 | TL(√2), `f(0),f(2)` | `Tr=1=1`, `[f(0)]≠[f(2)]`; `τ_*(1,0,−1)=0` | as stated | none |
| 1355 HNP 7.4 | handedness | source `A↦A-Mod` (left); README right modules with "there with left modules" | consistent | none |
| 1387 HP2015 Lemma 3.4 | `M_n`; `R_λ` | `M_n⊗̄R₁≅R₁≠M_n`; `R_λ⊗̄R₁`: flow of weights unchanged, so `≅R_λ` | type I correctly excluded | none |
| 1398/1409 HP2020 3.15/3.16/3.10 | `C=Hilb(ℤ/2)` in `R_λ` | two fully faithful representations (Checks 1888–1909), one centrally free, one centrally trivial, not isomorphic | II/III₁ restriction needed and present | none |
| 1586 ultrapower | `M_n`, `L(F₂)`, R | `M_n^ω=M_n`, `(M_n)_ω=ℂ`; `L(F₂)_ω=ℂ`; `R_ω≠ℂ` | supported | none |
| 2063 HPT Corollary 3.9 | `C=Hilb_fd` | `Z(C)=Hilb_fd`, `Z_C(E)=E`, `E⊠_(Hilb_fd)M≃M`: equivalence, not only fully faithful | agrees with Check 2116–2119 | none |
| CA2a Theorem A (headline) | `Hilb(ℤ/2)`; `End†(Hilb_fd⊕Hilb_fd)`, t=4 | `χ(g)²=1⇒χ=1` in `ℝ>0`, `±1` in `ℂ×`; `dim_L=2,dim_R=½`; weights `(1/5,4/5)` give `2/5=2/5`, equal weights `1≠¼` | as stated | none |
| CA2a sign law | `J(a,b)=(−b̄,ā)`; ℂ | `J²=−1`; `(J⊗J)²=+1=(−1)²`; on ℂ `J²=|c|²=1` | as stated | none |
| CA3 normalization | `M_n`, `⟨x,y⟩=n⁻¹Tr(x*y)` | `mm†=n²`; `m′=n⁻¹m` gives `m′m′†=1`, `i′†i′=n²`; wrong `d_Q⁻¹m` gives `n⁻²` | as stated | none |
| CA4 Theorem A (headline) | trivial object | `d_Q=1`, `A(1)=ℂ` connected, `L²` object `1∈C` compact | as stated | none |
| CA5 (headline) | `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2`; ℤ: connected, not compact | as stated | none |
| CA6 (headline) | `V=C=Hilb_fd`, `x=ℂ^k`; `Hilb(ℤ)` | `dim P[n]=k^n` vs `k^(2n)`; `Hilb(ℤ)` support infinite | discriminating | none |
| CA7 Katsura 8.6 (headline) | `X=ℂⁿ`, n=1,2,3; `ℓ²(I)` | first map `1−n`: `(ℤ,ℤ)`, `(0,0)`, `(ℤ/2,0)`; uncountable I: `J_X=0`, `K₀=ℤ`, `K₁=0` | as stated | none |
| CA7 HP I 5.25 (headline) | one edge `μ=(16,1)`; loop | `a=2`: `4=4`; `a=½`: `¼` vs `64`; loop `C([−2,2])` | as stated | none |
| CA8 Watatani Check | `ℂ⊂ℂ²`, `E=(a+2b)/3` | `Ind=(3,3/2)`; `E=(a+b)/2`: `2·1` | as stated | none |
| CA9 HNP 7.4 (headline) | pairs `(c₁,c₂)` | `dim HS(ℂ²,ℂ³)=6` vs `dim HS(ℂ,ℂ)=1` | discriminating | none |
| CA9 Theorem D (headline) | factor M | `Z(M)=ℂ`: invariant state automatic | as stated | none |
| Definition 4.1 ⇔ V12 `Ct(M)` | ω-centralizing `(x_n)` with `ρ^ω(x)≠x`; predual-centralizing `(x_n)` with `ρ(x_n)−x_n↛0` | ultrafilter: for some ε the set `{n:‖ρ(x_n)−x_n‖^♯≥ε}∈ω`; intersect with `{n:‖x_nφ_k−φ_kx_n‖<1/j, k≤j}∈ω` to get a subsequence centralizing for all φ (dense `φ_k`, bounded); converse: a subsequence bounded away from 0 is ω-centralizing for every ω | equivalence holds | none |
| Modular ⇒ centrally trivial (Lemma 4.11) | `Ad u∘σ_t^φ` on `R_λ` | `ρ̃=Ad(u·λ_t)` inner in the core, so trivial on central sequences | sound | none |
| Lemma 4.10(2)–(3) | II∞: `ρ` modular irreducible; III_λ | II∞: `Hom(id,ρ)≠0` from the implementing system, so inner; III_λ: the statement is Izumi 2003, Thm 3.3 | source is secondary | R02 |
| Theorem 4.12 on II∞ | `ρ=ρ⊗id`, flip σ | `mod(σ)=1` ⇒ σ approximately inner (V13b 4037); `[ρ⊗ρ̄]=[ρρ̄⊗id]≻[id⊗id]` (source 1548–1551); `Hom(id⊗id,ρ⊗ρ̄)=Hom(id,ρ)⊗Hom(id,ρ̄)≠0` | as stated | none |
| Theorem 4.12 on III₁ | `σ_t⊂ρρ̄`, t≠0 | `σ_(nt)⊂ρρ̄` ∀n, pairwise outer by `T={0}`, impossible at finite index | = lines 1756–1758 | none |
| `T(M)={0}` for III₁ | `σ_T^φ=Ad u`, T≠0 | `u∈M_φ`; `ψ=φ(h⁻¹·)`, `h^(iT)=u`: `σ_T^ψ=Ad(h^(−iT)u)=id`, `Γ⊆(2π/T)ℤ≠ℝ` | sound | none |
| Definition 4.13 | `M⊗1⊂M⊗M₂` | `N∨(N′∩M)=M`, `E=id`, `q₁=1`: `‖φ−φ‖=0<ε` | centrally non-trivial | none |
| Lemma 4.15 and its Check | `R_λ`, `ρ=σ_(t₀)`; `ρ=Ad u` | `t₀=π/log 2` at λ=½: `λ^(it₀)=−1`, `σ_(t₀)²=id`, `t₀∉(2π/log 2)ℤ`, modular, non-inner ⇒ not centrally non-trivial; `Ad u` ⇒ `id⊕Ad u≅id⊕id` ⇒ centrally non-trivial | non-inner hypothesis necessary | none |
| Kosaki tower Check | `σ=id⊕id`; `λ=1/5` | `Ind(E_σ)=2+2=4=d_σ²`, `E₁(e)=¼`; `Ind(id⊗ω_h)=Tr(h⁻¹)=5+5/4=25/4`, `E₁(e_E)=4/25`; automorphism: `M₁=JM′J=M`, `e=1` | as stated | none |
| Kosaki tower locator | III base, `N=σ(M)` | Definition 3.3(1) needs N II₁ (source line 650); the instance has N≅M of type III | locator too narrow | R03 |
| `M⊂M₁ ≅ σ̄(M)⊂M` | common cyclic separating ξ | Dixmier–Maréchal: cyclic separating vectors of a properly infinite σ-finite algebra with properly infinite commutant form a dense `G_δ`; `N′⊃M′` properly infinite, so a common ξ exists; `Ad(J_NJ_M):M₁→N` carries M onto `γ(M)`, `σ⁻¹γ=σ̄` | route valid | none |
| Theorem 4.16 vs Izumi 3.5 | III₁, k=1 | Izumi: graphs differ ⇔ `σ_t∈γ^k` some k>0, `t∉T(M)={0}`; MT 4.16 is the k=1 statement, Lemma 4.17 the stage-n one | attribution correct | none |
| Theorem 4.18 | n versus k≤n | `(σσ̄)^k≺(σσ̄)^n` for k≤n since `id≺σσ̄`, so (2)⇔(3) in the source | as stated | none |
| Corollary 4.19 deduction | `σ=id⊕ρ` | `σ̄=id⊕ρ̄`, `ρ̄` non-inner irreducible centrally trivial (4.6(4)); `[σσ̄]=[id]⊕[ρ]⊕[ρ̄]⊕[ρρ̄]` | = lines 1753–1756 | none |
| HP Corollary 3.8 | II∞; III₁ with `Xⁿ≅1` | II∞: `α_X` inner ⇒ `α_X≅α_1`; III₁: `σ_(nt)` inner ⇒ t=0 | sound | none |
| `L(F₂)⊗̄B(ℓ²)` Check | `b⁻ⁿhaⁿ` | distinct for distinct n (abelianization `(0,j)=(j,0)⇒j=0`); `M_ω=ℂ`, a=1 | not centrally free | none |
| CA10 tube algebras | `ℤ/2`, `ℤ/3`, `S₃` | `4`, `9`, `36=1+1+4+9+9+4+4+4` | as stated | none |
| Single owner of ε | this README; #1649; #1705 | lines 391–395; line 194; lines 245–246 | three definitions | R01 |

## Not verifiable

- **Popa 1995**, Theorem 3.5(ii) and Corollary 4.4 (CBMS 86): no legal open copy; the manifest records it `uncertified`. The centrally non-trivial extension is Masuda–Tomatsu's assertion (lines 1654–1655) and is not checked against Popa's proof.
- **Izumi 2003**, *Canonical extension of endomorphisms of type III factors*, Theorem 3.3 (R02): not fetched; the README does not cite it yet.
- **Kosaki 1986** (R03): the DOI resolves only to a paywalled page (the sources service reports `uncertified`); the identities `⟨M,e_E⟩=JN′J`, `E₁(e_E)=Ind(E)⁻¹` and `Ind(E₁)=Ind(E)` are checked only on the `id⊕id` instance above. The service wrote an `uncertified` entry for it into the board manifest during this check; that change was reverted, since this review edits no manifest.
- **Tomatsu's strong-freeness quantifiers** (`Tomatsu2018` lines 718–720): the extraction renders `M^ω` and `M_ω` alike, as in the previous round.

## Source issues

- **Gap** in `HartglassPenneys2014I` at Theorem 5.25, p. 40: the source proves the infinite case by writing the graph as an increasing union of finite subgraphs, which exists only for countable graphs; it should use the directed system of finite edge-subgraphs; affects the proof.
- **Misprint** in `HPT2023Classification` at §1, p. 2: the source lists the factor types as II₁, III∞ or III₁; it should be II₁, II∞ or III₁; affects nothing.
- **Misprint** in `HartglassPenneys2014II` at Theorem C, p. 3: the source writes the positive cone of `K₀(A₀)` as a subset of `K₀(A_k)`; it should be a subset of `K₀(A₀)`; affects nothing.
