# Review of StablePeriodicCurved (pull request #2668 at 041f6c6)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. Both findings of the previous review are repaired. §4.5 now describes the tail of an eventually periodic resolution as a truncation of the unfolding of one period, which checks out on `k[x]/(x²)`, `k[x]/(x³)` and `A/(x^i)` against the pinned `powerXPeriodicComplex`. The curved example of §5.5 is now restricted to degree one. Its six small corrections and its format note are repaired too. Three small corrections remain: "truncation" should say which truncation, two locators are imprecise, and the description gives a stale line count. There is one format note, and nothing is left for a human to decide.

## C01 — "Truncation" in §4.5 and its three echoes has to be the brutal truncation; read as Mathlib's `CochainComplex.truncLE`, the target is false

An implementer who takes "the truncation in degrees at most `-p` of the unfolding" (§4.5, line 884) to be Mathlib's `CochainComplex.truncLE` gets a false target. That declaration (`Algebra/Homology/Embedding/CochainComplex.lean:42`) is the canonical truncation. Take `k[x]/(x²)` and the resolution of `k`, with `p = 0` and `m = 1`. The canonical truncation of the unfolding has the cycles `(x) ≅ k` in degree `0`, not `A`, so it is not the tail. The tail is the brutal truncation, Mathlib's `HomologicalComplex.stupidTrunc` (`Algebra/Homology/Embedding/StupidTrunc.lean:36`). Writing "the brutal (stupid) truncation" in §4.5 would remove the ambiguity. The same change applies in the Examples of Layer 4 (line 920), the Examples of Layer 7 (line 1342) and §8.2 (line 1412).

## C02 — Two locators point to sections that do not contain the cited facts

- §2.6 (line 515) cites Buchweitz §4 for the self-injective case and the finite-global-dimension case. §4 contains neither. Quasi-Frobenius rings, for which every finitely generated module is maximal Cohen–Macaulay and `D_sg` is the stable module category, are treated in §8.1 (p. 80). The fact that a module is perfect exactly when its projective dimension is finite, which gives `D_sg = 0`, is in §1.1 (p. 7).
- §0.3 (line 191) cites Bühler §§7, 10–13 for relative projectives and Frobenius exact categories. §7 is about weak idempotent completeness and §10 about acyclic complexes. Projective objects and enough projectives are in §11 (p. 41) and Frobenius categories in §13.4 (p. 50), so "Bühler, §11 and §13.4" would be exact. The same range in §2.7 is apt, since §§7 and 10 are what that section uses.

## C03 — The description gives the length of `Suggested.lean` at the previous head

"It is replaced by a 212-line file" was true at the previous head. The file now has 221 lines, because the repair added docstring sentences, so "a 221-line file" would be correct.

## N01 — The existence and uniqueness of minimal free resolutions in §4.5 (lines 888–892) carries no locator; a standard reference would let a reader check the hypotheses.

## Earlier findings

