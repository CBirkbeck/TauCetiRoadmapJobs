# Review of GrothendieckEulerForms (pull request #2585 at e52e69d)

**Verdict:** accepted

**Summary.** No findings: this roadmap folder is ready for a human's final approval. The earlier finding on Dancso–Licata's Definition 2.3 is repaired, and the new reading agrees with their Proposition 2.4 and Example 3.3. The five earlier small corrections are repaired, and the new Beilinson–Ginzburg–Soergel locators state what §§3.7 and 4.5 cite them for. The four headline theorems, the `sorry`'d graded Cartan target and every Check recompute correctly. Removing the path-algebra comparison from `Suggested.lean` is justified, because the pinned theorem implies it in three lines. One small correction remains, none blocking: AlgebraicKTheory is named as a consumer, but it cites no roadmap. One fact is left for the human reviewers: StablePeriodicCurved's Lean file imports this module.

## C01 — AlgebraicKTheory is named as a consumer of this roadmap, but it uses Tau Ceti's split K₀ directly and cites no roadmap as an input

A reader who follows the overview or the consumer list to AlgebraicKTheory will not find this roadmap there. The overview (lines 54–56) says that AlgebraicKTheory and KTheoryLowDegrees "build on the split and exact `K₀` here". The consumer list (lines 1629–1631) says that AlgebraicKTheory uses "the split and exact `K₀`, the additive functor maps and the resolution comparisons of Layers 2–3". AlgebraicKTheory on main never mentions GrothendieckEulerForms and uses no resolution comparison. Its scope takes Tau Ceti's `TauCeti.SplitK0` as "the single categorical split K₀ engine" (its line 15), and it says that none of the roadmaps it leaves material to is cited as an input (its line 17). KTheoryLowDegrees and GeneralAlgebraicKTheory do cite Layers 2–3 here, so the sentences hold for them.

The smallest repair is to drop AlgebraicKTheory from both places. Alternatively, say that it uses Tau Ceti's `TauCeti.SplitK0`, the carrier of §2.1, directly. Neither sentence was in the README on main.

## Earlier findings

