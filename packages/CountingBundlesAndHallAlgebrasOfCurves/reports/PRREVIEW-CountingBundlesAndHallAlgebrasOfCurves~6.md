# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at b36567c)

**Verdict:** needs changes

This is an incremental re-review of the 49 lines that changed since fbebf39. There is one finding, a P3 locator defect that the repair commit introduced. The three findings of the previous report are repaired in substance, and the gate passes.

## R01 (P3) — The rewritten library line numbers describe main's newer pins, not the pins this head builds against

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:53, 55, 61, 63`. For example, README:61 reads: “`InvertibleSheaf.fixedRankOneEquiv` in `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean`, line 248, … by `InvertibleSheaf.fixedRankOneEquiv_inverse_obj_obj` (line 275)”.

**Claim:** Each “file, line N” locator names the declaration at the pinned Mathlib and Tau Ceti.

**Witness:** This head's `lake-manifest.json` pins Tau Ceti at a91d3aa and Mathlib at 6b7abb3. At those pins `FixedRank.lean` has 253 lines, with `fixedRankOneEquiv` at line 185, so “line 275” does not exist. All eleven rewritten numbers instead match main's pins, Tau Ceti 2fd255d and Mathlib 1b1ccf4, which main adopted in commit a891cd19 after this branch's base.

| Declaration | README now | This head's pin | Main's pin |
|---|---|---|---|
| `Matrix.card_GL_field` | 122 | 120 | 122 |
| `IsArtinianRing.isNilpotent_jacobson_bot` | 60 | 54 | 60 |
| `IsArtinianRing.isSemisimpleRing_iff_jacobson` | 640 | 641 | 640 |
| `Skeleton` | 114 | 74 | 114 |
| `FiniteLocallyFreeSheaf.FixedRank`, `.pullback` | 71, 106 | 69, 104 | 71, 106 |
| `InvertibleSheaf.trivial` | 144 | 131 | 144 |
| `InvertibleSheaf.eulerDegree` | 74 | 70 | 74 |
| `InvertibleSheaf.fixedRankOneEquiv` | 248 | 185 | 248 |
| `InvertibleSheaf.fixedRankOneEquiv_inverse_obj_obj` | 275 | 212 | 275 |
| `YoungDiagram.armLength`, `legLength` | 131, 135 | 136, 140 | 131, 135 |

The unchanged locators are correct at both pins: `Finite.isDomain_to_isField` 176, `Indecomposable` 1096, `ObjectProperty.FullSubcategory` 39 and `Scheme.Modules.eulerCharBelow` 105.

**Exact repair:** Use one of these two options; the first is preferred.
- **Rebase the branch onto main.** Its manifest then pins Tau Ceti 2fd255d and Mathlib 1b1ccf4, where every number in the “README now” column is right. Rerun the gate's targeted build at those pins.
- **Keep this base.** Restore the numbers in the “This head's pin” column: 120, 54, 641, 74; 69 and 104; 131; 70; 185; 212; 136 and 140.

**Repair test:** At 2fd255d, `grep -n` finds `def fixedRankOneEquiv` at line 248 and `theorem fixedRankOneEquiv_inverse_obj_obj` at line 275. At a91d3aa it finds them at lines 185 and 212. Either repair makes README:61 name the right declaration at the pins the branch builds against.

## Previous findings

- R01 — repaired: README:71 now cites “§0.1 (local endomorphism rings and indecomposables, with Fitting's lemma), §0.3 … §0.4 …” and “§0.6, the radical as a morphism ideal”. README:329 reads “RepresentationTheory/ArtinAlgebras §0.6”, and the Layer 1 dependencies list §§0.1, 0.3–0.4 and 0.6.
- R02 — partly repaired: README:9, 61, 216, 262 and 307 now cite `InvertibleSheaf.eulerDegree` and `InvertibleSheaf.fixedRankOneEquiv`, and the §0.2 rank-one bullet is true (Lean probe below). Their line numbers 74, 248 and 275 belong to main's newer pin, so R01 above carries that remaining part.
- R03 — repaired: `Suggested.lean:36–42` now says Mellit's integrality “lacks the plethystic logarithm, with Adams operations raising q, z, the α_i and T to powers … the stable symmetric-function ring … enter its proof, not its statement”.

## Verified sound

### Gate, dependency check, elaboration, signatures, probes

- **Gate (my own run at b36567c):** every scanner is 0.
  ```text
  gate CountingBundlesAndHallAlgebrasOfCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  The worker's gate on this head also reports `build=0`.