- R01 (§4.5 tail as unfolding of a compression): repaired. The text now reads "the tail `⋯ → P_(p+1) → P_p`, with `P_i` in degree `-i`, is the truncation in degrees at most `-p` of the unfolding". It adds the index condition "`d_(i+m) = d_i` for `i > p`". Both are correct, and the three examples now say "truncation". C01 asks only that the truncation be named.
- R02 (§5.5 odd element): repaired. The example now reads "For an element `b` of degree one of a graded algebra".
- C01 (locators): repaired. The text now cites Bühler §6, Proposition 6.13; Buchweitz, Definition 1.2.2; Eisenbud, Corollary 6.3; Positselski §6.2; and Keller, *On triangulated orbit categories*, §1 and §5.1.
- C02 (§2.2 and Buchweitz §4): repaired. The text now reads "Buchweitz's complete resolutions (Buchweitz, Definition 3.1.1) … with no condition on `Hom_R(P, R)`", and it adds a correct syzygy argument over Iwanaga–Gorenstein rings.
- C03 (Stai's numbered results for `n = 1`): repaired. The text now reads "Lemma 3.12 for `n = 1` and the remark following it for general `n`", and the References name the arXiv v1 numbering.
- C04 (two thin headlines): repaired. The docstrings of `stai_projective_isEquivalence` and `eisenbud_isEquivalence` now say what the pins already give.
- C05 (`HasFiniteGlobalDimension`): repaired. The text now reads "The predicate `HasFiniteGlobalDimension Λ d` that other roadmaps cite … is this bound", followed by the pinned iff.
- C06 (Orlov composite does not type-check): repaired. §2.3 is now stated "for a left noetherian ring `A`", and §7.5 uses it "for `A = S/(w)`".
- N01 (Chen): repaired; the name no longer appears.

## Verified sound

| Statement | Instances tried | Values computed (source / roadmap) | Result | Change |
|---|---|---|---|---|
| §0.1 morphism-ideal quotient (sample) | zero ideal; ideal of all maps | quotient by 0 is `C`; by all maps every object zero; pin `MorphismIdeal` two-sided additive (Basic.lean:87); `mapEquivalence` needs `I = J.comap e` | sound | none |
| §0.4 Frobenius functionals (sample) | `k[x]/(x³)`; exterior algebra on `x, y` | antidiagonal pairing; constant coefficient kills `x·b`; `λ(xy)=1`, `λ(y·ν(x)) = λ(−yx) = 1`; pin convention `φ(ab)=φ(b·νa)` | sound | none |
| §1.2 stable functors (sample) | Frobenius subcategory `P` containing ProjInj | `P`-projectives are retracts of ambient proj-inj, so stable homs agree and faithfulness holds; Happel unread | sound | none |
| §2.1 `stmod` (sample) | `k[x]/(x²)` | maps `k → A → k` vanish (`(x)` is killed); `End = k`, `Ωk ≅ k`; Bühler 13.7 cites Happel 2.6 p. 16 | sound | none |
| §2.4 singularity category (sample) | `ℤ/4` | `ℤ/2` has pd `∞`, nonzero in `D_sg`; Buchweitz Def 1.2.2 p. 8 is `D^b/D^perf` | sound | none |
| §2.6 specializations (sample) | `ℤ`; `k[x]/(x²)` | `D_sg(ℤ)=0` while `Hom(ℤ/2, ℤⁿ)=0`; facts stated in Buchweitz §8.1 p. 80 and §1.1 p. 7, not §4 | locator | C02 |
| §3.3 split Frobenius (sample) | `ℤ/4 ⇄ ℤ/4` by 2; one-periodic disk | `dh+hd = 2c₀+2c₁ ≠ 1`; disk `h(a,b)=(b,0)` gives 1; Keller 1990 §1.2 p. 3; Stai §3.1 p. 8 | sound | none |
| §3.4 `D_n` (sample) | split structure | exact-acyclic `Xⁱ ≅ Zⁱ ⊕ Zⁱ⁺¹`, a sum of disks, so `D_n(E)=K_n`; Keller 1990 §4.1 p. 14 | sound | none |
| §4.1 compression (sample) | `B → B` identity; `X[k]`, `n ∣ k` | `Δ₂` is `D₀(B)`; iso signs need `ε_{j+1} = (−1)^k ε_j`, so `(−1)^{kj}`; Stai §3.2 p. 9 | sound | none |
| §5.5 duplexes (sample) | `S[u,u⁻¹]`, `|u|=2`, curvature `wu` | `d₁d₀(m)=m·wu·u⁻¹=mw`, `d₀d₁` likewise since `d_A=0`; FKS §2.1 p. 11, §3.1 p. 13 | sound | none |
| §6.1 curved homotopy (sample) | homotopy of degree `−1` | Positselski p. 34 Hom rule gives `dh + hd`; homotopy category triangulated p. 63 | sound | none |
| §6.3 second kind (sample) | `A = k` | all classes zero, `D^co = D^ctr = Hot`; Positselski Defs 7.4–7.6 p. 64 are Verdier quotients | sound | none |
| §7.2 duality (sample) | `(xⁱ, x^{n−i})` | dual `(x^{n−i}, −xⁱ)`, composite `−xⁿ`; double dual `(−d₀,−d₁) ≅ P` by `(1,−1)` | sound | none |
| §7.5 Orlov (sample) | `w=0`; `S=k[x]`, `w=xⁿ` | `(S,0)` with zero maps not null-homotopic, `D_sg=0`; `t↦0` not flat; Orlov §3.1 p. 16, Thm 3.9 p. 21 | sound | none |
| §8.2 `k[x]/(xⁿ)` (sample) | `n=3, i=j=2`; `n=2` | Hom dim 2, stable `min(2,2,1,1)=1`; resolution `d_odd=xⁱ`, `d_even=x^{n−i}` matches pin at exponent `n−i` | sound | none |
| §4.5 tail (R01 repair) | `k[x]/(x²)`, resolution of `k`, `p=0`, `m=1` | brutal truncation `⋯→A→A` is the tail; canonical `truncLE` has `(x) ≅ k` in degree 0 | true if brutal | C01 |
| Layer 4/7 examples, §8.3 (R01 repair) | `(x^{n−i}, xⁱ)` at `−k`; `(xⁱ, x^{n−i})` at `1−k` | parity `1→0` is `xⁱ`, `0→1` is `x^{n−i}`; pin `d 0 1 = xⁱ` at exponent `i` (Periodic.lean:110, :240) | sound | C01 |
| §5.5 example (R02 repair) | `|b| = 1` | `d(w) = −(b·b² − b²·b) = 0`; `d²a = b²a − ab² = aw − wa`; `w ∈ A²` | sound | none |
| §2.2 remark (C02 repair) | cycle `Zʲ`, injdim `R = d` | `Extⁱ(Zʲ,R) = Ext^{i+d}(Z^{j+d},R) = 0` for `i ≥ 1`; Buchweitz Def 3.1.1 p. 10 has no Hom condition | sound | none |
| §§2.3, 7.5 sides (C06 repair) | `A = S/(w)` | cokernel lands in `GorensteinProjectiveModuleCat (S ⧸ span{w})` (GorensteinProjective.lean:253); §2.3 at `A`; degree-zero functor at `FGModuleCat A` | sound | none |
| `HasFiniteGlobalDimension` (C05 repair) | main `Suggested.lean:1182` | `∀ M : ModuleCat Λᵐᵒᵖ, pd ≤ d` equals `globalDimension_le_iff_hasProjectiveDimensionLE` (GlobalDimension.lean:90) | sound | none |
| `buchweitz_isEquivalence` | `ℤ/4`; `k[x,y]/(x,y)²` | one indecomposable `ℤ/2`, End `𝔽₂` both sides; `dim Ext¹(k,R) = 4−3+2 = 3`, not IG; Thm 4.4.1 p. 16 | sound | none |
| `stai_orbitDerivedCompressionFunctor_full_faithful` | `Λ = k`; `k[t]/t²` | homs `⊕_j Hom(V,W[nj])` both sides; `t²` excluded by `hΛ`; Stai Lemma 3.12 p. 16 and remark | sound | none |
| `stai_eq_top_of_essImage_le` | `Λ = k`; flag modules | each object ≅ flag module, an iterated split extension of `(P,0) = Δ(P)`: no summands; Stai Thm 4.3 p. 18 | sound | none |
| `stai_projective_isEquivalence` | `k[t]/t²` excluded | `(Λ,t)` nonzero in `K₁(proj)`, zero in `D₁`; pin `isEquivalence_ι_comp_Qh` (ProjectiveReplacement.lean:99) after a pd transfer; Stai p. 15 remark | sound | none |
| `positselski_7_8a` | `A = k`, `e = 0` | all classes zero; Thm 7.8(a) pp. 64–65: finite graded left gldim, here on graded right modules | sound | none |
| `positselski_7_8b` | both degree alternatives | same conditions as Thm 7.8(b) p. 65 (`A⁰` semisimple, `A¹ = 0`); `w = 0` literal | sound | none |
| `positselski_7_9a`, `positselski_7_9b` | conditions (∗), (∗∗) | finite per countable sum ⇔ one bound `e` (a sum of sums has each as summand); Thm 7.9 p. 66 | sound | none |
| `eisenbud_isEquivalence` | `k⟦x⟧`, `xⁿ`; `w ∈ 𝔪∖𝔪²` | `n−1` objects `A/(xⁱ)` on each side; both sides zero; three pinned pieces, no one-tactic proof | sound | none |
| Not-statable headlines | search at the Tau Ceti pin | no exact-category `D^b`, no functor between the two GP stable categories, no DG orbit category | docstring true | none |
| §0.3 locator | Bühler contents | §7 weak idempotent completeness, §10 acyclic complexes; projectives §11 p. 41, Frobenius §13.4 p. 50 | locator | C02 |

- Source locators checked against the text: 42 (Stai 10, Positselski 8, Buchweitz 7, Eisenbud 4, Keller 1990 3, Keller 2005 3, Bühler 3, Orlov 3, FKS 2, ABI 1, Keller–Vossieck 1 by OCR).
- Library declarations opened at the pins: Tau Ceti `Polynomial/Periodic.lean:110,240`, `RingTheory/GlobalDimension.lean:70,90`, `Periodic/Unfold.lean:52`, `Periodic/ProjectiveReplacement.lean:99,128`, `GorensteinProjective/Basic.lean:74`, `GorensteinProjective/Hypersurface.lean:87`, `TotallyAcyclic/FGModuleCat.lean:123`, `Cokernel/GorensteinProjective.lean:189,253`, `TotallyAcyclic/Abelian/Singularity.lean:379`, `RingTheory/IwanagaGorenstein.lean`, `MorphismIdeal/Basic.lean:87,297,361`, `MorphismIdeal/Equivalence.lean:203`, `MorphismIdeal/Opposite.lean:217`, `Algebra/Frobenius/Basic.lean:34`; Mathlib `Embedding/CochainComplex.lean:42`, `Embedding/StupidTrunc.lean:36`, `Quotient.lean:261,311`, `Quotient/Preadditive.lean:61`, `Quotient/Linear.lean:97`, `Pretriangulated.lean:590`.
- Cross-roadmap citations resolved on main: GrothendieckEulerForms §§0.2, 0.4; DGAInfinity Layers 0, 1, 5; ZigzagPreprojective §2.1; HopfologicalAlgebra §§4.1, 4.2. Consumers' citations of this roadmap still resolve: HermitianKTheoryOfPoincareCategories line 71, McKaySkewGroup line 283, ArtinAlgebras line 71, HopfologicalAlgebra line 169, SymplecticFieldTheory line 200, and the open StableReductionPartII (Layer 2).
- Automatic checks: all passed; a rerun of the gate gives OK. Dependency check: `depcheck: 182 roadmaps, 2089 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings only. The elaborated signatures of all 12 declarations were compared with the README; no binder was lost.
- One-tactic probes on a copy of the file (`infer_instance`, `rfl`, `simp`, `constructor`) fail on all nine theorems.

Overlap check: read HopfologicalAlgebra, DGAInfinity, ArtinAlgebras, McKaySkewGroup and GrothendieckEulerForms (on main; the open revisions by search). Morphism-ideal quotients, Frobenius exact and stable categories, curved DG modules and periodic complexes are owned here, and ArtinAlgebras, HopfologicalAlgebra, McKaySkewGroup and the open DGAInfinity revision cite them that way. Exact structures are owned by GrothendieckEulerForms, and DG conventions and pretriangulated envelopes by DGAInfinity; both are cited here.

Source independence: 19 passages compared with 11 sources. Nothing is shared beyond forced formulas and hypothesis lists, the longest being the six words of Orlov's (ELF) conditions. The largest share is Stai2018, with 10 of 42 locators. Compared with Stai's contents, the layers are independent: Layers 3–4 interleave Stai §§3.1, 3.2, 3.4, 3.5 and 4 with Keller 2005 §1, Avramov–Buchweitz–Iyengar and Eisenbud. Their order is forced by the Needs lines of §4.1 and §4.4.

Research link: Layers 2 and 7 are the singularity-category theorems of Buchweitz (1986) and Orlov (2004), and Eisenbud's (1980) matrix-factorization correspondence; Orlov's §3 identifies these categories with B-branes of Landau–Ginzburg models. Layer 4 is Stai's (2018) hull of Keller's (2005) orbit categories, and Layer 6 Positselski's second-kind theorems (survey 2023). This rests on the README's References and the sources read.

## Not verifiable

- Happel, *Triangulated Categories in the Representation Theory of Finite Dimensional Algebras*, Chapter I §2 (§§1.1, 1.2, 2.1): the book is behind the Cambridge paywall and no legal open copy was found. Bühler 13.7 cites the same theorem as Happel 2.6, p. 16.
- Keller–Vossieck, Example 2.3 (§2.7): read only through OCR of the scan on Keller's page. It is partly legible and consistent with the statement.

## Source issues

- **Gap** in Stai2018 at §2.1, p. 4, and §2.2, p. 6: the source defines the pretriangulated hull as the closure under extensions, shifts and summands, yet calls it left adjoint to the inclusion of pretriangulated DG categories, defined without summands; it should be the closure under extensions and shifts only, or the adjunction restricted to idempotent-complete targets; affects nothing.

## For the human reviewers

- none
