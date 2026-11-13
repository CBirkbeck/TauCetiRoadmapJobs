# PORT-LocallyAnalyticRepresentationsOfLocalGroups

- Branch: `roadmap/locally-analytic-representations-of-local-groups`, from main `45f58db`.
- Head commit: `3a7730d` (`3a7730d2bd5479b9c64135ba13645a9ac86048cf`), message `LocallyAnalyticRepresentationsOfLocalGroups: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/LocallyAnalyticRepresentationsOfLocalGroups/README.md` (1769 lines, 86 numbered targets), `TauCetiRoadmap/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean` (53 lines, no declarations), `TauCetiRoadmap/LocallyAnalyticRepresentationsOfLocalGroups/metadata.toml` (`topic = "math.RT"`). Nothing outside the folder is changed.

## Build and gate

- `lake build TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups.Suggested`: `Build completed successfully (18239 jobs).` Warnings: **0** (no `sorry`, since the file declares nothing). The first build, with a bare `import Mathlib` and no `module` header, was green but warned that Mathlib is designed for the module system; the file now opens with `module` and `public import Mathlib`, the form of the recent roadmaps on main (FlagVarieties), and the gate accepts it (`imports=0`).
- Gate: `gate LocallyAnalyticRepresentationsOfLocalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 239 roadmaps, 2172 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the committed README (465 open heads, index of 2026-11-13T15:43:55Z): no cross-roadmap citation and no Lean name found nowhere.
- `#check @name` comparison: `Suggested.lean` has no `def`, `theorem`, `instance` or `abbrev`, so there is no elaborated signature to compare; nothing changed on that account.

## Which text was ported (read first)

The README in the board copy, `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`, is **not** the reviewed package. It is the round-2 text: its `review.json` is REV-PKG~2's (needs_changes, 11 blocking), it still contains defects that REV-PKG~3 to ~6 raised and REV-PKG~7 records as repaired (for example the §2.5 Check with B = ℚ_p, the Layer 0, 3 and 9 Dependencies lines, the "Layer 8 is Ding's §3.1.1–3.1.2" style layer descriptions), and it cites "LocallyAnalyticDistributionsPartII ND.0–ND.6" with slugs (*distribution-algebra*, *frechet-stein-algebra*, *banach-iwasawa-duality*, …) that exist in no roadmap, on main, at any open head or on the board (the LocallyAnalyticDistributionsPartII package numbers its targets 0.1–5.2 and assigns those objects to PadicLocalLanglandsForGL2Qp §0.1 and NoncommutativeAndEquivariantIwasawa Layer 0).

The package pull request on the jobs repository carries the later rounds: FIX~3 to FIX~8, with REV~7 reviewing `608e1cc` and FIX~8 (`21aae7e`) applying REV~7's one note (the Ding page locators of §4.5, §10.3 and §10.6, plus four further page corrections). I read the package files of `21aae7e` read-only (GitHub API GET requests for `README.md`, `Suggested.lean`, `metadata.toml`, `sources.toml` and the pull request's comments; no write of any kind) and **ported from `21aae7e`**. Its section numbering is the board copy's (0.1–10.7), so the citations of the consumers stay valid.

Two reviews of `21aae7e` were posted after this job's index (REV-PKG~8, codex, and a red-team pass, both needs_changes). I treated them as claims, verified each against the sources, main, the open heads and the pinned libraries, and applied the ones that held (below). REV~7's note is applied (it is in `21aae7e`).

## Draft pull request body

This roadmap builds the representation theory of p-adic Lie groups on locally convex vector spaces over a finite extension E of ℚ_p that the locally analytic p-adic Langlands programme runs on, for the groups G = 𝐆(L) of a split reductive group over a finite extension L of ℚ_p. Starting from the compact distribution algebras, coadmissible modules and Banach duality of PadicLocalLanglandsForGL2Qp, it constructs the distribution algebra D(G, E) of a non-compact group, the Schneider–Teitelbaum anti-equivalence between admissible representations and coadmissible D(G, E)-modules, the Ext groups of admissible representations with Breuil's identification of Ext¹ with admissible extensions, very strong admissibility, Pan's derived functors of locally analytic vectors with the strong LA-acyclicity of admissible Banach representations, and the solid representation theory used in higher Coleman theory; then the parabolic BGG categories O^p_alg over split reductive Lie algebras over E, locally analytic parabolic induction with Schraen's spectral sequence, the Orlik–Strauch functors with their exactness, irreducibility and Jordan–Hölder series, and Emerton's closed induction with the adjunction theorems of Emerton and Breuil. It ends with Ding's computation of the extension groups of the locally analytic principal series of GL_n(L): the maps ζ_w : Hom(T(L), E) → Ext¹(π_alg(φ, h), π_1(φ, h)), the dimension n + (2^n − 1)[L:ℚ_p] of that Ext¹, its compatibility with parabolic induction and its decomposition over the embeddings of L into E. These are the GL_n-side inputs of PadicHodgeParametersInLocallyAnalyticRepresentations and the Orlik–Strauch inputs of TriangulineVarietyAndItsLocalModel. None of the headline theorems is statable against the pinned Mathlib and Tau Ceti (there is no topologised space of locally analytic functions on a p-adic manifold, no D(G, E), no Fréchet–Stein algebra, no category O for reductive Lie algebras), so `Suggested.lean` states nothing and names, for each headline, the carrier it lacks.

