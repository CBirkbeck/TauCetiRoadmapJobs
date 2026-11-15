<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15391#issuecomment-6887725899 -->
Review (codex) of 8804482

Verdict: needs_changes

1. **F01** (P1) The rational Euler characteristic docstring gives the wrong junk value

   **Location:** `packages/FinitenessAndDualityOfGroups/Suggested.lean:172`, especially line 174: “otherwise the finite sum is `0` by convention.”

   **Claim:** Failure of finite total rational homology forces `rationalEulerChar` to be zero.

   **Witness:** For `G = FreeGroup ℕ`, the dimensions are `1, ∞, 0, …`; Lean's finranks are `1, 0, 0, …`. The body returns `1`, whereas the docstring promises `0`.

   `Mathlib/LinearAlgebra/Dimension/Free.lean:276`, `Module.finrank_of_not_finite`, explains the individual zero finrank. The free-group sequence supplied by `TauCetiRoadmap/CohomologyOfGroups/README.md:1333` (§3.6, open #2338) computes the homology. The package itself already describes this example correctly in `packages/FinitenessAndDualityOfGroups/README.md:190`.

   **Exact repair:** Keep the definition. Replace its docstring's last two sentences with: “For finite total rational homology this is the usual Euler characteristic. On other groups the body uses `Module.finrank`, which assigns zero to each infinite-dimensional homology group, and `finsum`, which assigns zero when infinitely many signed finranks are nonzero.” The repaired wording gives `1` for the countably generated free group and `1 − 2 = −1` for the free group of rank two, as the body does.

2. **F02** (P2) The FP_n docstring shifts the exactness bound by one

   **Location:** `packages/FinitenessAndDualityOfGroups/Suggested.lean:66`: “exact in degrees `≤ n`.”

   **Claim:** The finite-free sequence defining `FP_n` must be exact at its term in degree `n`.

   **Witness:** At `n = 0`, the body only requires a finite-free surjection onto the trivial module. For the additive group `ℚ` over `ℤ`, this is true; finite presentation of that module is false.

   The actual definition at `TauCeti/Algebra/Module/PseudoCoherent/Basic.lean:89` requires exactness at the degree-zero term only when `1 ≤ n`, and at degree `i + 1` only when `i + 2 ≤ n`. Its `zero_iff` at line 133 gives finite generation. A finite-free incoming term and exactness at degree zero would instead require finite presentation, equivalent here to finite generation of the group; `ℚ` is not finitely generated. The README's §1.2 and §1.4 already use the correct indexing.

   **Exact repair:** Replace the explanation with: “For finite `n`, the trivial module has a partial finite-free resolution `F_n → … → F_0 → R → 0`, exact at `R` and at `F_i` for `i < n`. For `n = ⊤` there is an exact finite-free resolution in every degree.” At `n = 0` this asks only for the cyclic augmentation quotient and accepts `ℚ`; at `n = 1` it rejects `ℚ`. No definition change is needed.

3. **F03** (P2) The mod-p Swan headline is statable but missing

   **Location:** `packages/FinitenessAndDualityOfGroups/README.md:16` promises “Swan's theorem in its rational and mod-`p` forms”; §7.4 starts at line 1872. `packages/FinitenessAndDualityOfGroups/Suggested.lean:18` lists headlines, but includes only §7.3(b).

   **Claim:** The acceptance test covers the promised Swan theorems, or records why a missing headline cannot be stated.

   **Witness:** The following native-carrier signature elaborated at the pins with only a `sorry` warning. Neither it nor a §7.4 nonstatability explanation occurs in the acceptance file.

   ```lean
   theorem exists_linearEquiv_tensorZMod {G : Type} [Group G] [Finite G]
       (P : Type) [AddCommGroup P] [Module (MonoidAlgebra ℤ G) P]
       [Module.Finite (MonoidAlgebra ℤ G) P]
       [Module.Projective (MonoidAlgebra ℤ G) P]
       (p : ℕ) [Fact p.Prime] :
       ∃ m : ℕ, m * Nat.card G = Module.finrank ℤ P ∧
         Nonempty ((P ⊗[ℤ] ZMod p) ≃ₗ[MonoidAlgebra ℤ G]
           ((Fin m → MonoidAlgebra ℤ G) ⊗[ℤ] ZMod p)) := by
     sorry
   ```

   **Exact repair:** Add this §7.4 headline with a mathematical docstring, its README name and the module-docstring entry. An additive map of these `𝔽_p`-modules is `𝔽_p`-linear, so the displayed `ℤG`-linear equivalence expresses the intended `𝔽_pG`-equivalence. Retain the prime and finite-projective hypotheses. For `P = ℤ[C₂]`, `p = 2`, it gives rank `m = 1` and dimensions `2 = 1·2`; for `C₃`, `p = 3`, it gives `3 = 1·3`; for `P = 0`, `m = 0`. The nonprojective trivial lattice for `C_p` has reduction dimension `1`, excluding the false unrestricted version.

4. **F04** (P3) A downstream citation names no indexed roadmap

   **Location:** `packages/FinitenessAndDualityOfGroups/README.md:2442`: “MotivicStructuresInModuliOfCurves §2.1”.

   **Claim:** This roadmap and section exist and state the described application.

   **Witness:** `roadmaps show MotivicStructuresInModuliOfCurves` reports no roadmap on main or in an open roadmap pull request. The supplied board-package index contains no such package either.

   The name occurs incidentally in other roadmap prose; that is not an owner or a resolvable §2.1. This is a downstream citation, not an unowned prerequisite.

   **Exact repair:** Delete the first downstream bullet. The other three named applications and the PosetHomotopyAndSubgroupComplexes boundary remain. This removes the unresolved citation without changing any mathematical dependency. Alternatively, a replacement must identify an actual roadmap and section containing that application; a guessed title is not sufficient.

Four findings: one P1, two P2 and one P3. The Lean file elaborates. The P1 concerns a false description of a total function, not a false admitted theorem. No previous review or maintainer notes were supplied.

## Verified sound

The review read all 51 numbered subsections, the conventions, supplier contracts, examples and downstream claims, all 22 Lean declarations, metadata, source records, the two declared gaps, and the supplied citation, overlap, signature and library-match leads. The report's table includes every sampled subsection, every Lean headline, both mathematical findings, and additional boundary and convention probes. These are mathematical computations, not claims that `sorry` proves truth.

### Principles, shape and Lean checks

- This is a new roadmap, not a second copy of a main-branch roadmap. Main, the supplied board index and the indexed open heads were checked. Its general discrete-group theory is distinct from continuous profinite cohomology and from arithmetic instances.
- The coefficient scope includes the zero ring, positive characteristic, primes dividing group orders and arbitrary commutative rings where claimed. Integral statements and the additional torsion-free, finite-index, finite-generation and Hausdorff hypotheses are stated separately. No route restricted to good primes, computational algorithm, copied source block, sorry'd data, `set_option`, arbitrary placeholder predicate or conclusion-as-hypothesis was found.
- Nine layers have Examples and Dependencies; all 51 subsection routes have inputs. Definitions have mathematical API and at least three discriminating Checks, including negative controls. The README follows the requested summary/scope/conventions/contracts/build/layers/consumers/references shape. ClassifyingSpaces, AlgebraicTopology and ProfiniteCohomology on main were read for comparison of shape. The order is mathematical, not a source's chapter sequence.
- Every one of the 22 names declared in Suggested.lean occurs in the README. No extra backticked name attributed to this package was found without a declaration. The citation resolver's three purported missing roadmaps that are actually source keys were discarded; its downstream-name lead is R04.
- The imports are one `import Mathlib` and five individually used Tau Ceti modules. There are nine real definitions and thirteen admitted theorems, no admitted data or examples. No unwanted option, `lemma`, machine path, pull-request number or process note was found in the acceptance file or roadmap text.
- The prescribed `lake env lean` invocation on the original acceptance file, run from the pinned content checkout, succeeded. Its only warnings were the thirteen uses of `sorry`. No missing object-file build was needed.
- A scratch copy with `#check @name` for **all 22 declarations** elaborated. All intended binders survived, including projectivity/finiteness in Swan, finite homological type in Euler formulas, injectivity in the amalgam theorem, and finite index plus the cohomological bound in the syzygy theorem. R01 and R02 are explanatory mismatches, not dropped binders.
- Each of the **thirteen** `sorry` bodies was tested with `simp`, `rfl` and `infer_instance`, using terminating `solve` branches in a scratch copy. None closed. The pinned exact-lemma near matches were read; none has the headline conclusion at its full generality. In particular the pinned p-adic Swan theorem assumes an isomorphism of rationalizations and does not prove the integral-lattice rational Swan headline in one step. No padding finding is supported.
- The mod-p signature in R03 separately elaborated with the original global defaults and only `import Mathlib`. No package theorem or definition was edited.

The pins read from `lake-manifest.json` are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

### Headline coverage

| README headline | Acceptance-file coverage |
| --- | --- |
| §1.5 Bieri–Eckmann–Brown criterion | Both directed-colimit and product forms, lines 81 and 92 |
| §3.2 Serre | `cohomologicalDim_eq_of_finiteIndex`, line 114 |
| §5.3 Eilenberg–Ganea | `geometricDim_le_max`, line 153 |
| §6.3 duality criterion; §6.4(b) abstract-isomorphism characterization; §6.6 manifold consequence | Individually named at lines 37–42; the cap-product duality carrier is not pinned, and the manifold version also needs the orientation character |
| §7.3 rational Swan and rank vanishing | Rational freeness at line 163; noncommutative Hattori–Stallings rank not statable, explicitly named at lines 52–54 |
| §7.4 mod-p Swan | Missing: R03 |
| §8.4 independence and finite-index multiplicativity | Both theorems at lines 193 and 200 |
| §8.6 extension multiplicativity | Full statement, including virtual torsion-freeness of the middle group, at line 207 |
| §8.7 equivariant Euler formula | Amalgam and HNN cases at lines 218 and 228; general monomial-complex/action carrier explicitly unavailable at lines 47–51 |
| §8.9 Brown denominator theorem | Common-multiple and prime-power formulations at lines 238 and 246 |
| §9.2 complete resolutions | High syzygies Gorenstein projective, line 258, on native totally acyclic-complex carriers |
| §9.4 Farrell comparison | Named at lines 43–46; Farrell functor and comparison map are not pinned |

### Computed adversarial pass

Notation: `C_m` is cyclic of order `m`; `F_r` is the free group of rank `r`; `K` is the Klein-bottle group. An infinite vector-space dimension and Lean's finite natural `finrank` are distinguished. “Retain” means the listed hypotheses or convention passed these probes, not that examples alone prove the theorem.

| Statement(s) | Instances and computed sides | Result / change |
| --- | --- | --- |
| §1.1 module finiteness by colimits | For the zero module both Hom sides are zero. For `M=ℚ` over `ℤ`, `N_i=ℚ/(1/i!)ℤ` has colimit zero; the quotient map gives a nonzero class in `colim Hom(ℚ,N_i)`, but `Hom(ℚ,0)=0`. For `A=k[x₁,x₂,…]`, `M=k`, `N_i=A/(x₁,…,x_i)`, the map is `0 → k`, injective but not surjective. | Separates finite generation, finite presentation and no finiteness; retain. |
| §1.2 FP types and Lean docstring | Every trivial module is a cyclic augmentation quotient: FP₀ true. For `G=ℚ`, FP₁ is false. A finite nontrivial group over `ℤ` is FP∞ but not FP. Over the zero ring all four types hold. | Body and README retain; docstring R02. |
| §1.3 implication and base change | `C₂` has a finite projective resolution over `ℚ` (length zero), but none over `ℤ`; reduction to the zero ring gives length zero. A finite-free complex for `F₂` has ranks `1,2` over either coefficient ring. | Forward scalar extension survives; arbitrary converse excluded. |
| §1.4 low degrees | `F₂` has ranks `1,2,0,…`, hence FP₁ and FP₂. The kernel of `F(a,b)→ℤ`, `a↦1,b↦0`, has infinitely many free generators `aⁱba⁻ⁱ`, hence is not FP₁ over nonzero coefficients. | Finiteness assumptions discriminate. |
| §1.5 colimit and product criteria | For `ℚ=⋃(1/i!)ℤ`, the permutation modules on `ℚ/((1/i!)ℤ)` have invariants zero, but their colimit is the trivial module with invariants `R`; thus degree-zero comparison is `0→R`. FP₁ is false. At `n=0` it is still injective, consistent with FP₀ true. For `G=1`, every comparison is the identity. | Both directions and boundary degree retained. |
| §1.6 finite index | `ℤ≤C₂×ℤ` has index two. FP∞ holds on both sides, while integral FP holds only for `ℤ`; dimensions are `1` and `∞`. | No false upward FP/FL conclusion. |
| §1.7 extensions/products | In the lamplighter extension the middle group is generated by two elements; its base `⊕_ℤ C₂` is not finitely generated. For `ℤ×ℤ`, ranks `1,2,1` are the tensor convolution of `1,1` with itself. | No unsupported converse; forward product retained. |
| §1.8 trees and finiteness | `C₄ *_{C₂} C₆` is FP∞ although it has torsion and is not integral FP. The free group on two generators has augmentation ranks `1,2`, and trivial edge modules contribute in degree one. | Separates FP∞ from finite length. |
| §2.1 definitions and characterizations | For nonzero `R`, `cd_R(1)=hd_R(1)=0`, `cd_R ℤ=hd_R ℤ=1`; for `R=ℤ`, `C₂` has nonzero `H²=ℤ/2` in arbitrarily high even degrees, giving both dimensions `∞`. For `R=0`, all dimensions are zero. | Quantification over all modules and nontrivial-ring qualifications retained. |
| §2.2 dimension comparisons | `ℚ` as an additive group has `hd_ℤ=1`, `cd_ℤ=2`. For `ℤⁿ`, `n=0,1,2`, both dimensions are `0,1,2`, detected by the top exterior power `R`. For `C₂`, `H^{>0}(C₂,ℤC₂)=0` despite `cd=∞`. | Finite-projective-type hypothesis cannot be dropped from regular-module detection. |
| §2.3 subgroups | `ℤ≤C₂×ℤ`: integral dimensions `1≤∞`; rational dimensions `1=1`. Index two is invertible over `ℚ`, not over `ℤ`. | Unit-index and torsion hypotheses retained. |
| §2.4 extensions/products | For `1→ℤ→ℤ²→ℤ→1`, dimensions give `2≤1+1`, equality. Trivial factors give `0+1=1` and `0+0=0`. For `K` over `𝔽₂`, the inversion acts as `+1`, and `H²=𝔽₂`, detecting dimension two. | Bound, finite-type equality and characteristic-two case retained. |
| §2.5 directed unions | `ℚ=⋃(1/i!)ℤ` gives homological bound `1= sup 1`, cohomological bound `2=1+1`. The cyclic subgroups of `ℤ²` are not a directed cover: their individual dimensions are one, whereas `hd ℤ²=2`. | Directedness and the extra cohomological degree are necessary. |
| §2.6 tree dimension bounds | `F₂=ℤ*ℤ` gives `cd=1=max(1,1,0+1)`. The one-vertex trivial-group tree gives `cd=0≤1`. | Bound is an inequality, not always equality. |
| §2.7 torsion | `C₂` over `ℤ/6` has `H²=(ℤ/6)/2(ℤ/6)=ℤ/2`, hence infinite dimension. Over `ℤ[1/2]` it has dimension zero. Over `𝔽₂[ε]/(ε²)`, `C₃` has dimension zero, but `C₂` has nonzero even cohomology `R`. | Units, bad primes and nonreduced coefficients covered. |
| §2.8 discrete versus profinite invariant | For the trivial group both values are zero. Discrete `ℤⁿ` gives `n` for `n=0,1,2` in the torsion-coefficient comparison. A nontrivial finite group has unrestricted torsion-coefficient dimension `∞`. | Does not identify unrelated topologies or restricted p-dimensions. |
| §3.1 signed tensor induction | For a two-term complex `d(x)=y`, `deg x=1`, the tensor differential is `d(x⊗x)=y⊗x−x⊗y`. Odd-factor interchange contributes `−1`; unsigned interchange has commutator `2(y⊗x−x⊗y)`. In characteristic two this difference is zero. | Sign and p=2 convention retained; only coefficient-linear splitting is used. |
| §3.2 Serre | `ℤ²≤K` of index two has integral dimensions `2=2`. Dropping torsion-freeness gives `ℤ≤C₂×ℤ`, dimensions `1≠∞`. Identity subgroup gives equality tautologically without replacing the general theorem. | Full torsion-free theorem retained. |
| §4.1 vcd | Finite `G`: subgroup `1` gives vcd zero. `C₂×ℤⁿ` has vcd `n`, for `n=0,1,2`. Infinite `⊕ C₂` has no torsion-free subgroup of finite index and vcd `∞`. | Infimum and infinity cases retained. |
| §4.2 subgroups/extensions of vcd | `C₂≤C₂×ℤ` gives `0≤1`; `1→C₂→C₂×ℤ→ℤ→1` gives `1≤0+1`. | Bound retains virtual torsion-freeness condition. |
| §4.3 rational coefficients | For `C₂×ℤ`, rational cohomological dimension is `1=vcd`; over `𝔽₂` cohomology persists in arbitrarily large degrees, so dimension is `∞`. | Rational-algebra hypothesis retained. |
| §4.4 finite homological type | Finite groups have torsion-free finite-index subgroup `1`, with homology ranks `1,0,…`. `C₂×ℚ` has finite vcd two, but its subgroup `ℚ` has `H₁=ℚ`, not finitely generated over `ℤ`. | Finite vcd alone does not imply finite homological type. |
| §5.1 geometric dimension | `gd(1)=0`, `gd(F₂)=1`, `gd(ℤ²)=2`, `gd(C₂)=∞`. `S²` has no one-cells but `H₂=ℤ`, so the “no higher cells” requirement cannot be replaced by a one-skeleton condition. | Hausdorff CW and full dimension bound retained. |
| §5.2 cellular resolutions and finite spaces | The torus has cell ranks `1,2,1`, giving `cd≤2` and a finite-free resolution of those ranks; top homology detects `cd=2`. A finite nontrivial group has integral cd `∞`, excluding a finite-dimensional classifying space. | Resolution, finite-type and dimension claims retained. |
| §5.3 Eilenberg–Ganea | `ℤ³`: `gd=3=max(3,3)`; `ℤ²`: `2≤3`; `1`: `0≤3`; `C₂`: `∞≤∞`. | No false assertion that cd two always forces gd two. |
| §5.4 proper acyclic simplicial sets | Finite `G` acts on a point with finite stabilizer `G`. For `C₂×ℤ`, coinduction from the translating line gives a contractible two-dimensional product, with stabilizers `C₂` or `1`. The edge face poset has three vertices and two edges, χ=1; the triangle-boundary face poset has six vertices and six edges, `H₁=ℤ`. Adjoining the empty face would cone it off and give `H₁=0`. | Nonempty-face and dimension conventions discriminate; the two declared comparison gaps remain contracts. |
| §6.1 duality definition | For `ℤ`, `H¹(ℤ,R)=R=H₀(ℤ,R)`, with degree-one fundamental class. For finite groups of unit order the degree-zero averaging map has inverse after dividing by the order. Over `R=0` both sides are zero for every n. | Zero-ring degeneracy is explicitly allowed, not used to infer a unique n. |
| §6.2 dualizing module/action | For `ℤ`, the dualizing module has underlying rank one. For `F₂`, the dualizing module has infinite underlying abelian rank; it is not the rank-one trivial module. Right multiplication by distinct generators gives `st≠ts`, distinguishing the right action from its reversed assignment. | Right-module and finite-rank distinctions retained. |
| §6.3 criterion | For `ℤ²`, group-ring cohomology is `0,0,R,0,…`, top module flat. For `ℤ*ℤ²`, `H¹(G,ℤG)` contains `ℤG`, although cd is two and FP holds, so the concentration condition fails. Finite `C₂` fails integral FP. | Both concentration and finite type discriminate. |
| §6.4 Poincaré duality | `K` has `w(t)=−1`, so `H²(K,ℤ)=ℤ/2`; the untwisted answer would be `ℤ`. Over `𝔽₂`, `−1=1`. For `F₂`, `H¹(F₂,R)=R²` but rank-one duality would give `H₀=R`; finite `S₃` over `ℚ` has PD dimension zero. | Orientation, rank and unit-order cases retained. |
| §6.5 finite index/extensions | In `K`, `tat⁻¹=a⁻¹` induces `−1` on `H¹(⟨a⟩,ℤ⟨a⟩)` after augmentation; the quotient `ℤ` has trivial orientation, so the extension character is `−1`. The index-two subgroup `ℤ²` has dimension `2=1+1`. `C₂×ℤ` shows the excluded torsion case. | Tensor dualizing module with its action, not just abstract rank, retained. |
| §6.6 manifolds | A closed oriented torus gives dimension two and trivial character; the Klein bottle gives dimension two and sign character. `S²` is not aspherical and has fundamental group of dimension zero, not two. | Asphericity and orientation hypotheses discriminate. |
| §7.1 Hattori–Stallings coordinates | For the trivial projective `ℚ[S₃]`-module, coordinates on identity/transpositions/3-cycles are `1/6,1/2,1/3`, sum one. The regular module gives `1,0,0`; restriction to the trivial subgroup gives rank six. Zero module gives all zero. | Class sums, augmentation and restriction conventions retained. |
| §7.2 characters | For `C₃` and character `ω`, the coefficient at `g⁻¹` is `ω/3`, so the centralizer formula gives trace `ω`; coefficient at `g` instead gives `ω⁻¹`. Over `𝔽_p`, the regular `C_p` module has identity rank one but character value `p=0`. | Inverse and no-division formula are necessary. |
| §7.3 rational Swan | For `P=ℤ[S₃]²`, integral rank is 12, `m=2`, and rational free rank is two. For zero P, `m=0`. The nonprojective trivial `ℤ[C₂]` lattice has rank one and nonzero character at the involution, excluding rational freeness. | Full finite-projective statement retained. |
| §7.4 mod-p Swan | Regular lattices for `C₂,p=2` and `C₃,p=3` give dimensions two and three, free rank one in the local, p-adic and residue-field forms. The trivial lattice instead gives residue dimension one, not divisible by p. | Mathematics retained; missing signature R03. |
| §7.5 Hom theorem | For `Γ=ℤ`, `P=ℤΓ`, any one-dimensional character V gives `dim Hom=1=1·1`. For finite `Γ=S₃`, `Γ'=1`, `P=ℤΓ`, `dim V=2`, Hom dimension is 12, free rank two over `K[S₃]`. Nonprojective trivial P with nontrivial character has Hom dimension zero instead of one. | Projectivity and quotient action discriminate. |
| §8.1 finite replacement | The contractible complex `F→F` with identity differential, even with infinite free F, has homology zero and replacement zero. Over a non-Noetherian polynomial ring the residue module need not be finitely presented, so finite homology generation alone does not supply a finite projective replacement. | Noetherian and projective-term conditions retained. |
| §8.2 finite group actions | `ℤ[C₂]` in degree zero has homology rank two and coinvariant rank one: `2=2·1`. The nonprojective trivial lattice gives `1≠2·1`. | Projectivity cannot be discarded. |
| §8.3 rational Euler and total definitions | `C₂`: χℚ=1 while χ=1/2. `ℤ`: `1−1=0`; `F₂`: `1−2=−1`; countably generated free group: finranks `1,0,0,…`, χℚ=1, while total χ=0 from the differing values `1` and `1/2`. | README/body correct; R01 fixes the docstring. |
| §8.4 normal subgroups/finite homological type | `A₃≤S₃` has index two: χ values `1/3=2·(1/6)`. For `C₄*_{C₂}C₆`, a free subgroup of index 12 and rank two gives `χ=(-1)/12`. Both trivial and finite-group cases use positive, nonzero indices. | Independence and finite-index multiplicativity retained. |
| §8.5 twisted Euler | An index-two subgroup of `F₂` is `F₃`. Its rational `C₂`-homology has `H₀=triv`, `H₁=2·triv+sign`, so alternating class is `−regular`; dimensions give `1−3=−2`. In characteristic two this remains a Grothendieck-class statement of length −2, even though its trace is zero. | Characteristic-zero character argument is not substituted for modular class equality. |
| §8.6 extensions | `F₂×F₃` has homology ranks `1,5,6`, χ=2, agreeing with `(−1)(−2)=2`. For the Klein-bottle extension, χ=0=0·0. | Finite support and middle-group virtual torsion-freeness retained. |
| §8.7 equivariant/amalgam/HNN formulas | `C₄*_{C₂}C₆`: `1/4+1/6−1/2=−1/12`; `C₂*C₃`: `1/2+1/3−1=−1/6`. The identity HNN extension of ℤ is ℤ², with `0=0−0`. | Edge subtraction and identity-map cases correct. |
| §8.8 Smith/orbit counting | Reflection on a circle: χ(X)=0, χ(fixed)=2, χ(quotient)=1, hence `0+2=2·1`. A free circle action gives `0=2·0`. The unnormalized point complex has terms in all degrees, whereas normalized chains have only degree zero. Infinite-dimensional `EC₂` is acyclic and free but χ=1 is not divisible by two. | Normalization and finite dimension cannot be dropped. |
| §8.9 denominators | For `C₄*_{C₂}C₆`, lcm 12 times χ is −1; denominator 12 has prime powers four and three, realized by subgroups. `S₃`: `6·(1/6)=1`. `C₂×ℤ`: χ=0, denominator one although finite-subgroup lcm is two. `m=0` gives integer zero; `p⁰=1` is realized by the trivial subgroup. | Bound need not be sharp; both natural-number boundaries retained. |
| §9.1 relative projectivity | For finite G, subgroup `1` and a coefficient-projective module give the Frobenius relative situation. For `G=ℤ`, the trivial nonzero coefficient module has projective dimension one and is not Gorenstein projective, so it cannot be treated as subgroup-projective for `H=G`. | Finite index and restriction-projectivity remain substantive. |
| §9.2 complete resolutions | For `C₂`, alternating maps `1−s` and `1+s` multiply to `1−s²=0`, and each image is the next kernel. For `G=1,n=0`, the trivial module is projective and has a contractible complete resolution. | Splice and opcycles indexing correct. |
| §9.3 Farrell cohomology | For `C₂` on ℤ, degrees `−1,0,1,2` give `0,ℤ/2,0,ℤ/2`; regular coefficients give zero. For torsion-free ℤ all Farrell groups vanish. | Integer grading and normalization retained. |
| §9.4 ordinary comparison | For `C₂×ℤ`, vcd=1 and ordinary integral cohomology in every degree at least two is `ℤ/2`, agreeing with Farrell. At the excluded boundary for finite `C₂`, degree-zero comparison is `ℤ→ℤ/2`, surjective but not injective. | Strict `k>vcd` comparison bound discriminates. |
| §9.5 Tate comparison | Finite `C₂` gives the same alternating Tate values `0,ℤ/2,0,ℤ/2`; for group `1` both theories vanish in every degree. | Finite-group specialization and trivial case agree. |

The probes include cyclic and nonabelian groups, rank zero, dimensions zero through two, zero modules and ring, empty indexing, identity morphisms, finite and infinite index, non-Noetherian coefficients, primes two and three, nonreduced coefficients, nonorientability, infinite-dimensional homology and total-function junk values. DVR ramification, inseparable field extensions and analytic compactness are not parameters of these statements; they were not invented as extra hypotheses. For denominators the indices are nonzero under finite index, and finite group orders are positive. Product-comparison over the empty family is `0→0`. For signs, the odd tensor transposition, Klein-bottle orientation and `C₃` inverse-coordinate character computation above were checked against the supplier conventions.

### Source sample and proof-route checks

All fifteen requested targets were inspected. Twelve have readable supporting source text; §7.1 and §§9.2–9.3 depend on settled uncertified sources. Source verification below distinguishes an integral theorem from the package's explicitly argued coefficient extension. It does not certify an unread textbook merely because a familiar theorem is true.

| Sample | Text and locator read | Result |
| --- | --- | --- |
| §1.1 | Brown1975 line 83, Theorem 2, pp.130–131; line 105, Lemma 1, p.131; proof at line 147, p.132 | The finite-generation/finite-presentation colimit criteria and degree distinction are supported. |
| §2.1 | Serre1971Bourbaki line 40, §1.1, p.337; Brown1974 line 345, §3, p.236; BieriEckmann1973 line 139, Proposition 1.2, pp.105–106 | Integral conventions agree. General R and projective/flat-dimension characterizations use the specified native Ext/Tor route. |
| §2.4 | BieriEckmann1973 line 468, Theorem 3.5 and proof, pp.114–116; BieriEckmann1974 line 298, §3.3, pp.81–82 | Dimensions and finiteness hypotheses match the integral source. General-coefficient upper bounds use supplied Hochschild–Serre sequences; equality retains the relevant finiteness hypotheses. |
| §5.2 | Serre1971Bourbaki line 55, §1.2, p.338; Brown1975 line 216, §3, pp.134–135 | The lattice example in Serre is narrower; the README explicitly proves the general CW statement from cellular resolutions. It does not attribute all its generality to that example. |
| §5.4 | Brown1974 line 637, §6 Lemma and proof, p.244; Hatcher2002 line 7923, Theorem 2C.5, p.182 | Finite-index coinduction and finite stabilizers are supported. Hatcher explicitly preserves dimension. The realization comparisons are supplier contracts, not presumed pinned maps. |
| §6.3 | BieriEckmann1973 line 612, Theorem 4.5, pp.118–119; line 317, Theorem 2.3, p.110; line 280, Propositions 2.1–2.2, p.109; line 178, Lemma 1.3, pp.106–107 | Integral statements match; the arbitrary-R route substitutes flatness for torsion-freeness and explains the induced-module/dimension-shifting step. |
| §6.4 | BieriEckmann1974 line 253, §3.1, p.80; line 327, Theorem 3.4, p.82; BieriEckmann1973 line 624, Theorem 4.6, p.119 | The abstract-isomorphism theorem needs all degrees. The README explicitly includes the high cohomology and homology vanishings instead of silently using natural-number subtraction. Its proof avoids the source's mistaken final theorem number. |
| §6.5 | BieriEckmann1973 line 366, Theorem 3.2, p.112; line 388, Theorem 3.3, pp.112–114; line 468, Theorem 3.5, pp.114–116 | Finite-index transfer, torsion-free upward direction and tensor dualizing module agree; the ambient action is not discarded. |
| §7.1 | BrownGTM87 §IX.2 | Settled uncertified; no source-text certification. Native/supplier trace definitions and the class-coordinate computations were independently checked. |
| §7.3 | Brown1974 line 169, §1, p.232 | Integral projective lattices rationalize to free modules; the roadmap's character proof uses a genuinely pinned p-singular trace theorem. |
| §7.4 | Brown1974 line 1315, Appendix A, proof of Theorem 7, p.261 | The source's localization assertion is correctly distinguished from p-adic completion and reduction. The latter two are obtained by base change. |
| §7.5 | Brown1974 line 1284, Appendix A, Theorem 7, p.260; Lemmas 1–2 at lines 1295 and 1303, pp.260–261; proof through line 1355 | Finite generation of Γ, finite projectivity of P, finite-dimensional V and normal finite index all occur. The finite-field specialization and local lifting route have the stated generality. |
| §8.4 | Brown1974 line 388, §4 Theorem 3, pp.237–238; definition at line 411, p.238; Serre1971Bourbaki line 77, p.339 | The common quotient value and finite-index multiplicativity hold under finite homological type; virtual FP is sufficient, not incorrectly necessary. |
| §9.2 | Farrell1977; BrownGTM87 §X.2 | Settled uncertified. Native totally acyclic, syzygy and complete-comparison interfaces were checked independently; no claim to have read Farrell. |
| §9.3 | Farrell1977; BrownGTM87 §X.3 | Settled uncertified. Integer grading, comparison threshold, finite-group specialization and long-exact-sequence construction were checked mathematically. |

Further source passages read include Brown1975's finiteness criterion, BieriEckmann1973's definition and right-action conventions, BieriEckmann1974's product criterion, Brown1974's finite replacement lemma, finite homological type, twisted Euler formula and denominator proof, and Floyd1952 Theorems 2.3–2.4 and 4.2–4.4 (lines 110, 153, 292 and 333; pp.140–142 and 145–146). The Smith route uses normalized permutation chains and proves the required simplicial-set version; it does not silently assume Floyd's topological hypotheses on an arbitrary simplicial set.

Hatcher's source was missing from the original manifest and was obtained through the prescribed sources service from the author's Cornell page. Its new `Hatcher2002` record was added; the eleven original source records were preserved. The manifest now records every cited work. No unresolved source request remains. The five settled uncertified entries were not requested again.

### Pinned-library and ownership audit

The object search covered module pseudocoherence and finite projective dimension; discrete versus continuous dimension; cap products; signed tensor induction; cellular and normalized resolutions; Hattori–Stallings versus commutative projective trace; rational and p-adic Swan statements; Euler characteristics; and totally acyclic complexes, syzygies and complete comparison. The supplied search-service near matches were treated as leads, not evidence. Representative declarations actually opened at the pins are:

| Pinned file and line | Declaration / distinction checked |
| --- | --- |
| `TauCeti/Algebra/Module/PseudoCoherent/Basic.lean:89`, `:133`, `:375` | `IsPseudoCoherentOver`, `zero_iff`, `succ_iff_ker`; actual finite-degree exactness |
| `TauCeti/Algebra/Module/PseudoCoherent/RestrictScalars.lean:155` | Restriction-of-scalars equivalence and its finiteness hypotheses |
| `TauCeti/Algebra/Module/PseudoCoherent/FiniteProjectiveDimension.lean:153` | `isFPD_iff_hasProjectiveDimensionLE`, including pseudocoherence |
| `TauCeti/Data/ENat/LeastBound.lean:39`, `:70` | `leastENatBound`, least-bound characterization; no accidental natural-number infinity |
| `Mathlib/RepresentationTheory/Rep/Iso.lean:157` | `Rep.equivalenceModuleMonoidAlgebra` |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:202` | `groupCohomologyIsoExt` |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:246` | `groupHomologyIsoTor` |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`, `:123` | `IsAspherical` and `IsEilenbergMacLaneSpaceOne`; Hausdorffness is not bundled, so geometricDim's explicit T2 binder is necessary |
| `TauCeti/Algebra/MonoidAlgebra/ProjectiveTrace.lean:67` | `trace_ofModule'_eq_zero_of_dvd_orderOf`; local coefficient ring, p nonunit, finite G, finite projective module and scalar tower |
| `TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean:58` | `nonempty_linearEquiv_of_projective_of_tensorRat`; comparison of two projective p-adic modules given their rationalized equivalence |
| `TauCeti/NumberTheory/Padics/GroupAlgebra/Rational.lean:134` | Coprime-order version; insufficient to replace the all-prime target |
| `Mathlib/LinearAlgebra/Dimension/Free.lean:276` | `Module.finrank_of_not_finite`; R01's junk-value witness |
| `TauCeti/Algebra/Homology/TotallyAcyclic/Abelian.lean:113`, `:224`, `:263` | Totally acyclic projectives, `isGorensteinProjective`, projective objects as a special case; no finite-generation restriction |

The further opened declarations include `LinearMap.projectiveTrace` and its cyclicity/base-change laws; `FDRep.nonempty_iso_of_character_eq`; the two comparison-map constructors `colimit.post` and `piComparison`; normalized simplicial chains, their nondegenerate basis and dimension bound; Tau Ceti's order complex and barycentric-subdivision homeomorphism; cellular resolutions, Hurewicz and Whitehead; `TauCeti.ExactStructure.CompleteResolution.homotopyEquiv`; and `TauCeti.AbelianK0` with its bounded-complex Euler relation. The acceptance definitions specialize these objects rather than create competing carriers. No headline was found already proved at these pins. The library-search service's failed requests are recorded below rather than represented as negative search results.

Supplier citations were resolved at main for existing roadmaps, and at the indexed heads for new ones. Concrete resolutions include:

| Supplier and version read | Resolved objects |
| --- | --- |
| CohomologyOfGroups, open #2338, `TauCetiRoadmap/CohomologyOfGroups/README.md`, §§1.2, 1.4–1.5, 2.3, 3.2, 3.4–3.6, 4.6, 5.2, 6.1–6.3 | Quotient actions; permutation/character modules; discrete comparison; convergent complex and orbit sequences; tree/amalgam/HNN sequences; cap product; universal coefficients; both Hochschild–Serre sequences. Scope at lines 103–105 excludes this package's theory. |
| SpectralSequencesAndConvergence, open #2302, §§3.4 and 5.3 | Euler identities with finite page support, finite filtrations and the native/classical page shift; not an unrestricted infinite alternating sum |
| FreeGroupsAndLimitGroups, main, §§4.5, 4.7–4.9 | One-edge splittings, Bass–Serre tree, free actions, finite-group fixed points; the finite-generation qualifier in the elliptic criterion is preserved |
| SchemeKTheoryOperations, open #1229, §6.7 | Directed-union homology, including general commutative coefficients |
| EtaleCohomologyFoundations, main, §F.10.3, lines 1295 and 1322–1349 | General Hattori–Stallings trace and centralizer formula; the package owns only the group-ring class-coordinate specialization |
| ClassifyingSpaces, main, Stage 2 item 10 (line 173), Stage 4 items 16–17 (lines 224 and 237) | Hausdorff cellular K(G,1), free cellular resolution, local-coefficient comparison |
| AlgebraicTopology, main, §§4.7, 6.3–6.4, 8.1, 8.3, 8.5, 8.7, 8.11a | Simplicial realization CW structure; orientation system and twisted duality; connectivity, Hurewicz, Whitehead, finite manifold CW type and simplicial replacement |
| ProfiniteCohomology, main, Layer 11 and §13.2 | Continuous torsion-coefficient dimension and continuous Evens norm, distinguished from this package's discrete dimension and signed tensor-complex construction |
| ArithmeticKTheory, indexed open head, §3.2; BianchiModularForms, indexed open head, §9.3; FuchsianOrbifolds, main, Layer 5 item 6 | Arithmetic duality and Euler instances, not a second ownership of the general theorems |

GorensteinHomologicalAlgebra's scope expressly excludes complete cohomology of groups; SheafTheoreticSmithTheory concerns étale-sheaf Smith restriction, not the normalized simplicial-chain theorem here. BordismFormalGroups' profinite stabilizer resolutions are continuous objects. These distinctions support local ownership of §8.8 and Layer 9.

The two declared gaps have matching slugs in `design/plan.json` and `packages/FinitenessAndDualityOfGroups/README.md:618` and `:622`, named supplier AlgebraicTopology, precise hypotheses and single mathematical outputs. The dimension bound is not asserted by the current §8.11a contract; the affine order-complex/nerve map is not provided by its current §4.7. Neither was found at the pins. PosetHomotopyAndSubgroupComplexes, open #2296, also plans the affine comparison in `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:538` (§3.1), but it is not an earlier supplier in the prescribed order. This package imports the explicitly declared AlgebraicTopology contract and does not duplicate its construction. The contract's absence today is not a finding or an instruction to introduce an upward edge.

The supplied overlaps have no second copy, conflicting head, dropped cited id or id supplied only by a revision. The relevant scopes at ClassifyingSpaces heads #1807/#1808 and AlgebraicTopology head #1807 were also compared; this package cites the existing roadmaps on main, not those revisions as suppliers. No renumbering repair is warranted by the checked overlap facts.

Overlap check: read CohomologyOfGroups (#2338), PosetHomotopyAndSubgroupComplexes (#2296), ClassifyingSpaces (main, #1807, #1808), AlgebraicTopology (main, #1807), and ProfiniteCohomology (main); operations and spectral sequences belong to CohomologyOfGroups, K(G,1) models to ClassifyingSpaces, realization/manifold comparisons to AlgebraicTopology (the two named gaps included), continuous dimension and Evens norm to ProfiniteCohomology, and discrete finiteness/duality/Farrell and classical simplicial Smith theory to this package. Poset §3.1 has the same affine comparison as the declared AlgebraicTopology contract, but supplies no permissible earlier replacement for it here; its subgroup-poset refinements are outside this package's scope.

### Supplier order

Every `*Needs:*` line and supplier contract was read, including proof-route inputs. The requested dependency command returned:

```text
depcheck: 245 roadmaps, 2210 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The local chain §§7.3→7.4→7.5→8.5→8.6, §§5.4+8.8→8.9 and §§9.1→9.2→9.3→9.4 is acyclic. R04 is not a supplier edge. No forbidden roadmap is used as a supplier; references to arithmetic instances are scope boundaries or downstream applications.

### Wording, arrangement and reuse

Nineteen prose/statement comparisons were made across the twelve readable sampled targets, six additional passages (§§1.2, 3.1, 4.4, 6.1, 8.1 and 8.8), and the Hatcher supplier statement. This covers definitions, proof routes and explanatory prose against seven readable sources. The additional Lean docstrings were compared with the corresponding README mathematics. No non-forced sentence translation, clause-by-clause rewriting, copied table/figure/exercise selection or external formalization signature was identified. The three unread sampled targets are not included in the nineteen source-text comparisons.

Counting explicit source-name citation occurrences before References gives 131 keyed occurrences plus the Hatcher citation. Brown1974 has the largest share, 36 of 132. Its contents were read at Brown1974 line 36. Its arrangement is not the roadmap's: Layer 7 draws on §1 and Appendix A; Layer 4 on §3; Layer 5.4 on §6; Layer 8.1–8.2 on §1, 8.4–8.6 on §4, 8.7 on §5, 8.8 on §2 and 8.9 on §6. Brown's §§7–9 and Appendix B are not reproduced. Thus neither the layer order nor their scopes map one-for-one onto a source run. The dependencies on finite replacement, Swan, twisted Euler and finite-stabilizer Smith theory explain the retained local order. The finiteness criterion, duality criteria and geometric comparison additionally use Brown1975, BieriEckmann1973/1974 and Hatcher2002 at the locators above.

Source independence: 19 passages compared with 7 readable sources, no copied non-forced expression found; largest share Brown1974, 36 of 132 named citation occurrences before References; contents compared with Brown1974: independent. BrownGTM87, Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects remain settled uncertified, so no wording comparison against their unavailable text is claimed.

## Not verifiable

- BrownGTM87 remains settled uncertified. Its §IX.2 rank/character locators and §§X.2–X.3 complete-resolution/Farrell locators could not be read. Its other cited chapters were likewise not source-certified. No contents, numbering or wording was guessed.
- Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects remain settled uncertified. Their locators are retained under the existing keys; no new request was made. Mathematical checks and readable supporting references do not turn them into read sources.
- Several supplied LeanSearch queries returned HTTP errors/timeouts. Those results were not used to assert absence. The direct pinned-source/object audit and the actual elaboration/probes supply the library evidence reported here.
- The two named AlgebraicTopology gap outputs are not implemented supplier facts certified by this review. Their precise declarations and permitted ownership were checked as contracts.

## Source issues

- **Misprint** in BieriEckmann1974 at Theorem 3.4 proof, p.82, line 334: the source says the final duality conclusion follows from BieriEckmann1973 Theorem 4.6; it should be Theorem 4.5, the duality criterion; affects the proof.
- **Misprint** in BieriEckmann1974 at the remark after Theorem 3.4, p.82, line 337: the source says its comparison is with Theorem 4.3; it should be Theorem 3.4; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8804482c01a9fd99cca804f575e36920f718e8c4", "job": "REV-PKG-FinitenessAndDualityOfGroups", "model": "gpt-6-astra", "worker": "chris-9"} -->
