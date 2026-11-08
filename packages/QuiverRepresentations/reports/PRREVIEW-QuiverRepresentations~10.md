# Review of QuiverRepresentations (pull request #1526 at 475684d)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** needs changes

Two P3 findings and no blocking ones. README line numbers are at `475684d`. Library paths beginning `TauCeti/` and `Mathlib/` are at the pins of the pull request's `lake-manifest.json`: Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, unchanged since the previous review. Main is `3b3f7ef`.

## Previous findings, checked first

The previous review (at `eaba7a0`) had four findings. All four are repaired.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 (P2) RootSystems cited by Layers 1, 2 and 5, which it no longer has | README:58–63 “RootSystems, §3.1, owns the classification … positive roots relative to a base are native (`TauCeti.posRoots`) … so RootSystems is not a supplier here”; the `From TauCetiRoadmap.RootSystems` contract is gone; §5.1/§5.2 *Needs:* (752–754, 795–798) and the Layer 5 Dependencies (814–815) now name pinned declarations | **Repaired.** Main's RootSystems §3.1 (heading line 506) states base-independent and rational classification. Its lines 13–19 make positive roots consumed. The §5.2 route (764–775) uses neither, so dropping the supplier is consistent. |
| R02 (P2) §3.1 duality exchange is ArtinAlgebras §2.3 at R = k | README:69–74 “ArtinAlgebras, §2.3, owns the duality … its exchange of projectives and injectives, and injective hulls as duals of projective covers”; 494–497 “is the case R = k of ArtinAlgebras §2.3 and is not planned here”; 203–204; 823–825 | **Repaired.** The exchange target and its API, and the presentation exchange with its API, are deleted. The remaining §3.1 Checks test the pinned envelope and copresentation. Nothing else in the README uses the exchange. |
| R03 (P3) §6.1 comparison restates pinned declarations | README:843–855 “Its finite-dimensional form is consumed, not proved … `TauCeti.ExactStructure.homCokernelEquivInjectiveStableHom` identifies k-linearly …”; contracts 339–354; Summary 8–10; How to read the build 387–389 | **Repaired.** The comparison is now a consumption sentence. All six declarations it names exist at the pin with the stated content (table below). |
| R04 (P3) ARS IV.4.1/IV.4.6 cited for a natural isomorphism | README:119–121 “the Auslander–Reiten formula as an equality of lengths (ARS IV.4.1, p.129, and IV.4.6, p.131)”; 884–886; References 987–988 | **Repaired.** This matches `ars line 4992` (IV.4.1, p.129) and `ars line 5081` (IV.4.6, p.131). |

The folder changed by 229 lines since `eaba7a0` (only README.md). This is a full review of all 995 README lines and 104 Lean lines.

## R01 (P3) — §4.1 plans the pinned arrow-extension classification and Baer-sum additivity

**Location:** README:662, in “API for the resolution and comparison”: “Cokernel classes classify extensions with fixed endpoints, and addition agrees with Baer sum.” The Tau Ceti contracts (README:234–240) cite only `HomDifferential.lean` for the Hom differential.

**Claim:** classifying extensions by classes in the cokernel of the Hom differential, and the agreement of Baer sum with addition, are API this roadmap builds.

**Witness:** both are already in Tau Ceti at the pin:

- `TauCeti.QuiverRep.exists_arrowExtension_iso_fixing_ends` (`TauCeti/RepresentationTheory/Quiver/Representation/ArrowExtension/Classification.lean:191`) and `exists_arrowExtension_hom_fixing_ends_iff` (:81) give the classification.
- `CategoryTheory.ShortComplex.ShortExact.extClass_baerSum` (`TauCeti/Algebra/Homology/Ext/BaerSum.lean:106`) gives the extension class of a Baer sum as the sum of the classes.

**Repair (tested):**