- R01, repaired. The introduction of Layer 6 (lines 1284–1288) now says that Definition 2.3 "takes the coefficient of `qᵏ` to be the dimension of the degree-`k` piece of `Ext(M, N)`", which is `Ext(M, N{−k})` under the shift of Proposition 2.4. The Check of §6.3 (lines 1338–1340) now contrasts this with "Reading the coefficient of `qᵏ` as `dim Hom(M, N{k})`". Both agree with dancso-licata lines 237–242, 293–305 and 436–449.
- C01, repaired. Theorem V.3.1 is now cited in the Layer 3 introduction, §3.2, §3.4, §4.5 and the docstring of `gradedCartanMap_bijective`. §4.4 keeps Theorem II.7.6, and that locator is sound there. The hypothesis that every finitely generated module has a finite resolution by finitely generated projectives makes every finitely generated module finitely presented. So the ring is left Noetherian, and finitely generated modules are closed under kernels of surjections, which is II.7.6(b).
- C02, repaired: §1.2 cites II.6.1.1–6.1.3, §2.5 cites Proposition II.7.5, and §0.3 cites Bühler Definition 8.1 and Lemma 8.4. §6.3 cites Definition 2.3 and the footnote to Definition 3.1 (dancso-licata lines 352–376), and §6.4 splits its citation between Sections 3.1 and 3.2.
- C03, repaired. §3.7 cites BGS Definition 2.14.1 and Proposition 2.14.2, and §4.5 cites BGS Lemma 2.11.1 and Theorem 2.11.1. All four match the text.
- C04, repaired: line 1245 now says that the comparison "can fail when `kQ` is not Noetherian".
- C05, repaired in the description.
- N01, partly repaired. The file now has 24 pins instead of 87, and 13 of them still pin Layer 0 and Layer 3 lemmas, as the docstring says. This is form only.
- The earlier question about "local finiteness" is answered: §4.5 (lines 961–963) states the hypothesis on `β^n_{i,d}`.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §0.5 split vs canonical (Bühler 13.1–13.3) | dual numbers `0→(ε)→A→A/(ε)→0` | a splitting makes `A≅k⊕k` with `ε` acting by 0, but `ε·1=ε≠0`; Bühler lines 2499–2538 give split, abelian, fully exact | holds | none |
| §1.2 presented group (K-book II.6.1.1–6.1.3) | f.d. vector spaces | 6.1.1 presentation, 6.1.2 universal property, 6.1.3 skeletal smallness (pp. 113–114); free group alone keeps `[k²]≠2[k]` | supported | none |
| §1.4 product of presented groups | `C×D` with biproduct relations | `[(X,Y)]=[(X,0)]+[(0,Y)]`; the inverse `[X]↦[(X,0)]` respects the relations, since `[0⊞0]=2[0]` gives `[0]=0` | holds as stated | none |
| §2.2 exact K₀ (K-book II.7) | split structure inside `E` | II.7.1 (p. 129); split conflations lie in `E` (Bühler 2.9), so `fromSplit` = `ofLE` after the split identification | holds | none |
| §2.3 abelian K₀ (II.6.1.2) | dual numbers | abelian: `[A]=2[S]`; split `K₀` free on `[S]`, `[A]`; comparison not injective | holds | none |
| §3.3 Euler class (proof of II.7.6, Lemma 7.6.1) | `1⟶2`, `0→P₂→P₁→S₁→0` | `χ(S₁)=[P₁]−[P₂]`; common refinement and cone, pp. 135–136 | supported; source gap below | none |
| §4.4 Cartan isomorphism (II.7.6) | any ring with every f.g. module resolved | f.g. ⇒ finitely presented ⇒ left Noetherian ⇒ II.7.6(b) holds | locator valid | none |
| §4.5 graded Cartan, BGS 2.11.1 | graded `1⟶2`; graded dual numbers | `[[1,0],[q,1]]·[[1,0],[−q,1]]=I`; `(1+q)Σ(−q)ⁿ=1`; BGS `P(A,t)P(V,−t)=1` is `C(q)B(q,−1)=I` | holds | none |
| §3.7 converse, BGS 2.14.2 | BGS shift `(M⟨n⟩)ⱼ=M_{j−n}` (line 187); `k[x]/(x²)` | `ext^i(M,k⟨n⟩)=0` unless `i=n` is the `A₀{j}` test; series `1+q²t` is off the diagonal | supported | none |
| §5.4 Ext-Euler value | simple modules of `1⟶2` | `χ(S₁,S₂)=0−1=−1`, `χ(S₂,S₁)=0`, `E=[[1,−1],[0,1]]` | holds; source uncertified | none |
| §5.5 descent (II.7.5) | extension-closed `P`, `Q` | additivity in both slots (§5.4) with II.7.1's universal property; II.7.5 gives `χ=0` on exact complexes | supported | none |
| §5.7 graded/ungraded comparison | `(S₁,S₂)` for `1⟶2`; two loops, `X=kQ/(xyⁿ)` | `Ext¹_gr(S₁,S₂{j})=k` iff `j=1`; two loops: `⊕_ℕ k` countable vs `∏_ℕ k` uncountable | Checks true | none |
| §5.8 quiver comparison | one loop `k[x]`; two loops; graded `1⟶2` | `k[x]` is Noetherian, so the pinned comparison applies; `χ_q(S₁,S₂)=−q⁻¹=δ−q⁻¹·#(1→2)` | holds | none |
| §6.1 shift module (Dancso–Licata §2.2) | one-dimensional `M` | `[M{1}]=q[M]`, as in dancso-licata line 292 | supported | none |
| §6.5 specialization | `[[1,q],[q,1]]`; `M{n}` | det `1−q²`, zero at `q=±1`; class of `M{n}` at `q=−1` is `(−1)ⁿ[M]` | holds | none |
| §6.6 forgetting grading | f.d. graded vector spaces | `[k{1}]−[k]↦0` lies in `(ker ev₁)·K₀`; the `q=1` base change is then injective | holds | none |
| Layer 6 versus Definition 2.3 | one-dimensional `M` in degree 0; Example 3.3 | degree-`k` piece is `Ext(M,N{−k})`; `χ_q(M,M{1})=q`; Gram entry `⟨P₃,P₁⟩=q` | holds | none |
| §6.3 locator, footnote to Definition 3.1 | dancso-licata lines 352–376 | footnote 1 on "sesquilinear": antilinear in the first slot, linear in the second | supported | none |
| Headline 1: resolution theorem, det `±1` | dual numbers; `1⟶2` | `C=[2]`, det 2 not a unit; det `[[1,0],[1,1]]=1`; V.3.1 hypotheses are §3.2's | holds, pinned | none |
| Headline 2: `CᵀE=D` | `ℝ⊂ℂ`; `1⟶2` | `[1]·[2]=[2]=D`; `[[1,1],[0,1]]·[[1,−1],[0,1]]=I`; `CE=[[1,−1],[1,0]]` | holds, pinned | none |
| Headline 3: Lean `gradedCartanMap_bijective` | `𝒜ᵢ=⊤`; `A=k`, `𝒜=0`; probe | `𝒜ᵢ=⊤` forces every graded module to be 0; `A=k`: all f.d. spaces projective, identity map | true; not padding | none |
| Headline 4: `C(q)B(q,−1)=I` coefficientwise | graded dual numbers; degree strands | coefficient of `qᵐ`: finitely many `d` in `C`, finitely many `n` per `(k,d′)`; strands are finite exact sequences | holds | none |
| Removed path-algebra target | derivation in a test file | `isGradedExtComparison_toModuleCat X Y` with `IsNoetherianRing.of_finite` closes main's statement | removal justified | none |
| Consumer sentence about AlgebraicKTheory | AlgebraicKTheory README on main | 0 mentions of this roadmap; `TauCeti.SplitK0` used directly (line 15); no roadmap input (line 17) | sentence inaccurate | C01 |