## Dependencies that are still pull requests

LocallyAnalyticDistributions, LocallyAnalyticDistributionsPartII (a draft pull request since the index of 15:43), NoncommutativeAndEquivariantIwasawa, PadicLocalLanglandsForGL2Qp, CompletedCohomologyPartII, OverconvergentAutomorphicForms, SmoothRepresentationsOfLocalGroups, ArithmeticLocallySymmetricSpaces, VStackSheavesAndLisseCategories. All are earlier than this roadmap in the merge order (lines 200 and below; this roadmap is line 255). On main: ReductiveGroups, ReductiveGroupsPartII, RepresentationTheory/LieHighestWeight, AdicSpacesPartIII, PadicMeasuresIwasawaAlgebras; KacMoody is named in Scope and ownership only. No citation uses an id that only an open revision defines.

## What moved from the Lean file to the README

Nothing: the package's `Suggested.lean` declares nothing, and every headline is unstatable at the pins. I re-checked each docstring claim at the pins: Mathlib's `LocallyConvexSpace` takes `[PartialOrder 𝕜]` (`Mathlib/Topology/Algebra/Module/LocallyConvex.lean` line 51); `BarrelledSpace` is defined through `Seminorm` (`Mathlib/Analysis/LocallyConvex/Barrelled.lean` line 90) with `PolynormableSpace.banach_steinhaus` at line 192; Tau Ceti's `TauCeti.AnalyticStage` (`TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean` line 107) and `TauCeti.LocallyAnalytic` (`…/LocallyAnalytic.lean`, a `Module.DirectLimit` with no topology) are one-variable on ℤ_p; `TauCeti.VermaModule` requires `[IsKilling K L]` (`TauCeti/Algebra/Lie/HighestWeight/Verma.lean` lines 140–142). No Fréchet–Stein, coadmissible or category-O declaration exists in either library (grep). The only Lean change is the `module` / `public import Mathlib` header.

## Supplier replacements, citation repairs and duplication removals

Relative to `21aae7e` (42 changed or added lines):

