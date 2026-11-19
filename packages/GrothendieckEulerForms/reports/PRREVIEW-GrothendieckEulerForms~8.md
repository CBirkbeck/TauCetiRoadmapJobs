# Review of GrothendieckEulerForms (pull request #2585 at 2e2d75c)

**Verdict:** needs changes

**Summary.** One finding: the README says that Dancso–Licata's Definition 2.3 contradicts its own sesquilinearity, and a Check in §6.3 claims that their formula gives `χ_q(M, M{1}) = q⁻¹`. Both claims are false. Under their own shift convention and their own Gram-matrix computations, their `q`-Euler form is exactly Convention 12 and gives `q`. The stated results, the Lean target `gradedCartanMap_bijective` and the computed Checks all hold. There are five small corrections (three on locators, one on a "necessary" claim in §5.8, one on the description) and one format note, none of them blocking. Two facts are left for the human reviewers.

## R01 (P2) — Dancso–Licata's Definition 2.3 agrees with its sesquilinearity, so the README's claim of a reversed exponent, and the Check built on it, are false

The README tells the reader two things. First, that a published definition contradicts itself ("The displayed exponent of `qdim` in Definition 2.3 … is reversed relative to the sesquilinearity stated in the same definition"). Second, that following that definition gives `χ_q(M, M{1}) = q⁻¹`. In fact the source's convention is exactly the roadmap's.

Definition 2.3 (dancso-licata lines 293–302, p. 7) takes the coefficient of `qᵏ` to be the dimension of the degree-`k` part of `Ext(M, N)`, that is, of the maps that raise degree by `k`. Their shift moves generators up. In Proposition 2.4 (lines 237–242, p. 6), the map `Pⱼ{1} → Pᵢ` is multiplication by a path of length 1. It has degree 0 only if the generator of `Pⱼ{1}` sits in degree 1, so `(M{j})_p = M_{p−j}` as in Convention 12. Under that shift, the degree-`k` part of `Hom(M, N)` is `Hom(M, N{−k})`. Their `qdim` is therefore `∑ⱼ q⁻ʲ dim Hom(M, N{j})`, which is Convention 12. For `M` one-dimensional in degree 0, their formula gives `χ_q(M, M{1}) = q`.

Their own numbers confirm this reading. In Example 3.3 (lines 436–449, p. 10), the Gram entry `⟨[P₃],[P₁]⟩ = q` comes from a path map that raises degree by 1. Their values `⟨[L₁],[P₁]⟩ = q⁻²` and `⟨[L₃],[P₁]⟩ = q − q⁻¹` follow from it by antilinearity in the first slot. The README's reading, with the coefficient of `qᵏ` equal to `dim Hom(M, N{k})`, would instead give `⟨[P₃],[P₁]⟩ = q⁻¹` and `⟨[L₁],[P₁]⟩ = 1`. Line 305, `Hom(M{−1},N) = Hom{1}(M,N) = Hom(M,N{1})`, is consistent with this once `Hom{1}` is read as the shifted graded Hom.

The false sentences are in the introduction of Layer 6 (lines 1279–1283) and in the second sentence of the §6.3 Check (lines 1334–1335). The smallest repair:

- Replace lines 1279–1283 with: "Definition 2.3 takes the coefficient of `qᵏ` to be the dimension of the degree-`k` part of `Ext(M, N)`, the maps raising degree by `k`; with the shift `(M{j})_p = M_{p−j}` that Dancso and Licata use (Proposition 2.4), this is `Ext(M, N{−k})`, so their form is the `q⁻ʲ` convention of Convention 12."
- In the Check, replace "The exponent displayed in Dancso–Licata, Definition 2.3, would give" with "Reading the coefficient of `qᵏ` as `dim Hom(M, N{k})` would give". The Check still separates the two conventions.

## C01 — The resolution theorem is cited to K-book Theorem II.7.6, whose hypotheses are not the ones stated; the stated form is Theorem V.3.1