- Source locators checked in the cached texts: 37 in all.
  - weibel-kbook: II.6.1.1–6.1.3, 6.6, 7.0, 7.0.1, 7.1, 7.5, 7.5.1, 7.6, 7.6.1, 9.15 and V.3.1.
  - buhler-exact: 2.1, 8.1, 8.4 and 13.1–13.3.
  - dancso-licata: §§1.1, 1.2, 2.2, Definition 2.3, Propositions 2.4 and 2.7, Definition 3.1 with footnote 1, §§3.1–3.2, Definition 3.2 and Example 3.3.
  - bgs-koszul: the shift convention (p. 477), 2.1.1, the conditions of 2.11, Lemma 2.11.1, Theorem 2.11.1, Definition 2.14.1 and Proposition 2.14.2.
- Library declarations opened at the pins:
  - Tau Ceti: GradedModuleCat/Basic.lean:62, GradedModuleCat/CartanMap/Basic.lean:344, CartanMap/ExtEuler/Matrix.lean:276–299, GradedDimension.lean:332, LinearResolution/Converse.lean:78, Simple.lean:54, Poincare.lean:67, ModuleCat/CartanMap/Basic.lean:545, and the 24 pinned signatures.
  - Mathlib: MorphismProperty/Composition.lean:106.
  - No admissible-morphism definition exists under CategoryTheory/Exact/.
- Cross-roadmap citations resolved on main: QuiverRepresentations §§0.1, 2.1, 3.1, 3.3 and 4.1; ClassicalArithmeticCompletion §7.8; AlgebraicKTheory §§0.1–0.4; KTheoryLowDegrees §1.1; DGAInfinity Layer 11 (which takes linear resolutions from Layer 3 here); ZigzagPreprojective `(1+q²)I+qA`.
- Automatic checks: all passed, and passed again when re-run. Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, and the only warning is `sorry` at line 134. `#check @gradedCartanMap_bijective` matches §4.5 (commutative `k`, arbitrary `𝒜`, the resolution hypothesis). No binder is lost, and nothing needed changing.
- One-tactic probe on a copy of the file: `exact TauCeti.gradedCartanMap_bijective 𝒜 h` fails for lack of `DirectSum.Decomposition 𝒜`, and `simp_all`, `exact?` and `aesop` fail as well.
- Counts that agree with the description: 25 Checks (12 on main); 46 sections, each with a *Needs:* line; 24 pins (72 on main); 20 Tau Ceti imports, of which 8 are main's.