1. **ReductiveGroups §9A, item 5 replaces a restatement (REV~8 F01, verified).** ReductiveGroups on main, Layer 9, §9A, item 5 (*The split-field producer used here*, README line 4373) constructs, over any field of characteristic zero, the finite-dimensional simple module L_K(λ) of dominant integral weight of a split Lie algebra with its base change K̄ ⊗ L_K(λ) ≅ L_K̄(λ), extended to reducible derived algebras and central characters, and forbids a second Verma or simple-quotient definition. §4.1 (ii) now identifies L(λ) for dominant λ ∈ X with that module and proves only the classification and absolute irreducibility; §4.1 (i) states that M(μ), L(μ) are `TauCeti.VermaModule` / `TauCeti.irreducibleQuotient` of [𝔤, 𝔤] with the centre acting through μ. Scope, the supplier contract, §4.1 *Needs* and the Layer 4 intro now say so.
2. **LieHighestWeight Layers 4 and 5 replaced by pinned declarations (red team F02, verified).** On main those are rows of LieHighestWeight's former-numbering table (README lines 79–80), now Tau Ceti declarations; its present Layer 5 is opposition. Cited instead, with their hypotheses read at the pin: `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` (`Existence.lean` line 234, `[IsAlgClosed K]`), `TauCeti.exists_isCompl_of_isKilling` (`CompleteReducibility.lean` line 259, any field of characteristic zero), `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center` (`Reductive/CompleteReducibility.lean` line 107, triangularisable semisimple central action), `TauCeti.harishChandraIso` and `TauCeti.vermaCentralCharacter_eq_iff` (`CentralCharacter/Isomorphism.lean` lines 106 and 159, `[IsAlgClosed K]`). LieHighestWeight is now cited for Layers 3, 7 and 9 only.
3. **ReductiveGroupsPartII RG2.0.3.** *general-linear-points-homeomorphism* is in RG2.0.3 (main README line 746), not RG2.0.2; contract and §0.1 *Needs* corrected.
4. **LocallyAnalyticDistributionsPartII §1.3 added.** 1.10 (1) needs the centre of U(g ⊗ E) to be central in D(G, E); that is §1.3 of LocallyAnalyticDistributionsPartII for compact open subgroups of a connected group (verified at its head), combined with the conjugation formula of 0.4. The contract records that §§1.1–1.3 are stated for compact locally ℚ_p-analytic groups.
5. **PadicLocalLanglandsForGL2Qp contract (red team F04, verified).** Faithful flatness of E[[H]] → D(H, E) does not contain density of the image (E → E⟨T⟩ is faithfully flat with closed image); the clause now cites density of the Dirac span to LocallyAnalyticDistributionsPartII §1.1.
6. **Duplication by object, KacMoody (on main).** KacMoody §3.3 owns Kac's category O of a Kac–Moody algebra over any field of characteristic zero, which includes finite type. The Scope sentence "the single owner of category O" now reads "the BGG category O of finitely generated modules … and of its parabolic subcategories", names KacMoody §3.3 and says how the two differ (finite generation, parabolic and algebraic subcategories of a split reductive group; for semisimple 𝔤 the BGG O is the full subcategory of finitely generated objects of KacMoody's O).
7. **Source-text residue removed.** Seven locators cited "DING25 line(s) N" (lines of a text extraction, not a reader's locator) beside the arXiv page; removed, the page locators kept.

Duplication sweep (`roadmaps grep`, 465 open heads and main, by object): category O (KacMoody, above; SpringerResolutionAndCharacteristicCycles and PadicFamiliesPartII are later and import from Layer 4), generalised Verma modules (AutomorphicLFunctionsAndLocalFactorsPartII, later, for (𝔤, K)-modules over ℂ), Orlik–Strauch and very strong admissibility (only the consumers PadicHodgeParameters… and TriangulineVariety…), Pan's R^iLA and derived analytic vectors (CompletedCohomologyPartII F.4 owns RLA on general representations and is cited; PadicFamiliesPartII, later, imports §3.5), coadmissible modules (other roadmaps use coadmissible modules over other algebras; compact D(H, E) is PadicLocalLanglandsForGL2Qp §0.1, cited), closed induction (the hits in AbelianSchemesAndArithmeticModuli and HilbertModular… concern other objects), Kostant homology (no owner elsewhere; cohomology is ALS.4.5, cited), locally analytic principal series (LocallyAnalyticDistributionsPartII §4.4 is a compact-group construction in Fu's setting; PadicLocalLanglandsForGL2Qp §4.8 the GL_2(ℚ_p) case, cited), solid representations (PadicFamiliesPartII, later, imports §3.5 and §3.10; AnalyticStacks, later), admissible Banach representations (PadicLocalLanglandsForGL2Qp §0.1 and CompletedCohomologyPartII F.1, unitary, cited; the non-unitary category of 2.1 is this roadmap's, as Scope says), Schraen (only citations of his papers elsewhere). The closest roadmaps of this job's overlap listing (PadicHodgeParametersInLocallyAnalyticRepresentations, CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, SmoothRepresentationsOfLocalGroups, TriangulineVarietyAndItsLocalModel): scopes compared; CompletedCohomologyAndLocalGlobalCompatibility (earlier) owns GL_2(ℚ_p) ϖ-adic/m-adic admissible categories and ordinary parts and specialises OverconvergentAutomorphicForms' J_B, none of which this roadmap states; the others are suppliers or consumers. LieHighestWeightPartII (earlier) concerns sl_2-triples and filtrations, no overlap. SmoothBanachRepresentations is real/complex, no overlap. Ownership against open pull requests was checked against all 465 heads of the index.

Downstream consumers: added PadicFamiliesPartII, which imports §§3.5, 3.10, 4.1, 4.2 and 4.6 (its contract, verified).

## Fixes a reviewer would flag (mathematics), each verified

1. **0.4 (iv) and 0.3 (v) for F = L (red team F01).** LocallyAnalyticDistributionsPartII §1.1 is for locally ℚ_p-analytic groups; U(g ⊗_(ℚ_p) E) → D_L(H, E) kills g_τ for τ ≠ the inclusion, so it is not an embedding. (iv) now gives the ℚ_p case from the supplier and, for F = L, the factorisation through U(g ⊗_L E) with injectivity of U(g ⊗_L E) → D_L(H, E) (Schneider–Teitelbaum 2002, Lemmas 2.4–2.5, pp. 10–11); new Check for L = ℚ_p(√p), H = 1 + pO_L.
2. **0.5 Check (red team F03).** The regular representation of a non-compact G is not locally analytic: for G = ℚ_p and f = 1 on every p^(−m) + p^mℤ_p, evaluation at p^(−m) turns the orbit map into 1_(p^mℤ_p), no power series on p^Nℤ_p for m > N. The Check is restricted to compact G and the instance added as a non-example; Emerton's memoir, Proposition 3.5.12, assumes G compact (EM17 line 3463, on page 67 of the extraction, verified).
3. **1.9 (iii) ↔ 5.3 (2) circular citation (red team F05).** 1.9 (iii) now carries its own proof (two-dimensional extension, t ↦ χ(t)(1 a(t); 0 1)); 5.3 (2) cites 1.9 (iii).
4. **1.10 needs 𝐆 connected (red team F07).** For O_2 a reflection sends x ∈ so_2 to −x, so the centre of U(g) is not central in D(G, E); "connected" added and the route now proves centrality (item 4 above).
5. **4.2 (iii) was a tautology (red team F08).** With O^p_alg := O_alg ∩ O^p, "M ∈ O^p lies in O^p_alg iff it lies in O_alg" is the definition; the content its consumers use (6.1: the algebraic L_P- and P-action on a generating subspace) is the lifting statement of Orlik–Strauch Lemma 2.8 and its proof (OS15 lines 342–350, p. 9, verified), now stated with a proof route.
6. **8.11 (1) gave ζ_w the wrong target (red team F06).** ζ_w (8.10) lands in Ext¹(π_alg, π_1) and is not surjective for n ≥ 2 (4 < 5 for n = 2, L = ℚ_p); the isomorphism onto Ext¹(π_alg, PS(w(φ), h)) is (3.10) followed by push-forward along PS_1 ↪ PS, now said so.
7. **Hom_(P,g′) was used but never defined (REV~8 F02).** Defined in 9.3 as Ding's (2.21) (DING25 lines 858–861, page 21, verified: ψ − ψ_P ∘ det_(L_P) smooth, dimension n + r·d_K), identified with ∏_i Hom_(g′) of the blocks, with two new Checks (P = B gives Hom, dimension n(1 + d_L); P = G gives Hom_(g′), n + d_L; blocks (2, 1) over ℚ_p give dimension 5, containing log_p(t_3) and not log_p(t_1)). 9.6 (3) now states that ζ_w restricts to Hom_(P,g′) ≅ Ext¹_(F_P,g′) and that W_P preserves it. T_w, compatibility T_w ⊆ F_P and T_(w,i) were also undefined; defined in 9.1 (DING25 line 460, page 12, and lines 816–818, page 20, verified).

Not applied: REV~8 F03 (the BZ77 author field of `sources.toml`): `sources.toml` is not part of the roadmap folder; the README's reference [BZ77] already names Bernstein and Zelevinsky.

## Adversarial mathematics pass

Values computed by hand; "unchanged" means the statement already held on every instance. p is odd unless stated.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 1, normalised absolute value | L = ℚ_p(√p) (f = 1); L unramified of degree 2 (f = 2) | |√p|_L = p^(−1); |p|_L = p^(−2) | holds | none |
| Conv. 3, contragredient | χ(x) = x on ℚ_p^× | (g·λ)(v) = λ(g⁻¹v): δ_x acts on χ′ by x⁻¹ | holds | none |
| Conv. 5, averaged Hecke operator | GL_2(ℚ_p), N_0 = N(ℤ_p), m = diag(p, 1) | mN(x)m⁻¹ = N(px): index p; δ_B(m) = |p| = p⁻¹ = index⁻¹; on 1 the average is 1, the bare sum p | holds | none |
| Conv. 6, labels and Weyl transition | n = 3, w = (1 2 3) | w⁻¹ = (1 3 2): w(φ) = (φ_3, φ_1, φ_2); (u·ψ)_2 = ψ_(u⁻¹(2)) = ψ_1 | holds | none |
| Conv. 7, δ_B, η, ε | n = 2, L = ℚ_p | δ_B(diag(a, d)) = |a/d|; η = 1 ⊠ |·| = |·|⁻¹ ∘ θ with θ = (0, −1); ε(p) = 1, ε(u) = u | holds | none |
| 0.1 restriction of scalars, Σ_L | L = ℚ_p(√p), GL_n | √p ⊗ 1 ↦ (√p, −√p); dim_(ℚ_p) GL_n(L) = 2n²; trivial group: dim 0 | holds | RG2.0.3 cited |
| 0.2 locally analytic representations | ℤ_p on E by (1 + p)^a; C(ℤ_p, E); f = Σ p^n 1_(p^n + p^(2n)ℤ_p) | v((1+p)^a − 1) ≥ 1 > 1/(p−1): entire on ℤ_p; f continuous, zeros accumulate at 0, f(p^n) = p^n ≠ 0: no power series at 0 | holds | none |
| 0.3 Lie action and Σ_L splitting | χ = σ(x)^k on L^×, L = ℚ_p(√p) | dχ(x ⊗ y) = kσ(x)y = k·pr_σ: g_σ acts by k, g_τ by 0; (1, 0) for k = 1 | holds | (v) now via the image in D_F |
| 0.4 D(G, E) non-compact | G = ℚ_p; G discrete; GL_2, g = diag(p, 1); F = L, L = ℚ_p(√p) | ⊕ over ℚ_p/ℤ_p, infinite rank; E[G]; Ad(g)E_12 = pE_12; x_τ ↦ 0 in D_L, E[x_σ] injects | (iv) failed for F = L | (iv) restated, Check added |
| 0.5 module structure | trivial rep; (1+p)^a; C^an(ℚ_p, E) | μ acts by μ(1); x̃ by log(1+p), δ_1 by 1 + p; f = Σ 1_(p^(−m)+p^mℤ_p): orbit not analytic | Check failed for non-compact G | Check restricted, non-example added |
| 0.6 compact-type duality | compact G, C^an(G, E); χ = x | dual D(G, E) free of rank 1; δ_x ↦ x⁻¹ | holds | none |
| 0.7 matrix coefficients | compact G, λ = ev_1; G = ℤ | F_λ(w)(g) = w(g): identity; E^ℤ reflexive, not compact type | holds | none |
| 0.8 weakly null ⇒ null | c_0(ℕ, E), e_n; V = E | ⟨(1, 1, …), e_n⟩ = 1 ∀n: not weakly null, ‖e_n‖ = 1 | holds | none |
| 0.9 completed tensor products | dim V_i = 2, 3; x^a ⊗ x^b | dim 6; derivative a + b | holds | none |
| 1.1 coadmissible over D(G, E) | G discrete; regular module, G non-compact | coadmissible = finite-dimensional; D(G) free of infinite rank over D(H): Banach stages not f.g. | holds | none |
| 1.2 strong admissibility, irreducibility | St of GL_2(ℚ_p); c-Ind_H^G 1 | f ↦ f(0) − f(∞) has non-open stabiliser (split torus); H\G/H infinite | holds | none |
| 1.3 anti-equivalence | ℚ_p^×, χ = x | module E, δ_x ↦ x⁻¹; injection ↔ surjection | holds | none |
| 1.4 abelian category | regular module of non-compact G | finitely presented over D(G), not coadmissible | holds | none |
| 1.5 external products | C^an(ℤ_p × ℤ_p) on the diagonal | after (x, y) ↦ (x, y − x), dual D ⊗̂ D: stages not f.g. over D_r(ℤ_p) | holds | none |
| 1.6 locally algebraic | Sym²(E²) ⊗ 1, v = e_1e_2 | u(t)v = e_1e_2 + t e_1²; (u(t) − 1)v = t e_1² | holds | none |
| 1.7 Ext groups | ℤ_p trivial; ℚ_p^× trivial; χ = x | D/(T) resolution: Ext¹ = E; Hom(ℚ_p^×, E) = ⟨v_p, log_p⟩, smooth part ⟨v_p⟩ | holds | none |
| 1.8 Ext¹ = admissible extensions | a ↦ (1 a; 0 1); x ↦ (1 log_p x; 0 1) | generator of Ext¹(E, E); non-smooth class | holds | none |
| 1.9 dual numbers, tautological extensions | V ⊕ V; χ(1 + ψε) | ε(a, b) = (0, a), ε² = 0; class ψ, doubling for 2ψ | held; (iii) cited 5.3 forward | (iii) proved in place |
| 1.10 locally algebraic Ext | GL_2(ℚ_p), λ = 0, W = 1; 𝐆 = O_2; spectral sequence degrees | PGL_2(ℚ_p)^ab = ℚ_p^×/(ℚ_p^×)² finite: Ext¹_(G,1) = 0, Ext¹_G = 2-dim; O_2: Ad(r)x = −x; rows q = 1, 2 vanish, q = 3 first in degree 3 | failed for disconnected 𝐆 | "connected", centrality route |
| 2.1 admissible Banach, non-unitary | x ↦ x on ℚ_p^×; c_0(ℕ, E) trivial | no lattice (p acts by p); dual ℓ^∞ killed by augmentation, infinite-dimensional | holds | none |
| 2.2 very strong admissibility | ℤ_p, C(ℤ_p, E); ℚ_p^×, x | C^la ⊆ C; non-unitary target | holds | none |
| 2.3 R^iLA | G finite; B = C(ℤ_p, E) | p-valued ⇒ torsion-free ⇒ G_0 = 1: R^0LA = B; B^la = C^la, no single n | holds | none |
| 2.4 long exact sequence | x_n ↦ p^n x_n on c_0 | image dense, not closed (y_n = p^⌈n/2⌉) | holds | none |
| 2.5 strong LA-acyclicity | G = ℤ_p trivial, level n; B = E, M = c_0(ℕ, ℚ_p) | antidifference of y^k has denominators ≤ p·p^(v(k+1)); y = pz multiplies by p^k: transition zero, also p = 2 | holds | none |
| 3.1 classical vs solid | c_0(ℕ, E) | V^∨ = (∏ O_E)[1/p] ≠ ∏ E; V^∨ ⊗ V compact operators, identity not in it | holds | none |
| 3.2 Stein groups | 𝔾_m, c(v) = v ⊗ T^k; ℤ_p + p𝔻 | x ↦ x^k; rigid function constant on infinitely many cosets is constant | holds | none |
| 3.3 Banach ↔ D(𝔾)-modules | 𝔾 = 1; 𝔾_m (Stein) | both Banach spaces; O Fréchet, D LS: excluded | holds | none |
| 3.4 solid group rings | M = 1, finite, ℤ_p | E; E[M]; O_E[[T]][1/p] | holds | none |
| 3.5 smooth, λ-smooth | ℤ_p^×, x^k | not smooth, x^k-smooth | holds | none |
| 3.6 discrete comparison | M discrete; ℤ_p | identity; colimits over ℤ/p^n | holds | none |
| 3.7 Grothendieck | M = 1 | Mod(E), generators E_■[S] | holds | none |
| 3.8 solid analytic vectors | ℤ_2, 𝔾_1 = 2𝔻 | O(𝔾_1) has 2 idempotents, O(M_0·𝔾_1) has 4 | holds | none |
| 3.9 cohomology of analytic vectors | ℤ_p, C(ℤ_p, E) | H^0 = E·1; H¹ = 0 (Shapiro) | holds | none |
| 3.10 integrable LB | Verma of sl_2, finest topology | Banach subspaces finite-dimensional (Baire), lowering operator free | holds | none |
| 4.1 split highest weights | gl_2/ℚ_3, λ = (2, 0); torus; gl_2 with (a, b; εb, a) | Sym², weights (2,0), (1,1), (0,2), same as ReductiveGroups §9A; k_μ; eigenvalues ±2√ε ∉ ℚ_p | restated a supplier | consumes §9A item 5 and Tau Ceti |
| 4.2 O, O^p, O^p_alg | sl_2 with SL_2 vs PGL_2; ℚ_3[t]/(t² − 3) | X = ℤϖ vs 2ℤϖ; ±ϖ ∈ X only for SL_2; X² − 3 has no root in ℚ_3 | (iii) tautological | (iii) restated as lifting |
| 4.3 generalised Verma | gl_3, λ = (2, 0, 1); gl_2, (0, 2) | ⟨λ, α_1^∨⟩ = 2, ⟨λ, α_2^∨⟩ = −1: I = {α_1}; (0, 2): I = ∅ | holds | none |
| 4.4 BGG duality | gl_2, λ = (1, 0) | L^∨ weight (1, 0); contragredient (0, −1) = −w_0λ | holds | none |
| 4.5 low-length multiplicities | gl_2, λ = (1, 1); gl_3, Levi GL_2 × GL_1 | s·λ = (0, 2), −s·λ = (0, −2); second layer 2 summands; L⁻(−s_1·λ) absent, L⁻(−s_2·λ) once | holds | none |
| 4.6 Kostant homology | gl_2, Sym^k | n⁻: H_0 (k, 0), H_1 (−1, k+1) = s·λ; n: H_0 (0, k), H_1 (k+1, −1) | holds | none |
| 5.1 parabolic induction | GL_2, B⁻; P = G; W = E², smooth f | ℙ¹(ℚ_p); U; f(p) ⊗ p·w needed for equivariance | holds | none |
| 5.2 principal series | GL_1; GL_2 χ = 1; λ non-dominant | PS = χ; (Ind 1)^∞ = [1 — St] nonsplit; no algebraic vectors | holds | none |
| 5.3 torus Ext | n = 0, 1, 2; L = ℚ_p(√p) | dim Hom(T) = 6, Hom_sm = 2, Hom_g′ = 4, Hom_σ(L^×) = 2; χ′ = χ|·| killed by δ_t − χ(t) | holds | (2) cites 1.9 (iii) |
| 5.4 N-homology | GL_2, π = 1 | H_1(N, 1) root line (1, −1) | holds | none |
| 5.5 Schraen | GL_2, Σ = 1, ρ = z^(0,2) | H_0 (0, 0), H_1 (−1, 1), neither (0, 2): Ext = 0 | holds | none |
| 6.1 Orlik–Strauch functor | Verma M⁻(μ); split torus | (Ind z^(−μ)χ)^an; equality for T | holds | none |
| 6.2 exactness | 0 → K → M⁻(−λ) → L⁻(−λ) → 0 | 0 → F(L) → PS → F(K) → 0 | holds | none |
| 6.3 transitivity | GL_2 lower Borel, χ_2 ⊠ χ_3 | unnormalised = normalised of χ_2|·|^(1/2) ⊠ χ_3|·|^(−1/2): reducible iff χ_2/χ_3 ∈ {1, |·|^(−2)} | holds | none |
| 6.4 irreducibility | GL_2, χ_1 = χ_2; χ_1/χ_2 = |·|; zero argument | reducible; normalised ratio |·|², irreducible; F(M, 0) = 0 | holds | none |
| 6.5 Jordan–Hölder | GL_3 generic | 6 constituents, multiplicity 1 (S_3 Kazhdan–Lusztig trivial) | holds | none |
| 6.6 products | GL_2(ℚ_p) × GL_2(ℚ_p(√p)) | 2·4 = 8; non-generic 3·4 = 12 | holds | none |
| 6.7 Ext¹ vanishing | n = 2, L = ℚ_p; L = ℚ_p(√p) | no s with lg > 1; s = (s, s), lg 2 | holds | none |
| 7.1 compact-support adjunction | GL_2, V = 1 | Hom_T(δ_B⁻¹δ_B, 1) = E; unaveraged sum gives twist by p | holds | none |
| 7.2 closed induction | χ smooth; z^(0,2)χ | (Ind χ)^∞; M⁻((0, −2)) simple: full induction | holds | none |
| 7.3 balanced maps | z^(1,1) | M(λ) → induction has image det, kernel ≠ 0 | holds | none |
| 7.4 Emerton adjunction | δ smooth, V smooth | second adjointness, unnormalised | holds | none |
| 7.5 Jacquet modules of VSA | ℚ_3^×, 3 ↦ (0 3; 1 0) | X² − 3 irreducible: no E-valued character, U = V over E(√3) | holds | none |
| 7.6 Breuil adjunction | Q = B, C(I, s) | Hom_T(z^(s·λ)w(φ)ηδ_B, J_B(C)) = E | holds | none |
| 8.1 weights | n = 2, h = (1, 0); n = 3 | λ = (1, 1); θ^P = (0, −1, −1), (0, 0, −2) | holds | none |
| 8.2 π_alg | φ_1 = φ_2|·| | reducible: genericity needed | holds | none |
| 8.3 PS, C(w, u) | ℚ_p, n = 2 | η z^λ = |t_2| t_1^(h_1) t_2^(h_2+1) = z^h ε(t_2) | holds | none |
| 8.4 constituents, socle | n = 3, w = (1 2 3), w′ = (2 3)w | w(w′)⁻¹ = (2 3) ∈ W_1; (1 2) ∉ W_1 | holds | none |
| 8.5 C(I, s) | n = 3, w = (1 3); w′ = (2 3)(1 2 3) | inverse images {3}, {3}; forward {2}, {3} | holds | none |
| 8.6 Jacquet lines | λ = (1, 1) | z^(0,2) not a character of J_B(π_alg) (algebraic part z^(1,1)) | holds | none |
| 8.7 PS_1, π_1 | n = 2, 3 | lengths 1 + 2d_L, 1 + 6d_L; PS_1 1 + 2d_L for n = 3 | holds | none |
| 8.8 self-extensions, Weyl transition | n = 3, (2, 4, 8) at 3 | p_u gives (8, 2, 4); e_i = (14, 56, 64); first-order (2, 24, 64) on both sides | holds | none |
| 8.9 lines Ext¹(π_alg, C) | n = 2, λ = (1, 1) | H_1(N⁻, det) weight (0, 2) = ρ; H_0 (1, 1) ≠ (0, 2) | holds | none |
| 8.10 ζ_w | n = 2, ℚ_p | sum of two ζ_w: 8 → 5, not injective | holds | none |
| 8.11 Ext¹(π_alg, PS_1) | n = 2, ℚ_p and ℚ_p(√p) | 4; 6; ζ_w into π_1 not onto (4 < 5) | target of ζ_w wrong | restated |
| 8.12 dimension | (n, d) = (1, 1), (2, 1), (3, 1), (2, 2) | 2, 5, 10, 8 | holds | none |
| 8.13 π(φ, h) | n = 2, 3 | π = π_1; π ≠ π_1 (lg 2 constituents) | holds | none |
| 8.14 filtration | n = 2, ℚ_p | 2 ⊆ 3 ⊆ 4 ⊆ 5 | holds | none |
| 9.1 Levi data, T_w | n = 3, blocks (2, 1), tuple (φ_3, φ_1, φ_2) | singleton block k = 3: φ_2 z^(h_3) | T_w undefined | T_w, T_(w,i) defined |
| 9.2 constituents in induction | n = 3, (2, 1) | i = 1: {1}, {2}; i = 2: {1, 2}; {3} absent | holds | none |
| 9.3 π_(F_P), Hom_(P,g′) | P = B, G, blocks (2, 1) over ℚ_p | #S = (n−1)d, (2^n − 2)d, 3d; Hom_(P,g′) dims n(1+d), n + d, 5 | Hom_(P,g′) undefined | defined, 2 Checks |
| 9.4 Ext¹(π_alg, π_(F_P)) | B; G; (2, 1) | n + nd; n + (2^n − 1)d; 7 | holds | none |
| 9.5 ζ_(F_P) | (2, 1) | (2 + 3d) + (1 + d) = 7 for d = 1 | holds | none |
| 9.6 bijectivity, weight maps | (2, 1), ℚ_p | both sides 7; Hom_(P,g′) dimension 5 = Ext¹_(F_P,g′) | domain undefined | (3) restated |
| 9.7 endpoint amalgamation | n = 3 | labels {1}, {2}, {1, 2} / {3}, {1, 3}, {2, 3}; 2·7 − 4 = 10 | holds | none |
| 10.1 σ-analytic, algebraic away from σ | ℚ_3(√3), H = 1 + 3O_L, χ_1, χ_(1/2) | log iso on v ≥ 1 > 1/2; g_τ acts by 1, ½; 2m = 1 unsolvable | holds | none |
| 10.2 π_(1,σ) | general n | length 1 + (2^n − 2); PS_(1,σ) length n | holds | none |
| 10.3 Ext¹_σ(π_alg, π_alg) | n = 1, 2; d = 2 | 2; (n − 1) + 2 = 3 vs 4 | holds | none |
| 10.4 Ext¹_σ(π_alg, PS_(1,σ)) | n = 1, 3 | 2; (3 + 1) + 2 = 6 = 2n | holds | none |
| 10.5 σ-decomposition | n = 2, d = 2 | 5 each; 8 total; (5 − 2) + (5 − 2) = 8 − 2 | holds | none |
| 10.6 σ and parabolic | B; G; (2, 1) | 2n; n + 2^n − 1; 7 | holds | none |
| 10.7 σ endpoint amalgamation | n = 2 | 4 + 4 − 3 = 5 | holds | none |
| Layer 0 Examples | p = 3 | 1, 4, 16; cubes of units ≡ ±1 mod 9, 4 is not | holds | none |
| Worked example GL_3 | ℚ_p | 1 + 6 = 7; 3 + 7 = 10; 2·(3 + 2 + 2) − 4 = 10 | holds | none |

Context check: `Suggested.lean` has no `variable` block and no statement, so no standing hypothesis can drop out. Generality: the README's statements are not mirrored in Lean.

## Unresolved

1. **TriangulineVarietyAndItsLocalModel's requests on this roadmap.** It records two gap contracts addressed here (gap:all-constituent-triangularity, a unitriangular system of Jordan–Hölder multiplicities for all principal-series constituent families including non-generic and non-locally-algebraic data; gap:constituent-conventions, the BHS weight conventions). Neither is stated as a target here; 6.5 (1) gives the multiplicities [M : L]·[i(π_P) : π_Q]. Whether to add them is for the two roadmaps' authors.
2. **Layer 7 numbering.** `21aae7e` renumbered §§7.2–7.5; the README's former-numbering table maps the old ids, but §7.2 to §7.5 occur in both numberings. PadicHodgeParametersInLocallyAnalyticRepresentations cites "§§7.1–7.3" and "§7.3 (iv)" in the former numbering (closed induction is now §7.2 (iv)); it should move to the present numbers.
3. **SolidAnalyticRings** (earlier in the merge order) lists "LocallyAnalyticRepresentationsOfLocalGroups LR.3" as a consumer of its §7.4; this roadmap does not consume it (Layer 3 uses VStackSheavesAndLisseCategories §VS2.2). No edge was added; that line belongs to SolidAnalyticRings.
4. **Supplier gaps still open at the suppliers' heads** (each checked): gap:barrelled-banach-steinhaus and gap:compact-type-tensor (exactness only; LocallyAnalyticDistributions §0.0 now supplies the comparison, the compact-type limit and the dual), gap:frechet-stein-general and gap:radius-algebras (PadicLocalLanglandsForGL2Qp §0.1, the same two gaps LocallyAnalyticDistributionsPartII records), gap:generic-principal-series-finite-coefficients, gap:principal-series-jacquet-finite-coefficients, gap:finite-length-finite-coefficients, gap:ordered-character-map (SmoothRepresentationsOfLocalGroups, whose SR.3 is over ℂ), gap:kostant-split-reductive (ALS.4.5 is for Res_(F/ℚ)G).
5. **Questions for humans carried from the reviews:** the p > 3 hypothesis outside type A in Layer 6 (unchanged; GL_n is unaffected); licence of the preprint sources BCGP25, EMJ2 and OR19; SCHN11, NFA02 and HUM08 are uncertified books whose locators could not be checked against text.
6. **Board copy.** The board's `packages/LocallyAnalyticRepresentationsOfLocalGroups` (README, `review.json`) is the round-2 state; the worker may want to refresh it from the package pull request before using it again.

No suspicious instruction was found in the data read (reviews, package files, supplier roadmaps).


Pull request: #2294 (roadmap/locally-analytic-representations-of-local-groups at 3a7730d)