Theorem II.7.6 (weibel-kbook lines 7442–7447, p. 135) works inside an abelian category `A`. It requires the ambient `C` to be closed under kernels of surjections in `A`, and it puts no kernel condition on `P`. §3.2's resolving hypotheses are a different set, stated for an arbitrary exact category: `P` is closed under extensions and under kernels of deflations between `P`-objects. That is Theorem V.3.1 (lines 22950–22955, p. 385), whose `K₀` case is the statement here.

The difference matters for the module applications. Over a non-noetherian ring, finitely generated modules are not closed under kernels, so II.7.6 does not cover §4.4's "for any ring" or the arbitrary grading data of the Lean target. V.3.1 covers both. The stated results are correct and pinned; only the locators change. Cite V.3.1 in the Layer 3 introduction (line 595), §§3.2–3.4 (lines 638, 654, 665), §4.4 (line 914) and the docstring of `gradedCartanMap_bijective` in `Suggested.lean` (line 192). Keep II.7.6 and Lemma II.7.6.1 as the route.

## C02 — Five locators point at a neighbouring statement

The statements are right; the locators should move.

- §1.2 (line 357) cites "Sections II.6.1–6.2". The presentation and its universal property are 6.1.1–6.1.3 (pp. 113–114); 6.2 defines `G₀` of a noetherian ring.
- §2.5 (line 535) cites Exercise II.9.15 for the Euler-class comparison in an extension-closed `P`. That comparison is Proposition II.7.5 (p. 134); II.9.15 (p. 173) supports only the two bounded comparisons.
- §0.3 cites only Remarks 2.2–2.8 (line 243) for its admissible-morphism target. The definition and the uniqueness of the factorization are Bühler, Definition 8.1 and Lemma 8.4 (p. 25).
- §6.3 (line 1329) cites Proposition 2.7 for sesquilinearity. Sesquilinearity is stated in Definition 2.3 and footnote 1 (pp. 7–8); Proposition 2.7 gives bases of `K₀`.
- §6.4 (line 1347) cites Section 3.2 for the conjugate-transpose change of basis. That is Dancso–Licata, Section 3.1 (p. 9); Section 3.2 supports the dual-basis sentence.

## C03 — The fourth headline theorem and the Betti series have no source

The Summary's fourth theorem, `C(q) · B(q, −1) = I`, has no locator in the Summary or in §4.5 (lines 957–972). Neither do §3.7's Betti Poincaré series and its diagonal criterion (lines 739–760), or §4.5's target for arbitrary grading data. A reader cannot check the hypotheses against a source. Add a locator for each, for instance where the Euler identity for minimal graded resolutions is proved in the Koszul-duality literature.

## C04 — §5.8 overstates the two-loop example as "finite dimension of `kQ` is necessary"

The quiver with one loop gives `kQ = k[x]`, which is infinite-dimensional but noetherian. The pinned `TauCeti.GradedModuleCat.isGradedExtComparison_toModuleCat` (graded algebra, noetherian, `X` finitely generated) gives the comparison for every finitely generated `X` there, so finite dimension is not necessary. The two-loop computation is correct: `∏_ℕ k` has uncountable dimension and `⊕_ℕ k` countable dimension. It shows that the hypothesis cannot simply be dropped. At line 1240, "Prove that the comparison can fail when `kQ` is not noetherian" would be accurate.

## C05 — The description says every section names its source, and repeats R01

"Each section now names its source at the claim" is contradicted by the head. Nineteen of the 46 numbered sections name no source: §§1.3, 1.4, 2.6, 3.1, 3.6, 3.7, 4.1, 4.3, 4.5, 5.1, 5.3, 5.7, 5.8, 6.2, 6.5, 6.6, 7.1, 7.2 and 7.3. "Each section that rests on a source now names it at the claim" would be accurate. The Checks bullet that tests the `q`-exponent "against Dancso–Licata's displayed formula" should change with R01, for example to "against the opposite exponent convention".

## N01 — `Suggested.lean` is mostly a catalogue of `#check` pins