Overlap check: read QuiverRepresentations, DGAInfinity, GeneralAlgebraicKTheory, ArtinAlgebras and HopfologicalAlgebra; shared objects and their owners:
- QuiverRepresentations §3.3 owns the row-convention Cartan matrix; §4.3 here only compares it with Tau Ceti's column matrix.
- This roadmap owns exact structures (ArtinAlgebras line 69) and linear graded resolutions (DGAInfinity Layer 11 takes them from Layer 3).
- GeneralAlgebraicKTheory owns higher K-theory and consumes Layers 2–3; HopfologicalAlgebra consumes Layer 6.
- Admissible morphisms are planned nowhere else.
- Every sibling checkout of an open pull request was searched for these objects. No open pull request changes this roadmap or drops an id it cites.

Source independence: 14 passages compared with 4 sources, none shared beyond forced phrasing.
- The longest runs are the 7-word hypothesis phrase of K-book V.3.1 in the overview, and 8 words describing Dancso–Licata's Definition 2.3 in Layer 6.
- Largest share: weibel-kbook, 19 of about 54 locators.
- Contents compared with weibel-kbook Chapter II: independent. Layer 2 takes §§II.5, II.7, II.6 and II.9.15 in a different order, and Layers 0 and 4–7 have no counterpart there.

Research link: Layers 5–7 build the graded `K₀`, the `q`-Euler form and the left and right duals that Dancso–Licata (JCTA 2022) use to realise cut and flow lattices as Grothendieck groups of Koszul algebras. Layer 3 and §4.5 give the linearity criterion and Hilbert-series identity of Beilinson–Ginzburg–Soergel (JAMS 1996). This line rests on the README and on the dancso-licata and bgs-koszul texts read.

## Not verifiable

- Assem–Simson–Skowroński, I.4–5 and III.3.4, 3.7, 3.8, 3.10 and 3.13 (§§4.4, 4.6, 5.6): paywalled, and recorded as uncertified in the manifest.
- Weibel, *An Introduction to Homological Algebra*, §§1.3, 1.6 and 2.4–2.7 and Chapter 4 (Layer 5, §5.4): paywalled, and recorded as uncertified.
- Bühler was read as arXiv v2. The numbering of the Expositiones version that the References cite was not compared.
- Webb, Proposition 7.4.1 and Corollary 7.4.2 (§§4.2, 5.6) were not re-read this round, because they lie outside the sample.

Automatic checks set aside as false positives: the listing of `Suggested.lean` declarations counts two docstring words as declarations. "instance" at the start of line 60 is read as a declaration named `)`, and "structure" at the start of line 126 as one named `of`. Both are prose.

## Source issues

- **Gap** in weibel-kbook at Theorem II.7.6 and its proof, p. 135: the source compares Euler classes in `K₀(P)` by Corollary 7.5.1, which needs `P` closed under kernels of surjections, while hypothesis (b) concerns `C` only; it should assume that closure of `P`, as Theorem V.3.1 does; affects the proof.
- **Misprint** in bgs-koszul at the proof of Lemma 2.11.1, p. 487: the source writes the `(x, y)` entry of a tensor product as a sum over `z` of `[M]_{x,z}[N]_{z,x}`; it should be `[M]_{x,z}[N]_{z,y}`; affects nothing.

## For the human reviewers

- `StablePeriodicCurved/Suggested.lean` on main imports this module (line 3) and uses `ExactStructure.Conflation` (lines 277–289). The two non-headline declarations kept in this file serve only that import between roadmaps, which the import rules for `Suggested.lean` do not allow.