1. After the Hom-differential bullet at README:240, add this contract bullet: “`TauCeti.QuiverRep.arrowExtension`, in `RepresentationTheory/Quiver/Representation/ArrowExtension/Basic.lean`, is the extension of M by N whose arrows act by the upper triangular matrices with corner c(a), for an arrow family c. `TauCeti.QuiverRep.exists_arrowExtension_iso_fixing_ends`, `TauCeti.QuiverRep.exists_arrowExtension_hom_fixing_ends_iff` and `TauCeti.QuiverRep.homDifferential_surjective_iff_all_extensions_split`, in `ArrowExtension/Classification.lean` there, make every short exact sequence such an extension with both end terms fixed, two of them equivalent with fixed end terms exactly when their arrow families have the same class in the cokernel of the Hom differential, and the differential surjective exactly when every extension splits, over any field and without finiteness or acyclicity. `CategoryTheory.ShortComplex.ShortExact.extClass_baerSum`, in `Algebra/Homology/Ext/BaerSum.lean`, makes the extension class of a Baer sum the sum of the two classes in any abelian category with `HasExt`.”
2. Delete the API bullet at README:662.

The Check at README:673–674 (the A₂ nonsplit class 1 and split class 0) stays: it tests the comparison. A scratch copy of the README with exactly this change, together with R02's, passes the dependency check (`depcheck: 244 roadmaps, 2467 edges, 0 problem(s)`). All five new names resolve at the pins: Basic.lean:44, Classification.lean:81, 191 and 253, BaerSum.lean:106.

## R02 (P3) — §4.1's general heredity and the Hom–Ext comparison have no locator

**Location:**

- README:629–632, “`pathAlgebra_higher_ext_vanish` states Extⁿ(M,N)=0 for n≥2 … of every finite quiver (ASS VII.1.4 and VII.1.7(a), pp.245–248, state heredity for finite acyclic Q; the path-space resolution needs neither acyclicity nor a particular field …)”.
- README:641–647, the comparison `nonempty_homDifferential_coker_linearEquiv_ext`, which carries no source locator at all.

**Claim:** the two §4.1 headlines are supported as stated. Every theorem needs a locator, and these two are among the roadmap's end theorems.

**Witness:** ASS VII.1.7(a) assumes Q “finite, connected, and acyclic” (`ass line 12279`, p.248). None of the four cached texts states the standard resolution or the four-term Hom/Ext sequence. Crawley-Boevey's author-hosted lectures do: §1, p.7 gives the standard resolution for any finite quiver, cycles allowed (its p.4 example: one loop gives k[T]). Their p.8 gives projective dimension at most one, and Hom(−,Y) applied to the resolution.

**Repair (tested):**

1. At README:630–632, replace the parenthesis by “(Crawley-Boevey, §1, the standard resolution, p.7, and its consequence (1), p.8, for every finite quiver; ASS VII.1.4 and VII.1.7(a), pp.245–248, state the finite connected acyclic case; the one-loop Check below shows that acyclicity is not a hypothesis)”.
2. At README:642–643, after “identifies that cokernel k-linearly with native Ext¹”, insert “(Crawley-Boevey, §1, proof of consequence (3), p.8, which applies Hom(−,N) to the standard resolution)”.
3. Add to References: “**Crawley-Boevey:** W. Crawley-Boevey, *Lectures on Representations of Quivers*, Oxford, 1992, §1, the standard resolution and its consequences (1)–(3), pp.7–8. The notes fix an algebraically closed field (p.3); the standard resolution does not use it. [Author-hosted copy](https://www.math.uni-bielefeld.de/~wcrawley/quivlecs.pdf).”
4. Record the work in the manifest; the sources service accepts the URL with `--licence-class author-page`.

I read pp.3–8 of that copy. The resolution's differential there is the concatenation minus the arrow action, the same sign as README:627–628. The Hom sequence in the proof of (3) needs no finite-dimensionality: the dimension count uses it, the exactness does not. The scratch copy of R01 carries this change too and passes the dependency check.

## Verified sound

### Gate, elaboration, signatures, padding

- **Gate.** The worker's gate at `475684d` and a rerun here both end `OK`. Every counter is 0, including `depcheck=0`, `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`, `dropped=0` and (worker's run) `build=0`.
- **Changed files.** The prescribed diff outside the folder is empty. `git diff --name-only origin/main...HEAD` lists only the folder's README.md and Suggested.lean, so the family index files are unchanged. `git status` stayed clean.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with exactly four `declaration uses sorry` warnings (lines 52, 68, 77, 90) and nothing else.
- **Signatures.** `#check @name` for all four declarations (scratch file: Suggested.lean plus four `#check` lines) exits 0. The elaborated types equal the worker's signature file, and each matches its README statement:
  - `exists_admissible_presentation` carries `[IsAlgClosed k]`, `[FiniteDimensional k A]` and `IsBasic A` (README:545–550).
  - `pathAlgebra_higher_ext_vanish` and the Ext comparison carry `[Fintype Q]` and finite arrow types. Neither has an acyclicity hypothesis or finiteness of the modules or vertex spaces (README:620–621, 629, 646–647).
  - `exists_rootPairing_titsForm` carries `[Nonempty Q]`, connectedness and `PosDef` (README:758–762).
  - No declaration uses a section `variable`, so no binder can be lost.