The file has 87 `#check` lines. Most of them pin layer API rather than the headline theorems ("The remaining pins record the further theorems of the layers"). The README already names these declarations. Keeping only the pins of the headline theorems the docstring lists would follow the house form.

## Questions for the author

- §4.5, line 960: what does "local finiteness" mean in the coefficientwise form of `C(q) · B(q, −1) = I`? With `A` finite-dimensional, it is enough that for each `(i, d)` only finitely many `n` have `β^n_{i,d} ≠ 0`. Then every internal-degree strand of the resolution is a finite exact sequence, which gives the identity. If the term means more than this, please state the hypothesis. The term is defined nowhere, so I could not tell which hypothesis is meant.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §0.5 split vs canonical (Bühler 13.1–13.3, pp. 48–49) | dual numbers `0→(ε)→A→A/(ε)→0` | short exact; a splitting gives `A≅k⊕k` with `ε` acting by 0, but `ε·1=ε≠0` | holds; extension-closed structure also Bühler Lemma 10.20, p. 38 | none |
| §1.2 presented group (K-book II.6.1–6.2) | f.d. vector spaces | II.6.1.1–6.1.2 present `K₀` with universal property; 6.2 is `G₀(R)` | supported | C02 |
| §2.6 graded exact categories | f.d. graded vector spaces, forgetful functor | `[k{1}]−[k] ↦ 1−1 = 0`; graded group free on `[k{n}]` | Check true; no source | C05 list |
| §3.1 finite resolutions | inductive base/step vs K-book P-resolution, p. 135 | Tau Ceti `FiniteResolution` (Resolution/Basic.lean) matches the README wording | holds | none |
| §3.4 resolution theorem (K-book II.7.6) | `1⟶2`: `0→P₂→P₁→S₁→0` | inverse `[S₁]=[P₁]−[P₂]`; II.7.6 needs abelian `A`, `C` kernel-closed; README hypotheses are V.3.1's | true, pinned; locator hypotheses differ | C01 |
| §3.5 projective calculus (Bühler §§11–12) | lift, homotopy, horseshoe | Bühler 12.4 (p. 44), 12.5, 12.8 (p. 46), 12.9 split columns | supported | none |
| §4.3 Cartan matrix | `1⟶2`, reversed arrow, transpose | `C=[[1,0],[1,1]]=(1−Aᵀ)⁻¹`; both slips give `[[1,1],[0,1]]`; Webb 7.4.2 `c_ST=[P_T:S]` p. 117 | holds | none |
| §4.6 unimodularity (ASS III.3.10) | dual numbers; `1⟶2`; empty index type | det `[2]=2`; det `C=1`; 0×0 det `1` | holds; source unread | none |
| §5.2 Euler–Poincaré (K-book II.6.6) | bounded complex | II.6.6 (p. 124): `Σ(−1)ⁱ[Cᵢ]=Σ(−1)ⁱ[Hᵢ]`; pinned with explicit support | supported | none |
| §5.3 Ext-finite pairs | dual-number residue `(S,S)` | `Extⁿ(S,S)=k` ∀n: finite, unbounded, not admissible; `of_shortExact₂`/`₂′` cover both variables | holds; no source | none |
| §5.5 descent (K-book II.7.5) | extension-closed `P`, `Q` | II.7.5 (p. 134) Euler char in `K₀(C)`; descent via `bilift` | supported | none |
| §6.2 finite Laurent support | `M` one-dim degree 0; source shift | `qdim Ext(M{1},N)=q⁻¹ qdim Ext(M,N)`; reindexed form `Σ qʲ dim Ext(M{j},N)` equal | holds; no source | none |
| §6.4 matrices and duality (D–L 3.2) | D–L Example 3.3, `K_{2,1}` | `⟨[Pᵢ],[Lⱼ]⟩=δ`; `⟨[L₃],[P₁]⟩=−q⁻¹+q` as printed; `C̄ᵀE=I` | holds; basis change is D–L 3.1 | C02 |
| §6.6 forgetting grading | graded vector spaces | `forgetGradingMap_injective_iff`: kernel `= (ker eval₁)•⊤`, as the prose says | holds; no source | none |
| §7.1 radicals | `x₁y₂` on `ℤ²`; `bar(x)(1−q)y` | radicals `{x₁=0}`, `{y₂=0}`; symmetrization `0,0`; sesquilinear `0,0`, whole at `q=1` | holds | none |
| §7.2 numerical quotients | `2xy` and `0` on `ℤ` | radicals `0` with pairing not perfect; zero pairing: quotients `0` | holds | none |
| Headline 1: resolution theorem and Cartan `±1` | dual numbers; `1⟶2` | `C=[2]`, det 2 not a unit; det 1; pinned det theorem's hypotheses match §4.6 | holds | none |
| Headline 2: `CᵀE=D` | `ℝ⊂ℂ`; `1⟶2` | `[1][2]=[2]=D`; `[[1,1],[0,1]][[1,−1],[0,1]]=I`; `CE=[[1,−1],[1,0]]` | holds | none |
| Headline 3: graded Cartan, `q=1` value | graded `1⟶2`; one-dim `M` | `Ext¹_gr(S₁,S₂{j})=k` iff `j=1`, sum `=Ext¹(S₁,S₂)=k`; `χ_q(M,M{1})=q`, at `q=1` gives `1` | holds | none |
| Headline 4: `C(q)B(q,−1)=I` | `1⟶2`; graded dual numbers; `q⁻ᵈ` convention | `[[1,0],[q,1]][[1,0],[−q,1]]=I`; `(1+q)Σ(−q)ⁿ=1`; `q⁻ᵈ` gives `q−q⁻¹` | holds; no source | C03 |
| Lean `gradedCartanMap_bijective` (any `𝒜`) | `𝒜ᵢ=⊤`, `A=0`, `A=k` with `𝒜=0`; probe | `𝒜ᵢ=⊤` forces graded modules 0; resolving route valid; pinned theorem needs `Decomposition` | true; not padding | none |
| §6.3 Check vs D–L Def 2.3 | one-dim `M`; D–L Ex. 3.3 | D–L's form gives `χ_q(M,M{1})=q`; README says `q⁻¹`; D–L `⟨[P₃],[P₁]⟩=q` | README claim false | R01 |
| §5.8 two-loop example | one loop `k[x]`; two loops | `k[x]` noetherian, comparison pinned; two loops: dimensions `2^ℵ₀` vs `ℵ₀` | example right; "necessary" overstated | C04 |
| §5.8 graded form, Convention 12 | `1⟶2` graded simples | `χ_q(Sᵢ,Sⱼ)=δᵢⱼ−q⁻¹#(i→j)` recomputed | holds | none |
| `E₈` worked example | Bourbaki numbering minus one | edges 0–2, 1–3, 2–3, …, 6–7 match `TauCeti.Quiver.E8` (E8/Basic.lean:46) | holds | none |

