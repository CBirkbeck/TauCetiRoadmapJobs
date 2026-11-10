# Review of ReductiveGroups (pull request #1332 at a9e6e77)

**Verdict:** accepted

Full review of `TauCetiRoadmap/ReductiveGroups/README.md` (5084 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (446 lines: 23 declarations, 12 `sorry`'d theorems) at `a9e6e77`. No finding. The four findings of the previous review (at `9ca8df8`) are repaired, the gate, the dependency check and the build pass, and the seeded sample verifies against the texts.

## Previous findings (review of `9ca8df8`)

| Previous | Status at `a9e6e77` | Evidence |
|---|---|---|
| R01 (P2), §6B headline statable, connected case proved at the pin | Repaired | `Suggested.lean:199` states `AffineQuotients.isIso_fppfHomogeneousQuotientToCoinvariantsPoints` with the hypothesis on `I.identityComponent`. `README.md:1835–1866` cites the native comparison map and the two native isomorphism theorems ("neither is proved again here") and keeps as its target linear reductivity of `H` when `H⁰` is reductive and `H` is not connected. The contract is at `README.md:392–414`. The docstring sentence "lacks the comparison …" is gone. |
| R02 (P2), §7.2 Levi complement statable | Repaired | `Suggested.lean:243` states `ParabolicLevi.exists_levi_complement` on `TauCeti.HopfIdeal.IsParabolic`. `README.md:266–288` cites the predicate and the dynamic representability, coordinate, quotient and smoothness declarations with their files; `README.md:1991–2022` uses `IsParabolic` as the definition, keeps "smooth with `G/P` proper" as an equivalence to prove, and consumes the dynamic declarations. |
| R03 (P3), four theorems proved at the pin | Repaired | The four theorems are deleted from `Suggested.lean`; its docstring (lines 37–41) names them as cited. `README.md:250–255` (Borel conjugacy, "with no further hypothesis"), `:289–314` (orbits), `:327–335` (characteristic-zero equivalence), §§3A.3–3A.4 ("This section proves nothing further"), §6.2 and §7.1 are reduced to the citations. |
| R04 (P3), carriers the pin has | Repaired | The five orbit definitions and three point-topology definitions are deleted. `orbit_locallyClosed` (`Suggested.lean:113`) is on `TauCeti.SchemeAction.orbit`; `compact_complexPoints` (`:131`) is on `TauCeti.SchemePointTopology.topology`. `README.md:20–25` moves ownership of both carriers to Tau Ceti; §3A.1 and §3A.5 say "No second orbit carrier is defined here" and "No second topology is defined here". |

## Verified sound

### Gate, dependency check, build, signatures

- **Gate** (the worker's run at this head): every check 0, including `build=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`.
- **Dependency check** (my run): `depcheck: 233 roadmaps, 2258 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- **Build:** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0 with exactly 12 `declaration uses 'sorry'` warnings (lines 113, 131, 147, 171, 199, 221, 243, 268, 362, 393, 400, 437) and nothing else.
- **`#check @` pass on all 23 declarations** (scratch file importing the built module; no error). Each elaborated type equals its README statement and no theorem lost a binder. The worker's `signatures.md` fails on seven names because it does not qualify them; this pass replaces it.
  - `orbit_locallyClosed`: `Field k`, `GrpObj G`, `ModObj G X`, finite type and quasi-compactness of both; no `IsAlgClosed`, no smoothness.
  - `AffineQuotients.…`: `IsAlgClosed k`, `CharZero k`, reductivity of `H.quotient I.identityComponent`. README §6B has the same field hypotheses.
  - `ParabolicLevi.exists_levi_complement`: any field, `reductiveCommHopfAlgProperty k H`, `IsParabolic k H.obj I`; the ideal `J` lives in `H.quotient I`.
  - `lang_surjective`: `Finite k`, `IsAlgClosed K`, `hF : ∀ a, F a = a ^ Nat.card k`.
  - `nonempty_mulEquiv_artinGroup`: `Finite Λ`, `IsModuleTopology ℂ M`, `FiniteDimensional ℂ M`, `IsCrystallographic`, `IsReduced`.
  - `PBWExponent` does not mention `L` or `IsCrystallographic`; its type needs neither.
- **Padding probe.** In a scratch copy every `sorry` was replaced by `first | rfl | trivial | infer_instance | decide | simp | aesop | sorry`: all 12 theorems keep their `sorry`. `exact …_of_reductive I hred` on the §6B headline fails with a type mismatch (`H.quotient I.identityComponent` against `H.quotient I`), so the headline is not the native theorem. The native torus conjugacy (`Torus/Conjugation.lean:149`) still has its containment hypotheses, and the native Nagata statement (`Solvable/LinearlyReductive.lean:86`) is for reduced connected solvable groups over an algebraically closed field.

### Headlines

README headlines: local closedness of orbits over any field, compactness of proper complex points, Nagata, the Mostow Levi complement, affine quotients (§6B), torus conjugacy, parabolic Levi complements (§7.2), Lang, integral PBW, Artin, braid nonsplitting, Brieskorn. All 12 are stated. The four that the pin proves are cited, not stated. For the endpoints the module docstring lists as not statable (relative centre over a base ring, root datum of an arbitrary split group and Bruhat, Harish–Chandra functors, distributions, highest-weight modules, generator-characterized Artin and Brieskorn isomorphisms, smooth charts on scheme points) the reasons were checked at this pin in the previous review, and the pin has not moved.

### Library declarations opened at the pin (Tau Ceti, paths under `TauCeti/`)

Every native declaration that the repair added to the README was looked up at the pin (39 names) and exists in the file the README gives. Opened in full:
- `HopfIdeal.IsParabolicOverAlgClosed` and `HopfIdeal.IsParabolic` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean:82, 248`): algebraically closed, smooth quotient algebra, and `I ≤ J` for some Borel `J`; the general predicate is this after base change to `AlgebraicClosure k`. It does not include connectedness of the ambient group or properness of `G/P`; `isParabolic_bot_iff` (`:385`) makes `P = G` parabolic exactly when `G` is smooth.
- `HopfIdeal.identityComponent` (`HopfIdeal/IdentityComponent.lean:49`): under `[IsAlgClosed k]`, as the README says.
- `fppfHomogeneousQuotientToCoinvariantsPoints` and the two isomorphism theorems (`Fppf/Quotient/Homogeneous/Coinvariants.lean:111, 219, 255`): the linearly reductive one needs `Algebra.IsGeometricallyReduced k H`; the reductive one needs `CharZero` and gets reducedness from Cartier. `coinvariantsPointsHomEquiv` (`:163`), `fppfHomogeneousQuotientBaseChangeIso` (`Homogeneous/BaseChange.lean:73`, any field extension), `isPullback_fppfHomogeneousQuotientTorsor` (`Homogeneous/Torsor.lean:160`), `finiteType_coinvariants_of_isLinearlyReductive` (`HopfIdeal/Coinvariants/InvariantTheory.lean:62`).
- `IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`: no extra hypothesis) and `IsBorelOverAlgClosed.exists_le_conjugate_of_isBorelCandidate` (`Borel/Conjugacy/Containment.lean:47`).
- `SchemeAction.isLocallyClosed_orbit`, `isClosed_orbitBoundary`, `topologicalKrullDim_orbitBoundary_lt` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:177, 198, 213`: `IsAlgClosed`, finite type, compact underlying spaces; no smoothness, no separatedness); `exists_isClosed_orbit_subset_orbitClosure`, `topologicalKrullDim_orbit_lt_of_mem_orbitBoundary`, `exists_isClosed_orbit` (`GroupAction/ClosedOrbit.lean:150, 119, 178`, the last with `[Nonempty X.left]`); `isProper_orbitToBase_iff`, `exists_isProper_orbit_subset_orbitClosure` (`GroupAction/Orbit/Proper.lean:90, 96`, under `IsProper X.hom`); `orbitScheme`, `orbitBaseChangeIso`; `orbitMap` (`CategoryTheory/Monoidal/Cartesian/Action.lean:41`).
- `SchemePointTopology.affineHomeomorph` (`Topology/Algebra/PointTopology/Scheme.lean:165`), `PointTopology.isClosedEmbedding_eval_generators` (`Topology/Algebra/PointTopology/Basic.lean:245`).
- `Cocharacter.parabolicDefiningHopfIdeal`, `parabolicPointsIso` (`Dynamic/Representability.lean:98, 152`), `leviDefiningHopfIdeal`, `parabolicCoordinateAlgEquiv`, `parabolicLeviFppfQuotientIso`, `smoothCommHopfAlgProperty_quotient_parabolicDefiningHopfIdeal` (`Dynamic/Smooth.lean:212`: Noetherian base ring, smooth ambient group of finite type).
- `reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Reductive/CompleteReducibility.lean:118`).

The 17 "found nowhere" names of the worker's citation list are this file's own declarations plus the InductionRestriction target `Gassmann.almostConjugate_iff_permutation_equiv`.

### Seeded sample (all verified in the texts)

Milne 2017 is read in the author-page copy in the sources cache (printed page = PDF page − 12).
- **0.1:** §3.5, p. 66 (cache line 3053).
- **1.0a, 1.1, 2.1, 3.1, 4.2, 4.3, 5.2, 6.1, 7.3, 11.0:** unchanged text; locators as verified at `9ca8df8` (Remark 4.1 p. 84; `jantzen-1985` I.3.3 p. 52, I.3.9 p. 60, I.4.14–4.16 pp. 77–79; 10.14 p. 190, 10.23 p. 193; Theorem 5.13 p. 101, Proposition 5.18 p. 103; 12.3 p. 231, Remark 12.5 p. 232; 12.17 p. 236, 12.23 p. 240; 14.8 p. 282, 19.9 p. 399; 19.1–19.13 pp. 397–400; 21.12 p. 430, 21.75 p. 448, 21.80 p. 450; `sga1` XII 1.1 p. 239).
- **7.2:** Definition 17.15 and Theorem 17.16, p. 356 (lines 14605, 14608: parabolic means `G/P` complete; equivalent to containing a Borel subgroup); `conrad-feng` §6.3 from line 2229, Levi statement lines 2397–2401, p. 58; Proposition 12.3.1, p. 127.
- **7.1 (new route):** Theorem 16.33(d), pp. 335–336 (lines 13793–13808: over an algebraically closed field `G = G_u ⋊ T`, and subgroups of multiplicative type are conjugate into `T` by `G_u(k)`).
- **8.1:** Theorem 23.25, p. 492 (line 20291); Remark 23.26, p. 493 (line 20303); Theorem 23.55, p. 501 (line 20614); `conrad-rgs` Theorem 6.1.17, p. 197 (line 8173).
- **8.2:** `conrad-rgs` Definition 3.1.1, p. 81 (line 3334: smooth `S`-affine with connected reductive geometric fibres); Proposition 3.1.9, p. 85; Corollary 3.1.11, p. 88; Theorem 3.2.6, p. 94; Theorem 3.3.4, p. 98; Theorem 5.2.11, p. 157; Theorem 5.3.1, p. 160.
- **8.3:** Proposition 19.9, p. 399 (line 16386); 6.47, p. 136 (line 5770).
- **6B:** `arzhantsev` Proposition 2.2, p. 2 (line 49), over an algebraically closed field of characteristic zero (lines 38–39).

### Cross-roadmap and overlap checks

- `roadmaps grep` over main and the open heads: no roadmap cites any of the Lean names this head deleted, and no other roadmap states the §6B or §7.2 headline or declares `IsParabolic`, `SchemeAction.orbit` or the fppf coinvariant comparison. FormalConnectionsOpers and SchubertGeometry cite `TauCeti.SchemePointTopology` as a Tau Ceti object, in agreement with the new scope sentence.
- `scratch/overlaps.md` lists no dropped or revision-only id. The four conflicting heads (#1676, #1807, #1808, #1854) are ordered in the description's merge-order block.

### Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 points | constant `S₃`; `𝔾ₘ` at 2 over `ℚ`; zero algebra | `(12)(23)=(123)`, `(23)(12)=(132)`; `t↦2`, `t⁻¹↦1/2`, swapped by inversion; one point | holds | none |
| 1.0a comodules | `𝔾ₘ` weight 3 at `a=2`; weights 1 and 2 | 8; `2·4=8` | holds | none |
| 1.1 Hochschild, induction | `𝔾ₘ` weight one; trivial subgroup of `C₂` over `ℤ` | `d⁰(1)=1⊗(t−1)`; `ℤ⊗ℤ²=ℤ²` | holds | none |
| 2.1 Lie | `SL₂`; Frobenius on `𝔾ₘ` in char `p` | `[E₁₂,E₂₁]=diag(1,−1)`; `d(tᵖ)=0` | holds | none |
| 3.1 quotients | `(t−2)` in `ℚ[t,t⁻¹]`; `μ₂` in char 2 | `ε(t−2)=−1≠0`, not a Hopf ideal; `t²−1=(t−1)²` | holds | none |
| 4.2 diagonalizable | character 3 on cocharacter −2; `M=ℤ/p` in char `p` | `t↦t⁻⁶`; `k[u]/(uᵖ)`, not smooth | holds | none |
| 4.3 lattices | `𝔾ₘ`; real norm-one torus; `μₚ` | `⟨3,−2⟩=−6`; `X^Γ=0`, rank 1; `X=ℤ/p`, `X_*=0` | holds | none |
| 5.2 radical | `𝔾ₐ`; `𝔾ₘ`; `Res_(K/k)𝔾ₘ`, `[K:k]=p` | ideal 0; `(t−1)`; `k`-radical of dimension 0, geometric `p−1` | holds | none |
| 6.1 radicals | `𝔾ₐ`; `𝔾ₘ`; `SL₂` in char 2 | dims `(1,1)`; `(1,0)`; centre `k[t]/((t−1)²)` | holds | none |
| 7.1 torus conjugacy (headline) | `SL₂` diagonal torus and its conjugate by `I+E₁₂`; `SL₂` over `ℝ`; `μₚ×𝔾ₘ`; `𝔾ₐ` | `g=I+E₁₂`; excluded (real against non-real eigenvalues); unique torus; trivial torus, `g=1` | holds | none |
| 7.2 Levi (headline) | upper Borel of `GL₂`; `P=G`; `J=` augmentation ideal as wrong model | right `U`-invariants of `k[a^±,b,d^±]` are `k[a^±,d^±]` (`b↦au+b`), `J=(b)` gives the identity; radical trivial, `J=0`; `O(P)/J=k`, composite not injective | holds | none |
| 7.2 conventions | `(I+aE₁₂)diag(s,t)(I−aE₁₂)`; `λ(t)=diag(t,1)` | upper entry `a(t−s)`; `E₁₂↦tE₁₂`, `E₂₁↦t⁻¹E₂₁` | holds | none |
| 7.3 roots, Bruhat | `SL₂`; `GL₂(𝔽_q)`; `𝔾ₘ` | `⟨α,α∨⟩=2`; cells 1 and `q`, 3 points at `q=2`; `Φ=∅`, `W=1` | holds | none |
| 8.1 classification | `GL₂` with `diag(2,1)` over `ℚ`; `SL₂` against `PGL₂`; ranks 0 and 1 without roots | `I+aE₁₂↦I+2aE₁₂`; `α(diag(t,t⁻¹))=t²` against primitive; `1` and `𝔾ₘ`, dimensions 0 and 1 | holds | none |
| 8.2 relative | `SL₂` over `ℤ` at 2; `GL₂` over `k[x₁,x₂,…]`; `Spec 0` | centre `𝔽₂[t]/((t−1)²)`, length 2, tangent dimension 1; `ℙ¹(𝔽₂)` has 3 points; relative dimensions 1, 3, 1; empty group (nonempty base needed) | holds | none |
| 8.3 pseudo-reductive | `𝔽₂(t)(√t)`; `𝔽₃(t)(t^(1/3))`; `K=k` | `(1+aε)(1+bε)=1+(a+b)ε`, kernel dimension 1; `ε²`-coordinate `b+d+ac`, dimension 2; kernel 1 | holds | none |
| 11.0 cotangent | `𝔾ₘ`; `u=2t` | `D(t⁻¹)=−1`; `2·(1/2)=1` | holds | none |
| `orbit_locallyClosed` | `μ₃` on `𝔸¹` over `ℝ` at 1; constant `ℤ` on `𝔸¹` over `ℚ`; `𝔾ₘ` on `𝔸¹` at 1 and 0 | `t³−1=(t−1)(t²+t+1)`, closed two-point orbit; integers dense and not open (excluded by `QuasiCompact`); `D(t)` open, `{0}` closed | holds | none |
| `compact_complexPoints` | `ℙ¹`; `𝔸¹`; `Spec ℂ[ε]/(ε²)` | sphere, compact; `ℂ`, excluded (not proper); one point | holds | none |
| `linearlyReductive_iff_torus` | `μₚ`; `ℤ/ℓ`; `SL₂` in char 2; norm-one torus over `𝔽_p` | excluded (not smooth); excluded (`ℓ` components); F↔F (`Sym²` extension does not split); T↔T | holds | none |
| `LeviComplements.exists_levi_complement` | `𝔾ₘ⋉𝔾ₐ`; reductive `G`; `𝔾ₐ` | `J=(x)`; `J=0`; augmentation ideal, `k→k` | holds | none |
| §6B headline | `𝔾ₘ/μ₂`; `SL₂/T`; `N=1`; constant `S₃/C₂`; upper Borel of `SL₂` | `k[t²,t⁻²]`; `x=ab, y=cd, z=ad` with `xy=z(z−1)`; invariants `O(G)`; `k³`; `B⁰=B` not reductive, hypothesis fails and `ℙ¹` is not affine | holds | none |
| `lang_surjective` | `𝔾ₘ` over `𝔽₃`; `𝔾ₐ` over `𝔽₂`; `C₂`; `K=k` | `g⁻¹g³=g²` onto `Kˣ`; `a²−a=1` solvable in `𝔽₄`; constant 1 (excluded); `x^q−x=0` (excluded) | holds | none |
| `integral_pbw` | `m=r=0`; `A₁` | basis `{1}` of `ℤ`; `ef=fe+h` | holds | none |
| `nonempty_mulEquiv_braidGroup` | `n=0,1,2` | point; `ℂ`; `ℤ` on both sides | holds | none |
| `permutation_extension_nonsplit` | `n=2`; `n=1` | every homomorphism `ℤ/2→ℤ` is trivial; both groups trivial, a section exists (excluded by `2≤n`) | holds | none |
| `nonempty_mulEquiv_artinGroup` | `A₁`; `Λ=∅`; `A₁×A₁` | `ℂˣ/±1≅ℂˣ`, `ℤ`; trivial; `ℤ²` | holds | none |

## Not verifiable

- **Milne edition.** The manifest key `milne-iag` records the 2015 notes; the README's locators use the 2017 numbering, checked against the author-page 2017 copy in the cache. The manifest is outside this folder.
- **Uncertified and unread texts.** `waterhouse`, `borel`, `springer`, `kohls`, `humphreys` and `howlett-lehrer` are settled as uncertified; `brieskorn-1971` is image-only. None is the only locator of a headline.
- **Description.** The author's text narrates an earlier amendment ("Only README.md changed", a helper `ChevalleyModelTargets.lean`); at this head `Suggested.lean` is rewritten and the folder has no such file. Earlier rounds settled this as text outside the folder; the generated merge-order block is current.
- **Changes on other roadmaps.** InverseGaloisAndArithmeticFundamentalGroups (open) still proves `π₁(Conf_n(𝔻))` itself, and ReductiveGroupsPartII on main still states `Lang.lang_surjective`; both were settled earlier as changes on those roadmaps.
- **Other open heads.** GroupSchemesOverABase and FlagVarieties have no checkout in this job; ownership against them was checked only through `roadmaps grep`.

## Source issues

- **Error** in milne-iag at Remark 12.56, p. 249: the source says a group in characteristic p is linearly reductive iff its identity component is a torus and p does not divide the index; it should be "identity component of multiplicative type" (μₚ is connected and linearly reductive); affects nothing.