- **Padding probe.** Each theorem was tried with `simp`, `rfl`, `infer_instance`, `aesop` and `trivial` on a scratch copy; all 20 attempts fail. A targeted search for a pinned one-lemma proof also found none:
  - `TauCeti/RepresentationTheory/Quiver/AdmissibleIdeal/Presentation.lean` says in its docstring (lines 48–52) that the Ext¹ arrow counts are not stated.
  - Heredity is pinned only for finite-length modules over acyclic Q (`Projective/Dimension.lean:49`).
  - The arrow-extension classification is a set-level statement, not a linear equivalence with native Ext¹.
  - No file under `TauCeti/RepresentationTheory/Quiver/` mentions `RootPairing`.
- **Lean form.** No definitions, no `set_option`, no `lemma`; a single `import Mathlib` plus five Tau Ceti modules that exist at the pin; the required module docstring.
- **README ↔ Lean.** All four Lean names occur in the README (545, 629, 642, 758). All 162 qualified backticked names of the README resolve at the pins (namespace-aware search). The two declared with `_root_` were opened by hand: `Algebra/Category/ModuleCat/AuslanderReiten/Quiver.lean:80` and `RepresentationTheory/Quiver/Representation/AsModule.lean:565`.
- **Wording.** Neither file contains process wording, LaTeX delimiters, pull-request numbers or round labels.

### Headline theorems

| Headline (README Summary 5–8) | Status |
|---|---|
| Ext-quiver form of Gabriel's presentation | `exists_admissible_presentation`, Lean:52; the pin has only the surjection |
| Heredity of every finite path algebra | `pathAlgebra_higher_ext_vanish`, Lean:68; the pin has only the acyclic finite-length case |
| Hom-differential cokernel ≅ native Ext¹ | `nonempty_homDifferential_coker_linearEquiv_ext`, Lean:77 |
| Euler–Hom–Ext identity | a corollary of Lean:77 and the pinned `eulerForm_eq_finrank_hom_sub_finrank_coker` (`HomDifferential.lean:159`); the docstring (lines 26–27) says so |
| Marked root-system form of Gabriel | `exists_rootPairing_titsForm`, Lean:90. Its root-set clause and the pinned `gabrielIndecomposableEquivPositiveRoot` (`FiniteRepType/Correspondence.lean:78`, codomain `{d // 0 ≤ d ∧ titsForm d = 1}`) give the reading through `TauCeti.posRoots` of README:777–779 |
| AR duality, existence, AR quiver, k-mesh | consumed from the pin; declarations are listed below |

### Sources: the seeded sample and every new locator

Page offsets in the cached texts: `ass` printed = pdf − 11, `ars` printed = pdf − 14, `bgp` printed = pdf + 16, `etingof` printed = pdf. The README flags no locator as unverified.