- **Dependency check, verbatim:**
  ```text
  depcheck: 234 roadmaps, 2417 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or `moved:` line. The diff adds no supplier. It cites only RepresentationTheory/ArtinAlgebras and SchemeAndStackFoundations, both on main, and Tau Ceti declarations.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty, and the worktree is clean.
- **Elaboration:** I ran `lake env lean` on `Suggested.lean` at the pins (a91d3aa, 6b7abb3). It exits 0 with exactly two warnings, the `sorry` warnings at lines 89 and 99. The diff touches only the module docstring.
- **Signatures:** I elaborated a scratch copy with `#check @` for all five declarations. The types are unchanged from the previous report:
  - `bundleDegree`, `IsAbsolutelyIndecomposable` and `absIndecCount` keep `k [Field k] (X : Scheme) [X.Over (Spec k)]`.
  - `nilpotent_matrix_count` keeps `[Field K] [Finite K] (n : ℕ)`.
  - `absIndecCount_eq_of_degree` keeps `[Finite k] [IsProper] [SmoothOfRelativeDimension 1] [GeometricallyConnected] (r : ℕ) (d d' : ℤ)`.
- **Probe of the new §0.2 bullet:** I built the Tau Ceti module `TauCeti.AlgebraicGeometry.LineBundle.Degree`, needed only by the probe, with `lake build`. Then `bundleDegree k X E = InvertibleSheaf.eulerDegree k ((InvertibleSheaf.fixedRankOneEquiv X).inverse.obj E)` closes by `simp [bundleDegree, InvertibleSheaf.eulerDegree]` for every `E : FixedRank X 1` on every scheme over k. This confirms “on every scheme over k and not only on curves”. Both declarations take only `[Field k] [X.Over (Spec k)]` (`LineBundle/Degree.lean:62`, pin a91d3aa).
- **One-tactic probes (headlines unchanged):** on `nilpotent_matrix_count`, `simp` makes no progress. On `absIndecCount_eq_of_degree`, `rfl` fails. Neither is padding.
- **Docstring list of non-statable headlines:**
  - Neither pin has compactly supported cohomology. Tau Ceti's `AlgebraicTopology/Cohomology/` has ordinary, relative, twisted, cup and cap cohomology, and grep finds no compact-support variant and no analytification of complex points.
  - Neither pin has a plethystic Exp or Log (grep: 0 hits).
  - So the Higgs bullet's “compactly supported ℓ-adic cohomology” and “compactly supported rational cohomology of its complex points”, and the Mellit bullet's “plethystic logarithm”, are absent at the pins, as the docstring says.

### The changed passages checked against their targets

- **README:11, 71, 313–317, 325–329, 433 (ArtinAlgebras citations):**
  - On main, §0.1 (line 251) contains both the supplied “local End ⇒ indecomposable” and Fitting's lemma. Fitting's lemma assumes idempotent-complete, binary biproducts, and Hom-finite over a commutative Artinian ring; Coh(X) over k satisfies all three.
  - §0.3 (line 313) is uniqueness for local-End summands, and §0.4 (line 333) is recognition.
  - §0.6 (line 418) gives the matrix description: “f ∈ rad(X, Y) exactly when no component X_i ⟶ Y_j is an isomorphism”. README:71's derived consequences follow from it.
  - The same four headings are at the open RepresentationTheory head that carries ArtinAlgebras (its README lines 251, 313, 333, 418), so no open pull request drops them.
- **README:61 (“From Tau Ceti”), at pin a91d3aa:**
  - `InvertibleSheaf.eulerDegree` (`LineBundle/Degree.lean:70`) has body `eulerCharBelow k X L.obj 2 − eulerCharBelow k X (trivial X).obj 2`, the same truncation as `bundleDegree`.
  - `InvertibleSheaf.fixedRankOneEquiv_inverse_obj_obj` (`VectorBundle/FixedRank.lean:212`) states `((fixedRankOneEquiv X).inverse.obj E).obj = E.obj.obj`, proved by `rfl`.
  - Both live in namespace `InvertibleSheaf`, so the README's fully qualified names are right.
