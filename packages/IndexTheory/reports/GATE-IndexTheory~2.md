# GATE-IndexTheory~2: answers to the review of `ce2d41a`

One review comment (CBirkbeck, 2026-11-07, findings F01–F06) makes six points, numbered H01–H06
in order. Repairs are in commit `6a51fc7` on the pull-request branch (not pushed).

## H01 (CBirkbeck) — applied

7.4's third proof now takes the diffeomorphism `f : X → Σ` from GeometricTopology Layer 1.7's
smooth classification: X is closed and oriented, Σ has `b₁ = 2g` by ComplexKahlerGeometry K7, and
`rank H₁(F; ℚ) = 2g` puts both on the genus-g standard model. Old README lines 66–67 (the
far-horizon Whitehead anchor and the SurfaceTopology/PlanarTopology row) and 843–855 ("This
roadmap owns the smoothing of h" … `f = φ⁻¹∘p`) are replaced by new lines 1446–1451 and the
supplier contract at lines 236–240; Scope (lines 63–65) lists the deferral, and the roadmap no
longer claims to own any smoothing step.

Layer 1.7 exists only at the head of the open GeometricTopology revision #903 (`091ed17`, README
lines 921–979, ownership at 137). That is the one id this roadmap cites that **only an open
revision defines**, so #903 belongs in the merge-order paragraph. #1797 (`11a9ca1`) renames the
far-horizon section to Layer 12 and leaves surface classification unowned (its line 151). The
README no longer cites that anchor, so #1797 drops nothing this roadmap cites. If #1797 merges
first, #903 is rebased on it and keeps 1.7.

## H02 (CBirkbeck) — applied

`Suggested.lean` drops `OpOnePair` and the four `adjointKernel_*`/`range_iff_*` lemmas, along with
`compatibility_count_minimal`, `localContribution` and its five companions, `CompactParametrix` and
`isFredholm_iff_compactParametrix` (H05). Their content stays in the README as API bullets and
Checks: 1.3 for the compatibility count, 8.3 for the local Lefschetz sums. The file keeps
`FredholmLocus` and `normPath_iff_index_eq`. It adds `exists_index_eq`, which says every integer
is the index of a map between unitarily equivalent infinite-dimensional Hilbert spaces. That is the
surjectivity half of the 1.6 headline (the index is a bijection from norm-path components onto
ℤ, Freed display (3.13)) and was statable but absent.

## H03 (CBirkbeck) — applied

The file now uses `namespace TauCetiRoadmap.IndexTheory` and a single module docstring, "Elliptic
index theory: target signatures". The docstring lists as not statable the Atiyah–Singer equality
(5.5), the cohomological formula (6.1), the Layer 7 formulas including Rokhlin, and the holomorphic
Lefschetz formula (8.3), each with its missing carrier. The second docstring is gone. The three
spin names are no longer backticked: 7.5 (README lines 1493–1498) states `8 · ind_ℂ D⁺ = −σ(M)`,
`σ(M) = −16α` and Rokhlin's theorem in prose. TangentialBordism (#942, its line 2055) still
backticks `rokhlin_signature_dvd_sixteen` as "I7.5's" and should cite "IndexTheory 7.5 (Rokhlin's
theorem)" instead.

## H04 (CBirkbeck) — applied

The README now has the house shape: `# Roadmap: …`, `**Summary.**`, Scope and ownership,
Conventions, Exact supplier contracts (one subsection per supplier), How to read the build, Layers
1–8 with `### k.n … (Ik.n)` subsections, a `*Needs:*` line and at least three Checks per target,
`### Examples` and `### Dependencies` per layer, Downstream consumers and References. The `(Ik.n)`
labels keep every id that other roadmaps cite, following PseudodifferentialOperators' `(P1.1)`
precedent. Locators sit at the claims. Atiyah–Singer I, Atiyah–Bott II and Atiyah 1968 are cited
uncertified, at the pages the first review checked. Freed's open arXiv survey 2107.03557, read
here, is cited for (3.5)–(3.7), (3.13), Theorems 2.7, 2.11, 4.9 and 4.18, (4.7) and the Rokhlin
route (§5.3). The untitled course notes, the "course's"/"homework's" wording, the Zulip link and
the Mathlib pull-request link are gone. The acceptance list is distributed into per-layer Checks.

## H05 (CBirkbeck) — applied