| Target | Locator read | Support |
|---|---|---|
| 0.1 | ASS II.1.2 p.43 `ass line 2302`; II.1.4 p.45 `ass line 2394`; II.1.8 p.48 `ass line 2524` | as stated |
| 1.1 | ASS III.1.6 p.72 `ass line 3897`; III.2.4 p.79 `ass line 4322`; III.2.6 p.81 `ass line 4445` | as stated |
| 2.1 | ASS I.4.8 p.22 `ass line 1321`; I.4.10 p.23 `ass line 1370` | as stated |
| 3.1 | ASS I.5.12 p.30 `ass line 1747`, I.5.13–5.14 p.31 `ass line 1755`, `1779`; I.5.15–5.16 pp.31–32 `ass line 1790`, `1802`; I.6.3 p.33 `ass line 1893`; I.6.10 p.37 `ass line 2044`; ARS II.2.6 p.36 `ars line 1682`; II.4.1 p.40 `ars line 1805` | as stated |
| 3.2 | ASS II.2.1 p.53 `ass line 2782`; II.3.7 p.64 `ass line 3404`; III.2.12 p.84 `ass line 4621` | as stated |
| 3.3 | ASS III.3.7–3.8 p.89 `ass line 4822`, `4848`; 3.10–3.11 p.90 `ass line 4891`, `4912`; 3.13 p.91 `ass line 4958` | as stated, rows and columns transposed explicitly |
| 4.1 | ASS VII.1.4 p.245 `ass line 12128`; VII.1.7(a) p.248 `ass line 12279` | acyclic, connected case only (R02) |
| 4.2 | BGP Theorem 1.1 pp.21–22 `bgp line 173`; Etingof Definitions 5.26–5.27 p.90 `etingof line 4007`, `4021` | as stated |
| 5.1 | BGP Lemma 2.3 p.28 `bgp line 430`; Theorem 3.1 p.28 `bgp line 447`; Etingof Theorem 5.23 p.89 `etingof line 3991` | as stated |
| 5.2 | BGP Definition 2.2 and Lemma 2.2(3) pp.27–28 `bgp line 404`, `407`–`426`; Etingof Definition 5.20, Remark 5.21 p.89 `etingof line 3977`, `3980`; Lemma 5.16 pp.87–88 `etingof line 3898`–`3939`; Remark 5.14 p.87 `etingof line 3890` | as stated. Lemma 5.16 splits along a tree edge; the README's α⁺/α⁻ split needs no tree and is checked below. Etingof's roots are by definition the integral vectors with B = 2 (`etingof line 3888`), matching the Lean root clause |
| 6.1 | ASS IV.2 construction p.109 `ass line 5922`; IV.2.2 p.110 `ass line 5944`; IV.2.10–2.11 p.116 `ass line 6267`, `6283` | as stated |
| 6.2 | ASS IV.2.13 pp.117–119 `ass line 6331`, proof to `6402`; ARS IV.4.1 p.129 `ars line 4992`; IV.4.6 p.131 `ars line 5081` | as stated (lengths only for ARS) |
| 6.3 | ASS IV.1.11 p.104 `ass line 5675`; IV.1.12–1.13 pp.105–106 `ass line 5697`, `5723`; IV.3.1 p.120 `ass line 6441`; ARS V.1.14 p.144 `ars line 5511`; V.1.15 p.145 `ars line 5541` | as stated |
| 6.4 | ASS (IV.4.1) p.125 `ass line 6725`; IV.4.2 p.126 `ass line 6735`; IV.4.4 p.128 `ass line 6867` | as stated |

Also read: ASS's standing algebraically-closed convention (`ass line 302`, README:117) and Crawley-Boevey pp.3–8 (R02).

### Adversarial mathematics: computed values

Conventions as in the README:

- A₂ is 1 → 2 with arrow a, left modules, later factor first.
- S₁ = (k,0), S₂ = (0,k), P₁ = (k →id k), P₂ = S₂, I₁ = S₁, I₂ ≅ P₁.
- T = k[ε]/(ε²).
- E(d,e) = ∑dᵢeᵢ − ∑ₐ dᵢeⱼ, q(d) = E(d,d), B = E + Eᵀ. On A₂, q(a,b) = a² + b² − ab and B(e₂,(a,b)) = 2b − a.

