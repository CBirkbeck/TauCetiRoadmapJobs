# PORT-SpectralSequencesAndConvergence

Branch: `roadmap/spectral-sequences-and-convergence`.
Head commit: `00c224712500d0d7fccb43255ce9ea66110f2425`.
Base: `e1cd6a5`; the initial worktree status was empty. The commit adds only the three files of
`TauCetiRoadmap/SpectralSequencesAndConvergence/`.

## Draft pull request body

Builds the common language in which a spectral sequence converges, over an arbitrary abelian
category and on Mathlib's carrier `CategoryTheory.SpectralSequence`, which records pages and
homology isomorphisms but no limit page, abutment or convergence. The roadmap constructs the cycle
and boundary towers and the limit page of any spectral sequence, bidegree assignments and
boundedness, and weak, ordinary and strong convergence to a filtered abutment in a prescribed set
of total degrees. With these it proves the stabilisation theorems for bounded sequences, the
comparison theorem, and the vanishing, dimension-count, Euler-characteristic, two-row,
two-column, edge-morphism and five-term consequences. It then specialises to the spectral
sequences the libraries already construct: convergence of the spectral sequence of a spectral
object indexed by `EInt` in a range of degrees (Stacks Lemma 24.13 in spectral-object form) and of
Mathlib's quadrant sequences, the classical convergence theorems for filtered complexes
(finite, cohomologically bounded, exhaustive and bounded below), and the spectral sequence of an
exact couple with its identification with the spectral-object sequence. The last layer works in
replete abelian categories: it characterises Tau Ceti's repleteness through `lim¹`, proves the
Mittag–Leffler vanishing, and proves Boardman's conditional-convergence theorems with the
whole-plane obstruction and the complete convergence theorem for filtered complexes. Module,
spectrum and sheaf versions stay with DGFloer, StableHomotopyKTheory, AlgebraicTopology,
SchemeAndStackFoundations and EnhancedDerivedSheaves, and are recorded here as instances.

AI assistance: Claude Opus 5.5 performed the port, the supplier, citation and ownership checks,
the mathematical self-review and the Lean signature validation.

## Validation

- Exact build outcome: `Build completed successfully (18274 jobs).`
- Module line: `⚠ [18273/18274] Built TauCetiRoadmap.SpectralSequencesAndConvergence.Suggested (14s)`.
- Exit status 0. Warnings: **10**, all `declaration uses 'sorry'`, one per theorem (lines 114,
  126, 140, 188, 213, 231, 249, 279, 306, 327). No other warning. The Lean file was not changed
  after this build; only README wording changed afterwards.
- Gate: `gate SpectralSequencesAndConvergence: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- `git diff --check origin/main..HEAD`: exit 0.
- Citation resolver on the ported README: no cross-roadmap citation and no Lean name found
  nowhere. The two names it flagged in the package README (`DoubleComplex.edgeBottom`,
  `DoubleComplex.edgeLeft`) are gone (see below).
- Dependency check, exact output:

```text
depcheck: 242 roadmaps, 2194 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Dependencies still in pull requests

None. Every roadmap the README names as a supplier or an owner is on main: StableHomotopyKTheory
(§§7.21–7.26; it is also the one merge-order predecessor named), DGFloer (Layer 1 items 2–3),
AlgebraicTopology (§6.0), DerivedModuleAlgebra (§S.1), SchemeAndStackFoundations (§§2.2,
2.17), EnhancedDerivedSheaves (E2:towers.1, E2.1, E2.2), ComplexKahlerGeometry (K8),
HeegaardFloer and MorseTheory. No id this README cites is defined only by an open revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: thirteen declarations,
namely ten headline theorems and the three real-bodied definitions they need
(`BidegreeAssignment`, `HasConvergenceBounds`, `IsMittagLeffler`), no sorry'd data, no
`set_option`, no examples, and a module docstring that names each headline not statable at the
pins and the missing carrier (the limit page of an arbitrary spectral sequence, the convergence
structures, bigraded exact couples, the whole-plane obstruction, the double-tower image system).
I checked each declaration against the padding rules: none restates a definition, closes in one
library step, is a boundary case or mirrors a Check. I found no statable headline missing. The
quadrant convergence of 4.5 is, as the docstring says, already a composite of pinned
isomorphisms apart from the convergence structure, and a `HasConvergenceBounds` instance for
`IsFirstQuadrant` would be an API lemma.