- **README:216:** SchemeAndStackFoundations §3.3 on main (line 4713) lists `vectorBundleDegree_rankOne` (“for `r = 1` it is Tau Ceti's `InvertibleSheaf.eulerDegree`”). The open SchemeAndStackFoundations heads keep it (their lines 5127 and 4676).
- **Seeded sample:** only target 1.3 (with 1.2 next to it) falls in the changed passages. Its S16 locator is S16 line 615, printed p.309. There, Lemma 2.3 is Krull–Schmidt and the residue field k_M, Lemma 2.4 is the radical (2.1) with End/U ≅ ∏ gl(n_i, k_{M_i}), and Corollary 2.5 is the mass ratio, at S16 lines 619–645. These agree with §§1.2–1.3, including the matrix-block correction.
  - The other sample targets (0.1, 2.6, 3.3, 4.3, 4.5, 5.1, 5.7, 6.1, 6.2, 6.4, 6.6, 7.2, 8.3, 11.1) are in text this diff leaves untouched. Earlier rounds passed them, and the previous report's table covers 0.1, 4.3, 5.1, 7.2, 6.4 and 6.6.
  - The README flags no locator as unverified (grep: 0 hits).

### Adversarial table

Rows for changed statements (new values):

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §0.2 rank-one bullet: `bundleDegree` = `eulerDegree` ∘ `fixedRankOneEquiv.inverse` | O(1) on P¹; O on genus 2; O on Spec k; O on A¹ (junk regime); Lean probe | 2−1·1=1 vs 2−1=1; −1−(−1)=0 vs 0; 1−1=0 vs 0; H⁰=k[t] has junk finrank 0, so 0−0=0 on both sides; `simp` closes it on every scheme | agrees; none |
| §0.2 Check: O² on a genus-two curve | h⁰=2, h¹=4 | weighted −2−2(−1)=0; χ₂ alone −2; unweighted rank-one formula −2−(−1)=−1 | three distinct values, so the Check discriminates; none |
| §1.2 via ArtinAlgebras §§0.1, 0.3–0.4 | 0; a line L; L² | empty decomposition; End L=k (local); End L²=M₂(k) (not local), two summands, uniqueness gives L,L | agrees; none |
| §1.3 via ArtinAlgebras §0.6 | N=O_X/m_x² at a rational point (End N=k[t]/t²), M=N² over 𝔽₂; κ(x)→N→κ(x) | rad End M=M₂(tN), dim 4 (S16 (2.1) read literally: 2); End/rad=M₂(𝔽₂), 16 elements; composite κ→N→κ is 0 and N→κ→N is ·t ∈ rad End N | agrees; none |
| Docstring: Mellit Log with Adams on coefficients | F=Exp(aT)=1/(1−aT); one-box H₁ at g=1, q=2, α=−1 | [T²]Log F=a²−a²/2−a²/2=0 with ψ₂(a)=a²; fixing a gives (a²−a)/2=1 at a=2. H₁=3(z+1), so H₁(1)=6=P(1)=A_{1,1,d}, using only the cell product and [T¹] | the docstring's Adams specification is needed and right; none |
| Docstring: Higgs purity and compact Poincaré | g=1, r=1 over ℂ | H=E×ℂ, P_c=t²(1−t)²; t^{2D}A_{1,1,d}(t,t)=t²(1−t)², D=1. The statement uses H_c(H(ℂ),ℚ) and A only; Artin comparison is in the §9.3 route | agrees; none |

Rows carried forward unchanged from PRREVIEW~5, whose report holds the values; these statements are untouched:
- 0.1 coefficient ring: R_0 vs ℚ[T_0]; ψ₂((q−1)⁻¹)=1/3.
- 0.3 residues: rRes/dRes 1/−1, 0/−1, −1/2/+1/2.
- 1.9 large degree: g=2, r=2, bound 2.
- 2.4 Jordan type, and 2.7 fibre mass 2^{g−1}.
- 4.3 coproduct shifts, and 4.6 spherical (√2·3).
- 4.7 HN strata of class (2,0), and 4.8 one-line mass.
- 4.9 counts 1+4z: N₀/(1−z).
- 5.1 pairing series, and 5.4 separation.
- 7.2 Higgs criterion.
- 9.2 positivity (D=5, 10 not divisible by 4).
- 11.6 conjectures.
- `nilpotent_matrix_count`: 1, 1, 4, 9.
- `absIndecCount_eq_of_degree`: r=0 gives 0; P¹ gives 1, 0; E/𝔽₂ gives 3 and 3.
- 6.4 rank two: 25/16−5/16−1/4=1.
- 6.6 origin constants: 2.
- 8.2 slope zero: 6.
- 9.4 cone trace: q^D prefactor.
- 10.1 kernel: 3(z+1), 2(z+2).

### Ownership and overlaps

- `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id only an open revision defines. I re-checked the ids the diff introduces (ArtinAlgebras §§0.1, 0.3, 0.4, 0.6 and SchemeAndStackFoundations §3.3) at the open heads that revise those roadmaps; all are present.
- The diff adds no object, so no ownership question arises.
- `Suggested.lean` declares no new name.

### Remarks on untouched text

- none.

## Not verifiable

- **M20, FH58, HES81:** settled uncertified and cited by locator. The diff does not touch their citations.
- No new text was needed, and `needs-references.toml` was not created.

## Source issues

- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309: the source says each repeated indecomposable contributes n_i copies of its endomorphism radical to rad End(M); it should be the full n_i-by-n_i matrix block over that radical; affects the proof.