- Source locators checked in the cached texts: 31 (Bühler 2.3, 2.9, 2.12, 8.1, 8.4, 10.20, 12.4, 12.5, 12.8, 13.1–13.3; K-book II.6.1.1–6.1.3, 6.2, 6.6, 7.0, 7.5, 7.6, 7.6.1, 9.15, V.3.1; Dancso–Licata 2.3, 2.4, 2.7, 3.1, Def. 3.1, 3.2, Ex. 3.3, 3.4; Webb 7.4.1, 7.4.2).
- Library declarations opened at the pins: 24, among them GradedModuleCat/Basic.lean:62, CartanMap/Basic.lean:108/112/553, CartanMap/Resolution.lean:69–298, Exact/Resolving.lean:84, Resolution/Basic.lean (`FiniteResolution`), ExtEuler/Basic.lean:392/401, GradedModule/Resolution.lean:91, Mathlib Laurent.lean:590/600, Quotient/Bilinear.lean:28, ExactFunctor.lean:84.
- 242 qualified Tau Ceti and Mathlib names of the README were checked against the pinned sources; all are declared.
- Cross-roadmap citations resolved on main: QuiverRepresentations §§0.1, 2.1, 3.1, 3.3, 4.1; ClassicalArithmeticCompletion §7.8; AlgebraicKTheory §§0.1–0.4; KTheoryLowDegrees §1.1; DGAInfinity Layer 11; ZigzagPreprojective `(1+q²)I+qA`.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, and the only warning is `sorry` at line 193; all 87 `#check` pins elaborate.
- `#check @gradedCartanMap_bijective` matches §4.5 (commutative `k`, arbitrary `𝒜`, the resolution hypothesis); no binder is lost and nothing needed changing.
- One-tactic probe on a scratch copy: `exact TauCeti.gradedCartanMap_bijective 𝒜 h` fails because `DirectSum.Decomposition 𝒜` cannot be found, and `simp_all` fails; with the instance added, `exact` closes. So the target asks for something.