Wrong models are in brackets.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 multiplication, unit, dimension | A₂; ∅, A₁, loop; k×k | e₂a = a = ae₁, e₁a = ae₂ = 0 [pointwise product: e₂a = 0]; path counts 0, 1, 3, ∞; dims 0, 1, 3; k×k: arrows span 0, with idempotents dim 2 | pass | none |
| 1.1 vertex projectives and injectives | A₂ | P₁ = (1,1), P₂ = (0,1), I₁ = (1,0), I₂ = (1,1); regular (1,2), total 3 [reversed paths swap P and I] | pass | none |
| 1.1 cover | A₁; loop | id k: kernel 0; k[X] → k at 0: (X−1) proper and onto k, so not a cover | pass | none |
| 2.1 decomposition | 0, k, k², T | 0, 1, 2, 1 summands; End T = T local, ε ≠ 0 nilpotent and not invertible | pass | none |
| 3.1 pinned envelope | A = k; T; M = 0 | k → k essential; k → k² meets the complement in 0; T's ideals 0, kε, T all meet kε; rescaled 1 ↦ aε is matched by x ↦ ax, ε ↦ aε; 0 → k: 0 ∩ k = 0 | pass | none |
| 3.1 pinned copresentation | A = k; T; 0 | 0→k→k→0; 0→k→T→T with 1↦ε and ·ε, ker(·ε) = kε = image; 0, 0 | pass | none |
| 3.1 Morita | A₂; M₂(k); k×k | annihilator of P₁ is 0; dim End P₁ = 1 ≠ 3 = dim A; E₁₂² = 0, E₁₂ ≠ 0; k×k basic, 2 simples | pass | none |
| `exists_admissible_presentation` | A₂; T; k×k; A = 0; ℂ over ℝ | A₂: I = 0 = J², dim Ext¹(S₁,S₂) = 1 = #(1→2), Ext¹(S₂,S₁) = 0 = #(2→1) [reversed counts give 0 ≠ 1]. T: J = (X), I = (X²) = J², dim Ext¹(k,k) = 1 loop [Jac(k[X]) = 0 ≠ J]. k×k: J = I = 0, Ext¹ = 0. A = 0: Q = ∅, ker = ⊤ = ⊥, no simples, all clauses true. ℂ/ℝ: the simple is 2-dimensional over ℝ, a vertex simple is 1-dimensional, so the restriction clause fails; `IsAlgClosed` excludes it | pass | none |
| 3.3 matrices | A₁; A₂; k×k; T | A₂: C = [[1,1],[0,1]], E = [[1,−1],[0,1]], CE = I, B = [[2,−1],[−1,2]]; pinned column form Cᵀ = [[1,0],[1,1]]; A₁: [1], [1], [2]; k×k: I, I, 2I; T: C = [2], E = C⁻¹ not asserted | pass | none |
| `pathAlgebra_higher_ext_vanish` | loop; two loops; ∅; T (control) | k[X] PID: Ext² = 0; k⟨x,y⟩ free ideal ring: hereditary; ∅: zero ring, Ext = 0; T: Ext²(k,k) = k ≠ 0, but T is not a path algebra | pass | R02 (locator) |
| §4.1 resolution | A₂, M = S₁ | 0 → P₂ → P₁ → S₁ → 0, vectors (0,1), (1,1), (1,0); alternating sum 0 | pass | none |
| `nonempty_homDifferential_coker_linearEquiv_ext` | A₂ both orders; loop k_λ, k_μ; loop M = k[X], N = k₀; ∅ | (S₁,S₂): HomVertex 0, HomArrow k, cokernel 1 = dim Ext¹. (S₂,S₁): HomArrow 0 = Ext¹. Loop: f ↦ (μ−λ)f, cokernel 1 iff λ = μ, and Ext¹ = k[X]/(X−λ, X−μ). M = k[X]: f ↦ −f∘X is onto because ·X is injective, cokernel 0 = Ext¹(free, k₀). ∅: 0 = 0 | pass | R02 (locator) |
| §4.1 API bullet | A₂ (S₁,S₂), c = 1 versus 0 | range of the differential 0, so classes 1 ≠ 0; nonsplit P₁ and split S₁⊕S₂ inequivalent with fixed ends: exactly `exists_arrowExtension_hom_fixing_ends_iff` at Classification.lean:81 | value pass, duplicate | R01 |
| Euler corollary | A₂; P₁; loop | E((1,0),(0,1)) = −1 = 0 − 1; E((0,1),(1,0)) = 0 = 0 − 0 [ℕ-subtraction gives 0 − 1 = 0]; q(1,1) = 1 = 1 − 0; loop E(1,1) = 0 = 1 − 1 (λ = μ) and 0 − 0 (λ ≠ μ) | pass | none |
| 4.2 sink reflection | A₂ at 2; projection k² → k; shift on k^(ℕ) | S₁ ↦ (k ← k): (1,0) ↦ (1,1) = s₂(1,0); P₁ ↦ (k ← 0): (1,1) ↦ (1,0); S₂ ↦ 0, s₂(0,1) = (0,−1); [s₁(a,b) = (b−a,b) gives (1,0) ↦ (−1,0)]; projection: (2,1) ↦ (2,1), B(e₂,(2,1)) = 0; shift: finranks (0,0) ↦ (0,1) ≠ s₂(0,0) | pass | none |
| 4.2 Coxeter | A₂, order [2,1]; A₁ | S₁ → (k ←id k) → (0 → k) = S₂; s₁s₂(1,0) = s₁(1,1) = (0,1); A₁: simple killed, c(1) = −1 | pass | none |
| 4.2 Kronecker controls | 2- and 3-arrow (1,1); 3-arrow rep (1,0,0) | q = 0 and −1; End = {(λ,μ) : λ = μ} = k | pass | none |
| 5.1 roots | A₂; D₄ toward the centre; Aₙ | A₂: (1,0), (0,1), (1,1). D₄: B(e_c,(1;1,1,1)) = 2 − 3 = −1, so (2;1,1,1), q = 7 − 6 = 1, height 4 → 5; 3 + 8 + 1 = 12 = N(N−1) at N = 4 (`etingof line 3973`). Aₙ: n(n+1)/2 = 0, 1 at n = 0, 1 | pass | none |
| `exists_rootPairing_titsForm` | A₁; A₂; D₄ mixed vector; Kronecker; loop; ∅; A₁⊔A₁; 2α | A₁: roots ±1, Cartan [2]. A₂: six solutions of q = 1, q(1,−1) = 3; Cartan entry 0 − (1 + 0) = −1 [coroot 2α gives 2I and pairs (1,1) with its coroot to 4]. D₄, centre 1 and leaves 1, −1, 0: q = 3 = 1 + 1 − (−1). Kronecker q(1,1) = 0 and loop q(e) = 0 fail `PosDef`; ∅ fails `Nonempty`; A₁⊔A₁ has two components; q(2α) = 4, so reduced | pass | none |
| §5.2 route via `RootPairing.mk'` | A₂ | coroot of e₁ is Be₁ = (2,−1), pairing 2. The coreflection sends Bβ to Bβ − B(α,β)Bα = B(s_α β), so the coroots are stable. The base axioms at Base.lean:68 hold: e_i independent, Be_i independent (det B = 3), every root ± nonnegative | pass | none |
| 6.1 pinned stable Hom | A = k; T; A₂ | A = k: extending subspace 1, Hom 1, stable 0. T: extending 0, Hom 1, stable 1. A₂: S₁ injective, id dies; S₂'s envelope is P₁ ≅ I₂ and Hom(P₁,S₂) = e₁S₂ = 0, so id survives [projective-stable: S₂ = P₂ dies, S₁ survives] | pass | none |
| 6.1 translate | A₂; T; A = k | τS₁ = S₂, τP₁ = τS₂ = 0; T: Tr k = A/εA, τk = k; A = k: 0 | pass | none |
| 6.2 pinned duality | A₂ (S₁,S₂), (S₁,S₁); projective M; T; 0 | 1 = 1; 0 = 0; 0 = 0; 1 = 1; 0 = 0 | pass | none |
| 6.3 almost split | A₂; T; rescaling; split | 0→S₂→P₁→S₁→0, dims 1, 2, 1, nonsplit; 0→k→T→k→0; (a⁻¹,1,1): (af)a⁻¹ = f, g·1 = 1·g; split: the projection is a split epi | pass | none |
| 6.3 uniqueness without a stated locality hypothesis (README:915–916) | any left almost-split f : X → Y | if e² = e and re = 1 then 1 − e = re(1 − e) = 0; so sections are units and non-units are non-sections, closed under addition: End X is local automatically | pass | none |
| 6.4 AR quiver and mesh | A₁; A₂; T | A₁: no arrows; A₂: Irr(S₂,P₁) = Irr(P₁,S₁) = k, Irr(S₂,S₁) = 0; at S₁: 1 arrow P₁ → S₁ and 1 arrow S₂ → P₁; T: ε = T → k → T lies in rad², no loop | pass | none |
| Conventions | A₂ matrix model; three arrows | E₂₂E₂₁E₁₁ = E₂₁ = a, lower triangular; q(1,1) = 2 − 3 = −1 | pass | none |
| Layer 5 examples | Kronecker (n,n+1); 𝔽₂ | q = n² + (n+1)² − 2n(n+1) = 1; |ℙ¹(𝔽₂)| = 3 | pass | none |