Two Lean repairs:

- Added `import TauCeti.Algebra.Homology.SpectralObject.Stabilization`. The file uses
  `Abelian.SpectralObject.coe_le_coe_add_one` from that module, which had reached it only
  transitively through `Abutment`.
- Docstring precision: "Tau Ceti proves the cofinality of `lim¹` for towers of modules only" now
  reads "Tau Ceti's cofinality of `lim¹` is stated for towers of modules". At the pin it is
  `TauCeti/Algebra/Category/ModuleCat/Tower/Subsequence/LimOne.lean`. `TauCeti/Algebra/Group/Tower.lean`
  has a separate nonabelian `lim¹`, so "only" was imprecise.

Mechanical signature audit: I put `#check @name` for all 13 declarations in one scratch copy of
the file and elaborated it once (exit 0). Each elaborated type matches its README statement.
Every binder is in the declaration's own signature (no section `variable`s are used), so none was
lost. The four weak-Serre-class instances survive in both Euler theorems,
`[HasColimitsOfShape ℕ C] [HasExactColimitsOfShape ℕ C]` in the exhaustive comparison, and
`[HasCountableProducts C] [TauCeti.IsReplete C]` in the Mittag–Leffler theorem. Nothing changed
as a result of the audit.

## Supplier replacements and duplication removals