Overlap check: read QuiverRepresentations, GeneralAlgebraicKTheory, ArtinAlgebras, DGAInfinity and HopfologicalAlgebra. Shared objects and their owners: QuiverRepresentations §3.3 owns the composition-factor Cartan matrix, and §4.3 here only compares it with Tau Ceti's column matrix; this roadmap owns exact structures, as ArtinAlgebras says; this roadmap owns the `K₀` resolution theorem, while GeneralAlgebraicKTheory §4.6 owns the higher-`K` form and consumes the pinned `K₀` form. No other open pull request changes this roadmap or drops an id it cites.

Source independence: 11 passages compared with 4 sources, with no shared wording. The longest run, 8 words, is the standard hypothesis phrase of K-book V.3.1; the rest are titles. Largest share: weibel-kbook, 18 of 49 locators. Contents compared with weibel-kbook Chapter II: independent. Layers 1–3 draw on §§II.1, 5, 6, 7 and 9 without a one-to-one mapping, and Layers 0 and 4–7 have no counterpart there.

Research link: Layers 5–7 build the graded `K₀`, the `q`-Euler form and left/right duality that Dancso–Licata (JCTA 2022) use to realise integer cut and flow lattices as Grothendieck groups of Koszul algebras, and Layer 3's linear resolutions feed the Koszul duality of DGAInfinity and ZigzagPreprojective. This line rests on the README and on the dancso-licata text read.

## Not verifiable

- Assem–Simson–Skowroński III.3.4, 3.7, 3.8, 3.10, 3.13 (§§4.4, 4.6, 5.6): paywalled, recorded as uncertified in the manifest.
- Weibel, *An Introduction to Homological Algebra*, §§1.3, 1.6, 2.4–2.7 and Chapter 4 (Layer 5): paywalled, recorded as uncertified.
- Bühler: read as arXiv v2. The numbering of the published Expositiones version, which the References cite, was not compared.

Automatic checks set aside as false positives: the listing of `Suggested.lean` declarations read the words "instance" and "structure" at the start of docstring lines 87 and 185 as declarations named `)` and `of`. Both are prose, not Lean declarations.

## Source issues

- **Gap** in weibel-kbook at Theorem II.7.6 and its proof, p. 135: the proof applies Corollary 7.5.1 to complexes of `P`-objects to compare Euler classes in `K₀(P)`, which needs `P` closed under kernels of surjections; it should assume that closure of `P`, as Theorem V.3.1 does; affects the proof.

## For the human reviewers

- `StablePeriodicCurved/Suggested.lean` on main imports this roadmap's module (line 3) and uses `ExactStructure.Conflation`. The two non-headline declarations kept in this file serve only that cross-roadmap import, which the house rules for Lean imports do not allow.
- The claim that Dancso–Licata's Definition 2.3 contradicts its own sesquilinearity may also stand in the project's errata register. Dancso–Licata, Example 3.3 (p. 10), shows the definition is consistent (R01).