### Library declarations opened at the pins

**Mathlib:**

- `RootPairing.mk'` (`LinearAlgebra/RootSystem/Basic.lean:173`): `[CharZero R] [IsDomain R]`, `p.IsPerfPair`, embeddings `ι ↪ M` and `ι ↪ N`, `[Finite ι]` from line 81, pairing 2, both stability conditions. This is as README:155–158 says.
- `RootPairing.Base` (`Base.lean:68`): a finset support, linear independence of roots and of coroots, every root and coroot ± in the additive closure. There is no spanning field.
- `RootPairing.Base.IsPos` (`Base.lean:619`): positive height.
- `RootPairing.IsIrreducible` (`Irreducible.lean:148`).
- `RootPairing.Base.cartanMatrixIn` (`CartanMatrix.lean:53`).

**Tau Ceti:**

- **Euler and Tits forms.** `TauCeti.eulerForm`, `titsForm`, `finite_setOf_nonneg_titsForm_eq_one` (hypothesis `PosDef`) and `titsPolarForm` (= E + Eᵀ) are at `RepresentationTheory/Quiver/EulerForm.lean:57, 99, 108, 113`. `TauCeti.posRoots` is at `LinearAlgebra/RootSystem/Positive.lean:131`.
- **Injective stable category.** `TauCeti.ExactStructure.isZero_injectiveStableFunctor_obj_iff`, `injectiveStableFunctor_map_eq_zero_iff_mem_range` and `homCokernelEquivInjectiveStableHom` are at `CategoryTheory/Exact/Stable/Injective.lean:76, 88, 97`. The last needs an inflation into a relative injective, works for any target, and is R-linear.
- **Exact structures.** `factorsThrough_injective_iff_exists_extension` and `abelian_isInjective_iff` are at `Exact/Injective.lean:85, 165`. `ExactStructure.abelian` and `abelian_isInflation_iff` are in `Exact/Abelian.lean` (the latter at :179). `TauCeti.HomCokernel` is at `CategoryTheory/Linear/HomCokernel/Basic.lean:38`.
- **Arrow extensions and Baer sum.** `QuiverRep.arrowExtension` is at `ArrowExtension/Basic.lean:44`. `exists_arrowExtension_hom_fixing_ends_iff`, `exists_arrowExtension_iso_fixing_ends` and `homDifferential_surjective_iff_all_extensions_split` are at `ArrowExtension/Classification.lean:81, 191, 253`. `ShortComplex.ShortExact.extClass_baerSum` is at `Algebra/Homology/Ext/BaerSum.lean:106`.
- **Heredity and Gabriel.** `hasProjectiveDimensionLT_two_pathAlgebra` is at `Projective/Dimension.lean:49` (acyclic, finite length). `gabrielIndecomposableEquivPositiveRoot` is at `FiniteRepType/Correspondence.lean:78`.
- **Unchanged contracts.** The bimodule resolution, Hom-cocycle, translate, duality, almost-split and AR-quiver declarations that the previous review opened all still resolve.

