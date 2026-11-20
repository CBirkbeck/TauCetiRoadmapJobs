# Review of StablePeriodicCurved (pull request #2668 at 041f6c6)

**Verdict:** accepted

**Summary.** Accepted: an independent full pass found no statement that is false, unsupported or unowned. The Checks and conventions were recomputed by hand, eleven sources were read at their locators, and the nine sorried theorems elaborate and resist one-tactic proofs. There are four small corrections (a sentence in §7.5 that reads as if flatness were needed where a non-zero-divisor suffices, "truncation" in §4.5 not saying which one, one locator into the wrong section of Buchweitz, and a stale line count in the description) and one format note, none blocking. Nothing is left for a human to decide.

## C01 — In §7.5, "a non-zero-divisor condition does not replace the flatness of `W`" reads as a claim that the equivalence can fail for a non-zero-divisor; it cannot

A reader takes the sentence (§7.5, line 1291) to mean that the composite `HMF(S, w) → D_sg(S/(w))` may fail to be an equivalence when `w` is a non-zero-divisor but `W` is not flat. The roadmap's own sections prove the opposite. For `S` regular noetherian of finite Krull dimension and `w` a non-zero-divisor, `S/(w)` is Iwanaga–Gorenstein, so §2.5 applies. A finitely generated Gorenstein-projective `S/(w)`-module is maximal Cohen–Macaulay at each prime, so by Auslander–Buchsbaum it has projective dimension at most one over `S` and lies in the essential image described in §7.4. A concrete non-flat instance: `S = k[x] × k[x]`, `w = (x², 1)`. Here `w` is a non-zero-divisor, `t − 1 ↦ (x² − 1, 0)` is a zero-divisor so `k[t] → S` is not flat, and both sides are `stmod-k[x]/(x²)`. The Check at `w = 0` does not separate the two hypotheses either, since `0` is a zero-divisor.

The smallest change is to say that flatness is the hypothesis of Orlov's Theorem 3.9, which is what the locator supports. Alternatively the section would gain from stating the affine theorem for a non-zero-divisor in a regular ring of finite Krull dimension, with Orlov's flat case as the cited instance; `S = ℤ`, `w = 4` is then covered, which the present statement excludes for want of a field.

## C02 — "Truncation" in §4.5 and its three echoes is the brutal truncation; read as the canonical one the target is false

"The truncation in degrees at most `-p` of the unfolding" (§4.5, line 884) is true only for the brutal truncation, Mathlib's `HomologicalComplex.stupidTrunc`. For `k[x]/(x²)`, the resolution of `k`, `p = 0`, `m = 1`: the brutal truncation of the unfolding is `⋯ → A → A`, the tail, while the canonical truncation (`CochainComplex.truncLE`) has the cycles `(x) ≅ k` in degree `0`. The displayed tail fixes the meaning for a careful reader, but an implementer reaching for the library's `truncLE` gets a false statement. Writing "the brutal (stupid) truncation" in §4.5, in the Examples of Layer 4 (line 920) and Layer 7 (line 1342) and in §8.2 (line 1412) removes the ambiguity.

## C03 — §2.6 cites Buchweitz §4 for two facts that §4 does not contain

§4 of the manuscript defines maximal Cohen–Macaulay modules over rings of finite injective dimension and proves Theorem 4.4.1; it treats neither special case. That over a quasi-Frobenius ring every finitely generated module is maximal Cohen–Macaulay, so the stabilized derived category is the stable module category, is §8.1. That a module is perfect exactly when its projective dimension is finite, which gives `D_sg = 0` in finite global dimension, is §1.1. "(Buchweitz, §1.1 and §8.1)" at line 515 would be exact.

## C04 — The description gives the length of `Suggested.lean` at an earlier head

"It is replaced by a 212-line file" is out of date: the file at this head has 221 lines. "a 221-line file" would be right. The rest of the description (48 Checks in 35 sections, the suppliers, the headlines stated and not statable) matches the head.

## N01 — The existence and uniqueness of minimal free resolutions over a noetherian local ring (§4.5, lines 888–892) carries no locator; a standard reference would let a reader check the hypotheses.

## Earlier findings

The previous review read this same head and had no findings. Its three small corrections and its format note are therefore unrepaired, and each was checked again:

- Its C01 ("truncation" in §4.5): the text still reads "is the truncation in degrees at most `-p` of the unfolding". Not repaired; carried as C02.
- Its C02 (two locators): "(Buchweitz, §4)" still closes §2.6. Not repaired; carried as C03. Its second half, Bühler "§§7, 10–13" in §0.3, is dropped: the range contains §11 (projectives) and §13.4 (Frobenius categories), so the locator is loose but not wrong.
- Its C03 (the description's "212-line file"): not repaired; carried as C04.
- Its N01 (no locator for minimal resolutions): not repaired; carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (source or pin / roadmap) | Result | Change |
|---|---|---|---|---|
| §0.2 factoring ideal (sample) | `P` = lines in `Vect`; `P` empty | `1_{k²} = p₁ + p₂`, rank 2 > 1; pin needs `[P.Nonempty]`, binary biproducts (FactorThrough.lean:119), as stated | sound | none |
| §0.3 Frobenius exact (sample) | split structure; `k[x,y]/(x,y)²` | all objects proj-inj, stable = 0; socle dim 2, so `A` not injective; Bühler §13.4 p. 50 same definition | sound | none |
| §0.4 Frobenius functionals (sample) | `k[x]/(xⁿ)`; exterior algebra; char 2 | antidiagonal Gram matrix; `λ(yν(x)) = −λ(yx) = 1`; right action `(φ·a)(b) = φ(ab)` is associative and `a ↦ λ(a·)` right-linear | sound | none |
| §1.2 stable functors (sample) | Frobenius subcategory; projectives of `P` | pin `IsFrobeniusSubcategory` has the four stated fields (FullSubcategory.lean:54); `P`-projectives are retracts of ambient proj-inj | sound | none |
| §1.1 Checks | `k[x]/(xⁿ)`; `ℤ` | `x^i : M_{n−i} ↪ A`, cokernel `M_i`; `Ω(ℤ/2) ≅ ℤ` zero, `Hom(ℤ/2, ℤᵐ) = 0` | sound | none |
| §2.5 negative Check | `k[x,y]/(x,y)²` | `2 − 3 + 4 − e = 0` gives `dim Ext¹(k,R) = 3`, as stated | sound | none |
| §2.6 special cases (sample) | `ℤ`; `k[x]/(x²)` | `D_sg(ℤ) = 0`, `1_{ℤ/2}` not through a free group; Buchweitz §8.1, §1.1 hold the facts, §4 does not | locator | C03 |
| §2.7 Keller–Vossieck | split structure; idempotent-complete `C` | bounded split-acyclic is contractible, both sides 0; idempotent complete ⇒ weakly so, closure automatic | sound | none |
| §3.2 cone and signs | cone of `1_X`; wrong sign; `n` odd | `Dh + hD = 1`; wrong sign `D² = (0, 2dx′)`; `ε(i+n) = −ε(i)` contradiction | sound | none |
| §3.4 `D_n(E)` (sample) | split structure; cone of `1_X`; homotopic maps | `Xⁱ ≅ Zⁱ ⊕ Zⁱ⁺¹` = sum of disks; cylinder projection has exact-acyclic cone, so localization factors through `K_n` | sound | none |
| §4.1 periodicity sign | `X[k]`, `n ∣ k`, `n` odd | need `ε_{j+1} = (−1)^k ε_j` on `ℤ`: `(−1)^{kj}` works, also for `k` odd | sound | none |
| §4.3 relative projectives (sample) | `(Λ, t)` over `k[t]/(t²)` | `th + ht = 2tc ∈ (t)`; pins FlagResolution.lean:229, GlobalDimension.lean:110 carry the stated bounds; Stai Prop 3.10 p. 14, remark p. 15 | sound | none |
| §4.4 hull (sample) | `Λ = k`; any abelian `A` | `0 → Z(X) → X → X/Z(X) → 0` with zero-differential ends: generation holds; Stai Lemma 3.12 p. 16, Thm 4.3 p. 18, remarks | sound | none |
| §4.5 tail | `k[x]/(x²)`, `p = 0`, `m = 1` | brutal truncation `⋯ → A → A`; canonical has `(x)` in degree 0; `d_{p+m} d_{p+1} = 0` from `d_{p+m+1} = d_{p+1}` | true if brutal | C02 |
| §5.1 curvature conventions | `d = 0`, `w = 0`, `a ∈ A¹` | `(dᵃ)²x = a²x − xa²`, `w′ = −a²`; Positselski p. 33 `h′ = h + d(a) + a²`, `w = −h` | sound | none |
| §5.1 Bianchi target | `d³(a)` two ways | difference `(−1)^{|a|} a d(w) − d(w) a = 0` | sound | none |
| §5.4 Hom complex, tensor (sample) | unequal curvatures; `M ⊗ N` | `δ²f(m) = f(m)(w_N − w_M)`; square `m w_A ⊗ n + m ⊗ n w_B`, `w_A` even | sound | none |
| §5.5 duplexes (sample) | `S[u, u⁻¹]`, curvature `wu`; `d = [b, −]` | `d₁d₀ = d₀d₁ = w`; `d²a = b²a − ab² = aw − wa`, `d(w) = 0`; Frenkel–Khovanov–Schiffmann §3.1 | sound | none |
| §6.2 acyclic classes (sample) | definitions against source and pin | Positselski Defs 7.4–7.6 p. 64: thick; triangulated with sums; with products; Mathlib `triangEnvelope` is retract-closed (Generators.lean:134) | sound | none |
| §7.1 matrix factorizations (sample) | `(1, w)`, `(w, 1)` | `h₁ = 1, h₀ = 0` gives 1 on both; cokernels `0`, `S/(w)`; Eisenbud §5 p. 15 same definition | sound | none |
| §7.2 duality (sample) | `(xⁱ, x^{n−i})` | dual `(x^{n−i}, −xⁱ)`, composite `−xⁿ` | sound | none |
| §7.3 Frobenius description (sample) | pin and source | `splitExact_isFrobenius` resolves at the pin; Frenkel–Khovanov–Schiffmann §4 is "Stable categories" | sound | none |
| §7.5 Orlov | `w = 0`; `S = k[x]²`, `w = (x², 1)` | `(S, 0)` not null-homotopic, `D_sg = 0`; non-flat non-zero-divisor instance: both sides `stmod-k[x]/(x²)`; Orlov Thm 3.9 p. 21 | theorem sound; sentence misleads | C01 |
| §8.2 stable dimensions | `n = 3`, `i = j = 2`; `i ≤ j` | Hom dim 2, stable `min(2,2,1,1) = 1 = 2 − 1`; `min(i, n−j) = i − max(0, i+j−n)` | sound | none |
| §8.3 `xⁿ` (sample) | parity shift; three unfoldings | `(1, −1)` intertwines `(−x^{n−i}, −xⁱ)` and `(x^{n−i}, xⁱ)`; §4, §7, §8.2 parities agree (`1→0` is `xⁱ` for `(x^{n−i}, xⁱ)`) | sound | none |
| §8.4 square-zero duplex | `d₁ = 0` variant | `h(a,b) = (b,0)`: `dh + hd = 1`; variant has homology `B`, `B` | sound | none |
| `buchweitz_isEquivalence` | `ℤ/4`; non-Gorenstein control | one indecomposable, End `𝔽₂`, both sides; Buchweitz Thm 4.4.1 p. 16: two-sided noetherian, finite injective dimension both sides, as `IsIwanagaGorenstein` (IwanagaGorenstein.lean:48) | sound | none |
| `stai_orbitDerivedCompressionFunctor_full_faithful` | `Λ = k`; `n` odd | homs `⊕_j Hom(V, W[nj])` both sides; sign `(−1)^{nk·i}` on `ℤ`-graded components; Stai p. 16 | sound | none |
| `stai_eq_top_of_essImage_le` | `Λ = 0`; `Λ = k` | all categories trivial; cycles/quotient extension shows generation without retracts | sound | none |
| `stai_projective_isEquivalence` | `k[t]/(t²)` excluded by `hΛ` | pin `isEquivalence_ι_comp_Qh` (ProjectiveReplacement.lean:99) needs the bound in `FGModuleCat`; no transfer lemma found at the pin; probe fails | sound | none |
| `positselski_7_8a` | `A = k`, `e = 0` | classes all zero; Thm 7.8(a) p. 64: finite left global dimension, here right modules | sound | none |
| `positselski_7_8b` | both alternatives; `w = 0` literal | Thm 7.8(b) p. 65: `Aⁿ = 0, n > 0`, or `Aⁿ = 0, n < 0`, `A⁰` semisimple, `A¹ = 0`: same | sound | none |
| `positselski_7_9a`, `positselski_7_9b` | uniform bound against (∗), (∗∗) | each countable sum finite ⇒ one bound: a countable sum of countable sums has each as summand; Thm 7.9 p. 66 | sound | none |
| `eisenbud_isEquivalence` | `w` a unit; `w ∈ 𝔪∖𝔪²`; `k⟦x⟧`, `xⁿ` | unit: `h₁ = w⁻¹d₁` contracts, both sides 0; regular quotient: both 0; `n − 1` objects each side | sound | none |
| Not-statable headlines | search of the Tau Ceti pin | no `D^b` of an exact category, no functor between the two Gorenstein-projective stable categories, no DG orbit category | docstring true | none |

- Source locators checked against the text: 31 (Stai 8, Positselski 7, Buchweitz 5, Eisenbud 4, Keller 2005 2, Bühler 2, Orlov 2, Frenkel–Khovanov–Schiffmann 1, Avramov–Buchweitz–Iyengar 1, Keller–Vossieck 1 by OCR).
- Library declarations opened at the pins: Tau Ceti `TotallyAcyclic/Abelian/Singularity.lean:341,450`, `Periodic/FlagResolution.lean:229`, `Periodic/GlobalDimension.lean:110`, `Periodic/ProjectiveReplacement.lean:99,128`, `Periodic/Shift.lean:218`, `Periodic/Compression/Derived.lean:191`, `Periodic/Compression/FullyFaithful.lean:194,248`, `Shift/OrbitCategory.lean:105`, `Exact/Stable/FullSubcategory.lean:54`, `MorphismIdeal/FactorThrough.lean:119`, `RingTheory/IwanagaGorenstein.lean:48`, `RingTheory/GlobalDimension.lean:70,90`, `MinimalResolution/Basic.lean:108`, `Curved/Module/Right/Acyclic.lean:189`, `Singularity/Syzygy.lean:60`; Mathlib `Triangulated/Generators.lean:64,134`.
- Cross-roadmap citations resolved on main: GrothendieckEulerForms §§0.2, 0.4; DGAInfinity Layers 0, 1, 5; ZigzagPreprojective §2.1; HopfologicalAlgebra §§4.1, 4.2, Layers 2 and 4. No citation or Lean name is unresolved.
- Automatic checks: all passed; a rerun of the gate is clean. Dependency check: `depcheck: 191 roadmaps, 2120 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings and nothing else. The twelve elaborated signatures were compared with the README; every binder is explicit and none was lost.
- One-tactic probes on a copy (`infer_instance`, `rfl`, `simp`, an anonymous constructor of instances, `exact` with the pinned projective-replacement theorem) fail on all nine theorems.
- The pull request changes no file outside the folder.

Overlap check: read HopfologicalAlgebra, DGAInfinity, McKaySkewGroup, GrothendieckEulerForms and ArtinAlgebras (on main, and their open revisions by search), and the open GorensteinHomologicalAlgebra (pull request #323). Morphism-ideal quotients, Frobenius exact and stable categories, periodic complexes and curved modules: owner this roadmap, cited as such by HopfologicalAlgebra, McKaySkewGroup, FukayaTheory and SymplecticFieldTheory. Exact structures: owner GrothendieckEulerForms. DG conventions and pretriangulated envelopes: owner DGAInfinity. Totally acyclic complexes and Gorenstein-projective modules: owner this roadmap, on main and in the pinned library; the open GorensteinHomologicalAlgebra plans them again for arbitrary modules and excludes singularity and stable categories, so it is the one to cite, and nothing changes here.

Source independence: 14 passages compared with 8 sources, none shared beyond forced definitions and hypothesis lists (the longest, seven words of Orlov's (ELF) conditions); largest share Stai, about 10 of 55 locators; contents compared with Stai: independent (Layers 3–4 interleave Stai §§3.1–3.5 and 4 with Keller 2005, Avramov–Buchweitz–Iyengar and Eisenbud, in an order forced by the Needs lines of §§4.1 and 4.4).

Research link: Layers 2 and 7 state Buchweitz's (1986) and Orlov's (2004) singularity-category equivalences and Eisenbud's (1980) matrix-factorization theorem; Layer 4 states Stai's (2018) identification of Keller's (2005) triangulated hull; Layer 6 states Positselski's second-kind theorems (survey 2023). Rests on the README's References and the sources read.

## Not verifiable

- Happel, *Triangulated Categories in the Representation Theory of Finite Dimensional Algebras*, Chapter I §2 and Theorem I.2.6 (§§1.1, 1.2, 2.1): behind the publisher's paywall, no legal open copy found; Bühler §13.4 attributes the same theorem to Happel.
- Keller–Vossieck, Example 2.3 (§2.7): read only through OCR of the scan on Keller's page; partly legible and consistent with the statement.
- Keller, *Chain complexes and stable categories*, §§1–4 (§§2.7, 3.3, 3.4): the text was fetched but its section headings did not extract, so the range was not matched section by section.

## Source issues

- **Gap** in Stai2018 at §2.1, p. 4: the source forms the pretriangulated hull as a closure under extensions, shifts and summands, and calls it left adjoint to the inclusion of pretriangulated DG categories, which are not required to have summands; it should be the closure under extensions and shifts only, or pretriangulated should include closure under summands; affects nothing.

## For the human reviewers

- none