Suppliers. I grepped every Mathlib and Tau Ceti declaration in the supplier contracts at the pins
(Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, checked against the checkouts' `HEAD`). All exist, in the
files named. I re-read and resolved every cross-roadmap citation on main. Repairs:

- DerivedModuleAlgebra §S.1 contract: the backticked names `DoubleComplex.edgeBottom` and
  `DoubleComplex.edgeLeft` are not declared at the pins. They are legacy citation names in
  DerivedModuleAlgebra's name table, so they read as names this roadmap would have to declare.
  They are replaced by the maps they denote, `E₂^{n,0} → Hⁿ(Tot A) → E₂^{0,n}`.
- Scope and ownership, StableHomotopyKTheory: the paragraph now says in one clause each how two
  of its sections are instances of statements here, kept with their owner. §7.23's identification
  of the exact-couple pages of a filtered spectrum with Mathlib's spectral-object pages is 6.3
  (after homological reindexing). The abelian-group form of §7.26 is 7.4 in `ModuleCat ℤ` (after
  converting bidegrees). §7.23 had not been mentioned as an instance before.
- Scope and ownership wording: DGFloer's module theorems and §7.26 were said to be specialised "in
  a Check", and DerivedModuleAlgebra §S.1 to be "a Check". In the README the first two are API
  bullets of 5.4, 7.5 and 7.4, and the third is in the Examples of Layers 3 and 4. The text now
  says where each is recorded.

Duplication sweep, by object, after the edits. I used `roadmaps grep` over main and the open
roadmap heads, and the board packages index. Objects searched: limit page and infinite cycles,
convergence structures, conditional convergence and the whole-plane obstruction, exact couples
and their morphisms, `towerDifference` / repleteness / `lim¹` in abelian categories,
Mittag–Leffler in abelian categories, comparison theorems, five-term and two-row sequences. I
found no second owner of a general object. The near hits are applications or other carriers:
KTheoryFiniteLocalFields (permanent cycles of a specific THH sequence), StableInfinityCategories
(Boardman's theorem used as a proof route, cited manually), EnhancedDerivedSheaves and
CrystallineCohomology (derived limits on replete topoi), DerivedModuleAlgebra §1.T.1 (module
towers, mapped to Tau Ceti), ArithmeticGaloisDuality (module and group towers), and
SchemeKTheoryOperations, ChromaticHomotopyTheory and BordismFormalGroups (exact couples of
spectra, consumed from StableHomotopyKTheory). No target was removed, so "Scope and ownership"
records no removal. The closest roadmaps of the overlaps report are AlgebraicTopology (main and
two open revisions), EnhancedDerivedSheaves (main and two open revisions), ArithmeticGaloisDuality,
DerivedModuleAlgebra and StableHomotopyKTheory. I compared their ownership statements with this
roadmap's: each owns module, sheaf, spectrum or double-complex instances. This roadmap owns the
abelian-category language and the stronger categorical variants, each with its difference stated.
The downstream board design SpectralSequencesAndConvergencePartII cites §§3.2–3.6, 4.5, 5.1–5.4,
6.1–6.3 and 7.5 by number, so I kept every section number.

## Fixes from the upstream-reviewer read

I re-read the whole README and recomputed the Checks of every section (table below). I found no
false identity, wrong sign, wrong direction, vacuous statement or unsourced claim. The fixes are
the four README edits above (the two undeclared names, the missing §7.23 instance clause, and the
three "a Check" misdescriptions) and the Lean docstring fix.

## Adversarial mathematics pass

`K₂ = (ℤ →(×2) ℤ)` in degrees 0, 1 with the stupid filtration (increasing `G_t = F^{−t}`); `ℓ` is
prime.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Lean `BidegreeAssignment` (2.1) | `(p,q) ↦ (p,p+q)`, `e=0` on `up' (r,1−r)`; `(q,p+q)`; `(p,p)`; classical `(−q−1,p+q)`, `e=1` | page-`r` relation `(p,q)→(p+r,q+1−r)`: deg `p+q → p+q+1`, fil `p → p+r = p+r−0` ✓; swapped fil `q → q+1−r`, change `1−r ≠ r−e` for any fixed `e` ✗; `(p,p)`: `(0,0),(0,1)` both ↦ `(0,0)` ✗ injective; classical fil `−q−1 → −q+r−2 = fil+r−1` ✓ `e=1` | definition separates the three models | none |
| Lean `dFrom_eq_zero_of_boundedBelow` (2.2) | first quadrant `β(n)=n+1`, `e=0`, `pq=(1,0)`, `r=2`; 1.4 ℓ-adic complex | bound `β(2)−1+0 = 2 ≤ 2`; target `(3,−1)` has `fil=3 ≥ β(2)=3` → zero, `d=0` ✓. ℓ-adic complex: `E₁^{p,1−p}=ℤ/ℓ` for all `p≥1`, no `β(1)` exists, hypothesis unsatisfiable; `Z_r(0,0)=ℓ^{r−1}ℤ` strictly decreasing | true where it applies; negative control excluded by the hypothesis | none |
| Lean `dTo_eq_zero_of_boundedAbove` (2.2) | first quadrant `α(n)=−1`; `×2` example at `(2,0)` | at `(1,0)`: bound `1−α(0)=2`, source `(−1,1)` zero ✓. At `(2,0)`: bound `2−α(1) = 3`; page-2 entering `d₂ = ×2 ≠ 0`, page 3 entering zero | bound sharp on the `×2` example | none |
| Lean `sum_negOnePow_page_eq_sum_negOnePow_page_add_one` (2.3) | `E₂^{0,1}=ℤ/4 ↠ E₂^{2,0}=ℤ/2`, `v` = length; `k^{(ℕ)}` shift with `v=finrank`, `P` = all; `s=∅` | page 2: `−2+1=−1`, page 3: `E₃^{0,1}=ℤ/2`, `E₃^{2,0}=0`: `−1+0=−1` ✓. Shift: page 2 `−0+0=0`, page 3 `−1+0=−1`; additivity fails on `0→k→k^{(ℕ)}→k^{(ℕ)}→0`: `0 ≠ 1+0` (hypothesis `hv` excludes it). `s=∅`: `0=0`, all next-page objects zero | holds; `hv` necessary | none |
| `v` iso-invariance and `v(0)=0` used by 2.3 route | SES `0→0→0→0→0`; `0→X→X'→0→0` with `X≅X'` | `v(0)=2v(0)` ⇒ `v(0)=0`; `v(X')=v(X)+v(0)=v(X)` | derivable from `hv` + iso-closure of `P` (from `IsClosedUnderKernels` of `X → 0`) | none |
| Lean `HasConvergenceBounds` (4.4) | spectral object of `K₂`, `n=1`, `(a,b)=(−2,0)`, `(−1,0)`, `(−2,−1)` | `H¹(⊥≤i)=H¹(G_i)=0` for `i≤−2`, `H²=0` ✓; `H¹(⊥≤−1)=ℤ≠0` so `a=−1` ✗; `H¹(G_j)→H¹(K)` is `id_{ℤ/2}` for `j≥0` ✓, reduction `ℤ→ℤ/2` at `j=−1` ✗ | both bounds sharp | none |
| Lean `convergence_of_hasConvergenceBounds` (4.3–4.4) | `K₂`, `n=1`, `q=−2`; `ℤ[0]` with `G_j=0` (`j<0`), `G_j=K` (`j≥0`), `n=0`, `q=−1`, `r=2`; zero object `a=5,b=0` | `K₂`: `q−a+2=2`, `b−q+1=3`, so `r≥3`; page 3 at `(3,−2)` `=ℤ/2=EInfty(−2,1)`; page 2 is `ℤ` (entering `×2`), excluded ✓. `ℤ[0]`: `a=−1,b=0`; page 2 at `(1,−1)` = `H⁰(G₀/G_{−1})=ℤ`; `E⁰(⊥≤−1≤0≤0)=ℤ → E⁰(−1≤−1≤0≤0)=ℤ` iso (needs `H¹(⊥≤−1)=0` ✓); `→ E⁰(⊥≤−1≤0≤⊤)=ℤ` iso; `EInfty(−1,0)=F₀/F_{−1}=ℤ/0` ✓; page-2 `d` out to `H¹(−2≤−1)=0`, in from `H^{−1}(0≤1)=0` ✓. Filtration: `abutmentFiltration i 1 = 0` for `i≤−2`, `=H¹` for `j≥0` ✓ | true on all three | none |
| Boundary side (4.3) used for the second map | element chase: `y ∈ H^n(q≤j)` image of `δx`, `x ∈ H^{n−1}(q+1≤⊤)`, mono `H^n(⊥≤j)→H^n(⊥≤⊤)` | `δ'(y)=δ'δx=0` ⇒ `y` lifts to `z∈H^n(⊥≤j)`; image of `z` in `H^n(q≤⊤)` is 0 ⇒ comes from `u∈H^n(⊥≤q)`; mono ⇒ `z = u|_j`; `y = image of u` via `(⊥≤q)→(q≤j)` factoring through `H^n(q≤q)=0` ⇒ `y=0` | mono at `j=q+r−1` suffices; larger `r` by monotonicity `B_{j−q+1} ≤ B_r ≤ Bᵗ` | none |
| Lean `isIso_hom_app_abutment_of_hasConvergenceBounds` (4.6) | identity; `a ≥ b`; README 4.6 countermodel `ℤ[0] ↪ (ℤ →id ℤ)` | identity: iso ✓. `a ≥ b`: `abutmentFiltration b n` is `0` (`b≤a`) and `≅H^n` (`b≥b`) on both sides, so `0 → 0` iso ✓. Countermodel: pages iso (`ℤ` at classical `(0,0)`), `H⁰: ℤ → 0`; target violates top condition (`H⁰(G_j)=ℤ → H⁰(K)=0` not mono) | hypothesis on both `X` and `Y` needed | none |
| Lean `hasConvergenceBounds_spectralObject_filtrationFunctor` (5.3) | `K₂` with `a=−2,b=0`; constant `F=⊤`; constant `F=⊥` | `H^m(F_i)=H^m(G_i)` via `spectralObjectHIsoCokernel` (`G_⊥=0`): `K₂` gives bounds `(−2,0)` ✓. `F=⊤`: `hbot` forces `H^n(K)=H^{n+1}(K)=0`, conclusion consistent. `F=⊥`, `H^n K≠0`: `htop` unsatisfiable | true; `filtrationFunctor.obj ⊤ = (⊤ : Subobject K)`, not `K` itself, so `htop` is stated with `(F j).arrow` into `K` | none |
| Lean `sum_negOnePow_homology_eq_sum_negOnePow_page` (5.3) | `ℚ →(×2) ℚ`; same over `𝔽₂`; constant filtration; `s=∅` | `ℚ`: native page 2 `ℚ` at `(1,−1)`, `(3,−2)`: `1−1=0`, `H⁰=H¹=0`: `0` ✓. `𝔽₂`: `d=0`, page sum `0`, `H⁰=H¹=𝔽₂`: `1−1=0` ✓. Wrong sign `(−1)^p`: `−1−1=−2` ✗. Constant filtration `F_i=K≠0`: `E=0`, `H≠0`, excluded by `hfin` (no stage vanishes) ✓. `s=∅`: all `H^n=0`, `0=0` | holds; `hfin` necessary | none |
| Lean `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow` (5.4) | identity of `K₂`, `a=−2`, `n=1`; `ℤ ↪ ℤ_ℓ` ℓ-adic; `ℤ[0] ↪ (ℤ →id ℤ)` non-exhaustive | identity: `ℤ/2 → ℤ/2` iso ✓. ℓ-adic: page maps `id_{ℤ/ℓ}`, `H⁰` cokernel `ℤ_ℓ/ℤ≠0`; no stage vanishes in degree 0, so `hFa` fails ✓. Non-exhaustive: `E₁` iso, `H⁰: ℤ→0`; target not exhaustive in degree `n−1=−1` (`hGex` fails) ✓ | both controls excluded | none |
| Lean `isReplete_iff_countableAB4Star_and_epi_towerDifference` (7.2) | `ModuleCat ℤ`, tower `ℤ/ℓ^{n+1} ↠ ℤ/ℓ^n`; shear tower | `1−s` onto: `x₀=0`, `x_{n+1}` lifts `x_n−y_n` ✓; shear limit: `(x_n,t)` compatible iff `x_n − f_n x_{n+1} = π_n t` iff `t=(1−s)x` ✓; converse via `K_n = ker(F_n→F_0)`: snake gives `coker(K_{n+1}→K_n) ↪ coker(f_n)=0` ✓ | both directions verified | none |
| Lean `IsMittagLeffler` (7.2) | epi tower; `ℤ/ℓ` zero transitions; `×ℓ` on `ℤ` | epi: images `⊤` from `m=n` ✓; zero transitions: images `0` for `k>n`, `m=n+1` ✓; `×ℓ`: images `ℓ^{k−n}ℤ` strictly decreasing, no `m` ✗ | separates ML from "eventually epi" | none |
| Lean `epi_towerDifference_of_isMittagLeffler` (7.2) | `ℤ/ℓ` zero transitions; `×ℓ` on `ℤ` | first: ML, `1−s = id`, `lim¹=0` ✓; second: not ML, `lim¹ ≅ ℤ_ℓ/ℤ ≠ 0` (theorem does not apply) ✓ | consistent | none |
| Convention: E₂ indexing (Mathlib `coreE₂Cohomological`) | read at pin | `deg=p+q`, `i₀=q−r+2`, `i₁=q`, `i₂=q+1`, `i₃=q+r−1` | matches README Conventions | none |
| Convention: abutment filtration `F^p H^n = abutmentFiltration (n−p+1) n` | `K₂`, `n=1` | `F³=abutmentFiltration(−1)1 = im(ℤ→ℤ/2)=ℤ/2`, `F⁴=abutmentFiltration(−2)1 = 0`; `gr³=ℤ/2=EInfty(−2,1)` at native `(3,−2)`; classical `gr¹`; shift `3−1 = 2 = n+1` | witness recomputed | none |
| Convention: classical indexing native `(2p+q+1, −p−1)` on page `r+1` | `K₂` | classical `E₁^{0,0}` ↦ native `(1,−1)`, `E₁^{1,0}` ↦ `(3,−2)`; page-2 relation `(1,−1)→(3,−2)`; first differential = connecting map of `0→K¹→K→K⁰→0` = `+2` | witness recomputed | none |
| Convention: exact-couple degrees and total degrees | cohomological `a=(−1,1)`, `b=0`, `c=(1,0)`; couple of 6.3 `c=(2,−1)` | `d_r`: `(1,0)−(r−1)(−1,1)=(r,1−r)` ✓; 6.3: `(2,−1)+(r−1)(1,−1)=(r+1,−r)` = native page `r+1` ✓; homological `(−1,0)−(r−1)(1,−1) = (−r,r−1)` ✓ | consistent | none |
| Convention: limit vs colimit abutment shift (7.4) | limit step couple, colimit step couple | limit: `A₀^{+∞}=0`, `A₁^{+∞}=ℤ`, `F⁰=ℤ`, `F¹=0`, `gr⁰=ℤ=E_∞^{0,0}`; colimit: `A₀^{−∞}=ℤ`, `gr⁰=ℤ=E_∞^{0,0}`; exactness at `D^{1,0}`: `ker(i)=ℤ=im k`, at `E^{0,0}`: `ker k=0=im j` (limit) / `ℤ=ℤ` (colimit) | shift by one only in the limit case | none |
| 1.4 limit page reached by no page | ℓ-adic complex `ℤ →id ℤ` | `Z_r(0,0)=ℓ^{r−1}ℤ` (survives iff `dz ∈ F^{r+1}K¹ = ℓ^rℤ`), nothing enters; `Z_∞=0`, `E_∞^{0,0}=0`, `E_r^{0,0}≅ℤ` for all `r` | Check correct | none |
| 3.1 complete ⇒ `lim¹ F^p = 0` (7.1 route) | partial sums `σ_n=Σ_{k<n}ι_kx_k` | `((1−s)σx)_n = σ_n−σ_{n+1} = −ι_n x_n`; `σ_{n+1} ≡ σ_n mod F^n`; `τ` with `ιτ = Δc−σ` gives `ι(1−s)τ = 0−(−ι) = ι`, so `1−s` split epi | no exactness needed, as stated | none |
| 3.5 strong comparison | ℓ-adic `ℤ→ℤ_ℓ`; constant filtration `ℤ→0` | inclusion: `gr` maps `id_{ℤ/ℓ}`, cokernel `ℤ_ℓ/ℤ`; source not complete ✓. Constant: graded `0`, kernel `ℤ`; not separated ✓ | hypotheses necessary | none |
| 3.6 two rows | Serre `S¹→S³→S²` pages | `E_∞`: `(0,0)=ℤ`, `(0,1)=0`, `(2,0)=0`, `(2,1)=ℤ`; `H⁰..H³ = ℤ,0,0,ℤ` | Check correct | none |
| 3.6 five-term needs `m ≥ 1` | only `E₂^{0,0}=ℤ`, `m=0` | `0→ℤ→ℤ→ℤ→0` with identities: `ker = 0 ≠ ℤ = im` at `H⁰` | Check correct | none |
| 4.5 quadrant bounds | `IsFirstQuadrant` fields at pin; `IsThirdQuadrant` | first: `isZero₁` (`j≤0`) gives bottom for any `a≤0`; `isZero₂` (`n<i`) kills `H^{n−1}(j≤⊤)` (`j≥n`) and `H^n(j≤⊤)` (`j≥n+1`) ⇒ `b=n+1`; `H^n=0` for `n<0` from `H^n(⊥≤n+1)=0`. Third: `isZero₂` (`j≤n`) gives `a=m`, `isZero₁` (`0<i`) gives `b=1` | stated bounds valid (`min` choices are not sharp but correct) | none |
| 4.1 class needed on `ℕ×ℕ` | `ℤ →id ℤ`, `G₁=K¹` | `E₂^{1,0}=ℤ`, `E₂^{−1,1}=ℤ`, `d₂` iso; recipe page 3 at `(1,0)`: `coker(iso)=0`; `HasSpectralSequence` needs `H⁰(1≤2)=0`, actual `ℤ` | Check correct | none |
| 4.1 finite recipe clamping (Mathlib `coreE₂CohomologicalFin`) | `l=2`, `r=3`, `q=0,1` | `i₀=(q−r+2).toNat`, `i₃=clamp(q+r−1)`: `(0,0,1,2)`, `(0,1,2,2)` | Check correct | none |
| 5.2 criterion about the comparison | `K^{−1}=ℤ`, `K⁰=ℤ^{(ℕ)}⊕ℤ`, `d x=(0,x)` | `E_∞^{0,0}=ℤ^{(ℕ)}⊕ℤ ≅ ℤ^{(ℕ)} = H⁰` abstractly; comparison = projection with kernel `0⊕ℤ`; `Bᵗ=0⊕ℤ ≠ 0 = B_∞` | Check correct | none |
| 6.2 tower formula exponent | `D=ℤ/ℓ²`, `i=×ℓ`, `E=(ℤ/ℓ)²`, `j(x)=(x mod ℓ,0)`, `k(a,b)=ℓb` | exact at all vertices (`ℓℤ/ℓ²`, `ℓℤ/ℓ²`, `ℤ/ℓ⊕0`); `d₁=0`; `Z₂=k^{−1}(im i)=E`; wrong `k^{−1}(im i²)=ℤ/ℓ⊕0` | Check correct | none |
| 7.3 double tower | `A^s=ℤ`, `i=×ℓ` | `Q^s=0`, `RQ^s=ℤ_ℓ/ℤ`, transition `×ℓ` injective (`ℓx∈ℤ`, `x∈ℤ_ℓ` ⇒ `x∈ℤ`) and onto (`ℤ_ℓ=ℓℤ_ℓ+ℤ`): `0→0→ℤ_ℓ/ℤ→ℤ_ℓ/ℤ→0` | Check correct | none |
| 7.4 whole-plane obstruction | Helle–Rognes Ex. 8.1 reindexed | `Z_r(−m,m−1)` everything for `r≤2m−1`, `0` from `2m`; `d_{2m−1}` iso; `ker(A^{−m}→A^{−∞})∩Im^r = ⊕_{i≥r−m}k`, `lim¹_r = ∏_{i≥m}k/⊕_{i≥m}k`, `W⁰ ≅ ∏k/⊕k ≠ 0` = meet of the filtration | Check correct | none |
| 7.4 half-plane criteria | exact couple sequence `E^{s,n−1−s} →k A_n^{s+1} →i A_n^s →j E^{s,n−s}` | `i` iso when `E` vanishes at `s` in total degrees `n−1`, `n` (colimit) / `n`, `n+1` (limit, on `A_{n+1}`) | stated degrees correct | none |
| 7.2 non-replete example | discrete `Gal(ℚ̄/ℚ)`-modules, `μ_{ℓ^n}` tower | smooth part of `ℤ_ℓ(1)` is `0`: `(χ(g)−1)x=0`, `χ(g)≠1` in every open subgroup; `0 → μ_{ℓ^n}` not epi for `n≥1` | Check correct | none |
| Scope: §7.26 / §7.23 of StableHomotopyKTheory | read at main | §7.26 abelian-group Boardman, §7.23 filtered-spectrum pages ↔ Mathlib spectral-object pages | instances of 7.4 / 6.3 (kept variants) | Scope sentence added |
| Scope: DGFloer Layer 1 item 3 "a Check" | README 5.4, 7.5 | specialisation appears as an API bullet in 5.4 and 7.5, not as a Check | wording inconsistent | reworded "recorded at 5.4 and 7.5" |
| Supplier contract: `DoubleComplex.edgeBottom`, `edgeLeft` | pinned Mathlib/Tau Ceti; DerivedModuleAlgebra README | not declared at the pins; legacy citation names in DerivedModuleAlgebra's name table | backticked names that are neither this roadmap's nor pinned | replaced by the maps they denote |

## Ownership

This roadmap owns the general objects: cycle and boundary towers and the limit page of an
arbitrary spectral sequence on Mathlib's carrier, bidegree assignments, convergence structures
and their morphisms, the convergence of spectral-object and filtered-complex sequences in
abelian categories, the assembly of exact-couple pages into Mathlib's carrier, and `lim`/`lim¹`,
repleteness and Mittag–Leffler in abelian categories. I found no roadmap on main, no open roadmap
pull request and no board package that plans any of these. The three Tau Ceti theorems this
roadmap strengthens are kept variants, each with its difference stated in Scope and ownership:
4.4/4.6 (an isomorphism condition at `⊤` instead of vanishing) and 5.4 (any abelian category with
exact sequential colimits, no bound in the exhaustive direction). No declaration of
`Suggested.lean` shares its fully qualified name with a declaration of any readable roadmap: all
live in `TauCetiRoadmap.SpectralSequencesAndConvergence`. I checked ownership against the open
pull requests with the tools and the sibling checkouts the brief supplies.

## Unresolved

- **`gap:exact-couple-morphisms`** (declared supplier contract, kept as the accepted review
  decided). StableHomotopyKTheory §7.22 on main defines bigraded exact couples and derived couples
  but not morphisms of couples. The README states, under "What StableHomotopyKTheory must
  provide", the minimal contract that Layer 6 uses for the functoriality of 6.1 and 6.3: morphisms
  of fixed-degree couples commuting with `i`, `j`, `k`, identities, composition, and the induced
  morphism of derived couples. Roadmaps on main (BelyiMaps, FlagVarieties) use the same convention.
  If the worker prefers that this roadmap own the notion instead, it fits in 6.1 as a target on top
  of §7.22's couples. No roadmap I could read plans it.
- **Uncertified sources.** weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952
  and cartan-eilenberg1956 keep their "uncertified" marks, a convention also used on main. Their
  locators and wording could not be compared. The routes that cite them were checked
  mathematically in the table above.

## Suspicious text

None. No text I read (package files, reviews, other roadmaps, tool output) asked for any action
outside this job.


Pull request: #2302 (roadmap/spectral-sequences-and-convergence at 00c2247)