### Cross-roadmap citations, supply direction and ownership

- **Dependency check.** On this head: `depcheck: 244 roadmaps, 2467 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. This roadmap, ArtinAlgebras, SemisimpleAlgebras, RootSystems and GrothendieckEulerForms are on main and not in the merge order. QuiverRepresentationsPartII (merge order line 264) cites this roadmap downward.
- **RootSystems on main:** §3.1 at line 506 has the two classification targets the README attributes to it.
- **ArtinAlgebras on main:**
  - §2.3 (lines 626–652): duality, exchange of projectives and injectives, and hulls as duals of covers.
  - §4.2 (825): stable equivalence and both formulas.
  - §§5.1–5.3 (887, 914, 937): the valued quiver.
  - Conventions item 6: E_k = k.
  - Its citations of 6A–6F (lines 54, 224, 1239), 6E (859) and `arQuiver k A` (950) resolve through README:819–832.
- **SemisimpleAlgebras:**
  - On main, Layer 1.5 is at line 200 and Layer 2 at 212.
  - Its open revision renumbers Layer 1.5 as §1.3. Its head also states, in its own README at lines 246–251, that a citation of Layers 1.5–2 reads as §1.3 and Layer 2. This README's citation therefore survives that merge, and no change is needed.
- **QuiverRepresentationsPartII** (open head `8fe0038`): §§1.1–1.6 (its lines 170–288) and Layers 2–4 (304, 485, 592) exist. Its contract (lines 77–81) consumes Layer 1 and the type-A case of §5.1, both present (README:734–735).
- **Consumers.**
  - GrothendieckEulerForms has Layers 0–7 on main. Its open revision's head cites this roadmap's Layers 0 and 2–4 (its lines 626–918), all present. Its row/column comparison agrees with README:579–580.
  - McKaySkewGroup (open head, its line 274) uses Layer 3 Morita (README:522–530).
  - ZigzagPreprojective (main line 179; head lines 762, 780, 804) uses Layer 1.
  - ModularCharactersAndBlocks (open head, lines 65, 504–537) uses Layer 3 and the A₂ Cartan orientation [[1,1],[0,1]] (README:598).
- **Ownership by object.** I searched main and all 478 open heads for an Ext-quiver statement, heredity of path algebras, the Hom-differential comparison and a Tits-form root pairing; none has another owner. ZigzagPreprojective uses the heredity of kQ for acyclic Q without owning it (its lines 295, 742). The overlaps tool lists no pull request changing this roadmap and no dropped id. No other `Suggested.lean` declares in `TauCetiRoadmap.QuiverRepresentations`.
- **`*Needs:*` lines.** All 14 were read. Their only roadmap edges are to SemisimpleAlgebras Layers 1.5–2 (main). Internal edges run downward; §3.3 and Layer 4 explicitly do not depend on each other (README:603–604, 614).
- **Pull-request description.** It describes only the A₂ sink-reflection correction, recomputed above and right. The folder's diff against main (merge base `eaf17b1`) is a full rewrite of both files (+1078/−853 lines), so the human approver should read the head rather than the description.

## Not verifiable

- I could not determine whether the publisher authorizes the two teaching copies of ASS and ARS that the README links (README:984, 989). The manifest records both as `institutional`, `certified`. I read them only to check locators.
- The Crawley-Boevey lectures (R02) were read from the author's own page through the sources service into a scratch manifest. They are not yet in the roadmap's manifest; R02's repair adds them.

## Source issues

- none