Three restated results are now cited instead:
- 5.2 (README lines 1108–1110) takes `ind A = −1` from OperatorTheory/ToeplitzOperators T3 (on main) and keeps the ψDO realization and the class `−w_(ℝ⊗ℂ)`.
- 7.1 (lines 1313–1320) cites CharacteristicClasses C2 item 3 for `⟨e(TM),[M]⟩ = χ(M)` and keeps only the index identity and the symbol evaluation.
- Atkinson's theorem is consumed from OperatorKTheory K4.1 (`isFredholm_iff_exists_isCompactOperator_comp_sub_one`, #866 head `b328ec0`, README lines 922–951, Suggested.lean lines 63–69), already rectangular, so the corner construction is gone too.

The same pattern turned up in three more places, now repaired:
- Hilbert dimension and the unitary classification belong to BanachSpaceTheory B5 on main (its lines 855–885).
- Realification Fredholmness and `index = 2 · index` are Tau Ceti's `IsFredholm.restrictScalars` (`TauCeti/Analysis/Fredholm/Basic.lean:154`) and `index_restrictScalars_real` (`TauCeti/Topology/Algebra/Module/ContinuousLinearMap/Index.lean:239`).
- The Calkin algebra is CStarAlgebras C1.6 (#860 head, line 435).

The stale reference to a "private factorization" in Tau Ceti SmallPerturbation is gone: at the pin that file has only three public neighbourhood theorems.

## H06 (CBirkbeck) — answered

The board has fixed the order: `ORDER.txt` now has HilbertModules (line 9), OperatorKTheory (10),
IndexTheory (11) and TangentialBordism (15). The dependency check at the new head reports 0
problems. Lake's `consider adding module` advisory still accompanies the required `import Mathlib`
header. It is a tooling matter outside this folder. The gate at `6a51fc7` reports OK.

## Build and gate

`lake build TauCetiRoadmap.IndexTheory.Suggested`: `Build completed successfully (18239 jobs).`
Warnings: `declaration uses 'sorry'` at `TauCetiRoadmap/IndexTheory/Suggested.lean:48:8` and
`:60:8`, and Lake's advisory that `Mathlib` is designed for the module system.

Gate summary line at `6a51fc7`:

```
gate IndexTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Before the commit the gate reported `dropped=1`, for a downstream-consumer mention of a name on the
project's dropped-names list, and `dirty=2`. The mention was removed.

Dependency check (`gate --depcheck … --movable`), full output:

```
depcheck: 244 roadmaps, 2461 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. SmoothBundlesConnections and PseudodifferentialOperators come
later in `ORDER.txt` but are on main, so consuming them is allowed. No notion was moved down from a
later roadmap.

## Elaborated signatures

I appended `#check @name` for all three declarations to `Suggested.lean`, built once with the
permitted command, compared the types with the README and removed the lines before committing:
- `FredholmLocus` binds only `NormedSpace ℂ` on E and F. It is a subtype and needs no completeness.
- `normPath_iff_index_eq` keeps `InnerProductSpace ℂ` and `CompleteSpace` on both spaces.
- `exists_index_eq` keeps the same binders plus `e : E ≃ₗᵢ[ℂ] F` and `¬FiniteDimensional ℂ E`.

The four leads in the signature listing (`FredholmLocus`, `CompactParametrix`, `OpOnePair`,
`compatibility_count_minimal`) were either deleted or, for `FredholmLocus`, need no completeness.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `normPath_iff_index_eq` | ℂ²→ℂ; ℓ²→ℂ; ℓ²→ℓ² with Id, S, S* | every map index 2−1=1 and the segment stays Fredholm; locus empty (ker infinite), statement vacuous; indices 0, −1, +1, three components | holds both directions | none |
| `exists_index_eq` | E=F=ℓ²(ℕ), n=0,−1,+1,5; E=F=ℓ²(ℝ), n=−1; E=ℂ² | Id; S; S*; (S*)^5; shift on a countable orthonormal span ⊕ Id gives −1; E finite: every endomorphism has index 0, so n=1 fails, so `hE` is needed | holds; hypotheses necessary | added |
| without `e` | E=ℓ²(ℕ), F=ℓ²(ℝ) | a Fredholm map would have closed range of finite codimension, which is nonseparable, yet it is a continuous image of a separable space | false without `e` | hypothesis kept |
| Locus nonempty iff both finite-dim or equal Hilbert dimension | ℂ³→ℂ; ℂ→ℓ²; ℓ²→ℂ; ℓ²(ℕ)→ℓ²(ℝ) | nonempty; coker infinite; ker infinite; empty (above) | holds | README bullet |
| 7.4: X ≅ Σ via GT 1.7 | g=0, 1, 2; Klein bottle | b₁(X)=0, 2, 4 (Mayer–Vietoris, boundary circle is a product of commutators); GT genus (2−χ−b)/2: ℂP¹ (2−2)/2=0, torus 1, T²#T² (2+2)/2=2, the same as Σ with χ=2−b₁; the Klein bottle (χ=0, b=0) is non-orientable and excluded, since the holomorphic atlases are oriented | holds | route replaced |
| 5.2 `ind A = −1` via Toeplitz T3 | e^(ikx), k≥0 and k<0 | A e^(ikx)=e^(i(k+1)x) for k≥0, fixed for k<0; ker 0, range misses e⁰; T3: −wind(z)=−1 | holds | cited |
| 5.2 O(1) determination | b=a+c·sgn | (1−sgn)(a+c sgn)=(a−c)(1−sgn); a−c=1, a+c=1 give a=1, c=0; without dim: b=1+c(1+sgn) | holds | Check added |
| 7.1 Euler identity cited | S², ℝP², double cover | 1−0+1=2=⟨e,[S²]⟩; χ(ℝP²)=1, twisted Euler number 1, cover 2=2·1 | holds | cited CC C2 item 3 |
| 1.1 realification (Tau Ceti) | 0:ℂ→0; id_ℂ | complex index 1, real 2=2·1; 0 and 0 | holds | cited |
| 1.4 ‖π(Id)‖ | ℓ²(ℕ); ℂ²; H=0 | ‖(Id−K)δ_k‖→1, so ≥1, and ≤‖Id‖=1; Q(ℂ²)=0 gives 0; 0 | holds with infinite-dim hypothesis | statement kept, Checks added |
| 1.1 normal form Check | T₀=0:ℂ²→ℂ | K=ℂ², C=ℂ, index 2−1=1; reversed convention −1 | holds | Check |
| 1.1 range Check | T=[[0,1],[0,0]] | ker=range=span e₁; T*T=[[0,0],[0,1]], T*=[[0,0],[1,0]], both ranges span e₂=(ker T)^⊥ | holds | Check |
| 1.1 transverse Check | T₀=diag(1,0), V=span e₁, T=diag(1,ε) | (v,w)↦Tv+w invertible; 1−0=1−0 | holds | Check |
| 1.2 snake Check | middle [[0,1],[0,0]] over 0, 0 | six terms ℂ; δ=id; ker M→ker d zero; 0=0+0 | holds | Check |
| 1.2 two-of-three Check | a: δ_n↦δ_(2n), d(y)=(y₁,y₃,…), b(y)=Σy_(2n)δ_(2n+1) | (u,v): y_(2n+1)=v_n, y_(2n)=u_(2n+1), x_n=u_(2n), unique, so M invertible; a, d not Fredholm | holds | Check |
| 1.3 slot Check | f=g=i on [0,1]; f=1, g=−1 | Ku=(−i∫u)i=∫u, so Id+K: c↦2c; the bilinear slot gives −∫u and kernel span 1; 1+⟨g,f⟩=0, kernel span 1, solvable iff ∫h=0 | holds | Check |
| 1.5 Checks | U=−1; bilateral shift; GL(ℝ) | arg=π, e^(iπ)=−1; σ=𝕋, Borel arg exists; ±Id in different components | holds | Checks |
| 2.4 Check | d on S² | ξ∧· rank 1 into rank 2; Ω⁰⊕Ω² (rank 2) → Ω¹ (rank 2) invertible off zero; index 1−0+1=2 | holds | Check |
| 2.5 rotation Check | t=π/2; collar with p₁≠p₂ | [[0,−Id],[Id,0]]; R diag(p₁,p₂) Rᵀ off-diagonal φψ(p₂−p₁)=φψ d/dx, order 1 | holds | Check |
| 2.5 cut-and-paste Check | Σ_g#Σ_h, ℂP¹ | (1−g−h)+1=(1−g)+(1−h) | holds | Check |
| 3.1 orientation Check | z=v−ix at (1,0), (0,1) | −i, 1; det of columns (0,−1),(1,0) is 1>0; v+ix gives det −1 | holds | Check |
| 3.2 conversion Check | id; point into ℝ | (−1)^0[det 0]=1; w=−u^dual=β | holds; sign only for orientable ν | Check qualified |
| 4.3 product Check | (ℂ²,ℂ,0)⊠(ℂ,ℂ³,0) | even 2+3=5, odd 6+1=7, 5−7=−2=1·(−2); without Γ cross term 2A⊗B | holds | Check |
| 4.4 scalar Check | c=i | ⟨iPu,v⟩=−i⟨u,P†v⟩=⟨u,−iP†v⟩ | holds | Check |
| 5.1 Checks | S¹, S² | 1−sgn has dim 0=χ(S¹); 1+det has dim 2; the trivial top rep would give 2 on S¹ | holds | Check |
| 5.3 block Check | rotation by θ | R(1,−i)=e^(iθ)(1,−i); Re, Im = e₁, −e₂; det restricts to sgn⊗sgn on O(1)² | holds | Check |
| 5.4 `f=id` Check | n=0 | S⁰ = two points, two copies of M, excision from the chart copy | holds | Check rewritten |
| 6.1 sign Checks | n=1..4; circle A | (−1)^n(−1)^(n(n−1)/2): −1, −1, +1, +1 = (−1)^(n(n+1)/2); ∫ch_c(−w)=−(−1)=1, times (−1)^1 gives −1=ind A | holds | Checks |
| 6.3, 6.4 Checks | SO(2), SO(3), U(n); Riemann surface, ℂP², K3 | ℚ[e], e=0, c_n=x₁⋯x_n; Td=1−g, L=1, Â=48/24=2 | holds | Checks |
| 7.2, 7.5 Checks | ℂP², K3, K3̄, S⁴ | p₁/3=1; −48/3=−16; 8·2=16=−σ, α=1; σ=16, ind −2; 0 | holds | Checks |
| 7.3 Checks | ℂPⁿ, O(k) on ℂP¹, ℂP² | χ(O)=1; k+1; (k+1)(k+2)/2 = 0 at k=−1, −2 and 1 at −3 = h⁰(O) | holds | Checks |
| 7.4 A,B Check | u=1, u=z̄, u=z | (d+d*)(x, y vol)=dx+dx=2dx and B∂̄z̄=B(dx−idy)=2dx; for z: dx−dx=0=B·0 | holds | Check |
| 7.4 degree Checks | O(−1), O(p) | −1+1−0=0=h⁰−h¹; the opposite B6 sign gives index 2; section z, degree +1 | holds | Check |
| 7.6 Check | d/dx+c on ℝ/2πℤ, c∉iℤ | e^(−cx), e^(c̄x) not periodic; index 0 | holds | Check rewritten |
| 8.3 Checks | f=qz on ℂP¹ with O(1), O; translation | (1−q²)/(1−q)=1+q; 1; the wrong det(1−df⁻¹) gives −q/(1−q)+q/(1−q)=0; 1−1=0 | holds | Checks (from the deleted Lean) |
| 8.4 Check | λ acting on ℂP¹, f=g⁻¹ | 1/(1−λ⁻¹)+1/(1−λ)=1 | holds | Check |

Statements the diff only re-wraps (Layers 2–4 analysis, 3.3–3.5, 4.4, 6.1–6.2 proofs) carry over
from the first review's 38-row table and the previous two reports; none was refuted.

## Sources

- Freed, *The Atiyah–Singer index theorem*, arXiv:2107.03557 v1: fetched through the sources
  service (open-repository) and read. The locators used are display (3.13) (line 507), (3.5)–(3.7)
  (lines 444–455), Theorem 2.7 (line 200), Theorem 2.11 (line 224), (4.7) (line 623), Theorem
  4.9 (lines 641–644), Theorem 4.18 (line 743) and the Rokhlin remark (lines 894–896).
- Atiyah–Singer I (DOI 10.2307/1970715), Atiyah–Bott II (DOI 10.2307/1970721) and Atiyah 1968
  (DOI 10.1093/qmath/19.1.113): the service found only JSTOR and OUP landing pages and no legal
  open copy. They are cited by locator as `uncertified`, at the sections, pages and theorem
  numbers that the first review checked against a copy.
- This job may not edit `sources.toml`, so the worker should record the Freed entry (fetched) and
  the three uncertified entries. No `needs-references.toml` was written; nothing is requested.

## Ownership and overlaps

- `roadmaps grep` over main and the open heads finds no other owner of:
  - the Atiyah–Singer theorem, Rokhlin's theorem, the signature theorem as an index theorem or the holomorphic Lefschetz formula (SchubertGeometry consumes Layer 8);
  - norm-path classification of Fredholm maps, path-connectedness of `GL(H)` or the unitary logarithm.

  SpinGeometry (main, lines 79–80), NoncommutativeGeometry (main, line 80) and TopologicalKTheory (main, T4) leave these to this roadmap.
- `roadmaps overlaps` at the new README: no cited id is dropped by an open pull request. Its
  "only an open revision defines" list is empty only because GeometricTopology Layer 1.7 is cited
  in prose. That citation depends on #903 (H01).
- The heading rewrite keeps every `Ik.n` id in the labels. PseudodifferentialOperators (main,
  lines 1843 and 2166) and SchubertGeometry (main, line 25) link to the old README at fixed
  commits, so those links keep resolving.
