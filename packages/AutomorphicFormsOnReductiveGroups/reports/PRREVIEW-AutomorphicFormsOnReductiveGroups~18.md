# Review of AutomorphicFormsOnReductiveGroups (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 52 changed lines since `aecb53a`. The two added sections, §6.8a (holomorphic discrete series as lowest-weight modules) and §7.5a (the class-set inner product and its perfect pairing), were recomputed against §§2.4, 2.6, 6.1, 6.8, 7.4 and 7.5 and against Thorne's Lemma 6.4, and their statements, routes and Checks hold; the changed supplier, scope and dependency sentences match the head. There are no findings. The folder's text is the one the previous review read, so its three small corrections and one format note are not repaired and are repeated here, with one further small correction on the merge order: four small corrections and one format note, none blocking. One point is left to the human reviewers: §6.8a's two sources could not be read.

## C01 — The description says every added section is stated in the generality of its source; §7.5a states more than its source

The description says that the general roadmaps "receive 217 sections, each a theorem published before 20 November 2026 and stated in the generality of its source", and lists exceptions in two other roadmaps only. In this folder §7.5a's perfect pairing (line 1253) is stated for every `G` satisfying §7.4's two hypotheses and every finite free `O_E`-module with a continuous level action, while its source, Thorne's proof of Lemma 6.4 (arXiv v1, pp.33–34), has definite unitary groups and the lattices `M_{λ,{χ_v}}`, and asserts perfectness without an argument. The README says this itself and supplies the argument, so the section is sound and only the description is off. It would be right with one more exception in the parenthesis: "in AutomorphicFormsOnReductiveGroups §7.5a for every group compact at infinity, with the proof in the section".

## C02 — §6.8a's citation gives no theorem or page

The route of §6.8a (line 1094) ends with "Harish-Chandra, *Representations of semisimple Lie groups IV–VI*; Knapp, *Representation theory of semisimple groups*, Ch. VI", that is, three papers of about 140 pages and a whole chapter. An implementer cannot find the statement that supports the three assertions or the square-integrability of the holomorphic model, and every other result of Layer 6 has a theorem or section with its pages. Neither text has an open legal copy, so this review cannot supply the locators: please give the theorem number and page in Knapp's Chapter VI, and the paper of the series (with the theorem) that has the realization on the bounded domain.

## C03 — Layer 6's Dependencies say §6.8a constructs the Harish-Chandra decomposition and the bounded realization, but §6.8a states neither

The sentence added to Layer 6's Dependencies (line 1111) says that §6.8a "constructs the Harish-Chandra decomposition and the bounded realization of `G/K`". In §6.8a both occur only as the first step of the route (line 1094), with no hypotheses and no conclusion, so an implementer who proves the lowest-weight theorem another way has no target for them and a consumer has nothing to cite. LieGroups Layer 7 supplies the complexification and real forms and has no decomposition `P⁺K_ℂP⁻`. ShimuraVarieties P.2 (`hermitian_components`, on `main`) already asks for the bounded realization of each component of a Shimura datum, so two roadmaps would build this embedding without either naming the other.

Either state it in §6.8a, in two sentences (for `G` as there, multiplication `P⁺×K_ℂ×P⁻→G_ℂ` is injective with open image containing `G`, and `gK↦` the logarithm of the `P⁺`-component of `g` is a holomorphic diffeomorphism of `G/K` onto a bounded domain in `𝔭⁺`), with one clause in the scope section saying that ShimuraVarieties P.2's realization is the instance for the real adjoint group of a datum; or reword the Dependencies sentence so that it calls these steps of the route.

## C04 — Another open pull request changes this README and no order between the two is stated

Pull request #3036 adds a `*Needs:*` line to each section of this README (40 such lines against `main`, among them inside §§6.8 and 7.5, next to where §§6.8a and 7.5a are inserted). In this folder the two changes touch different lines and merge cleanly, but the two pull requests conflict in four other READMEs, so one will be rebased on the other, and the description's merge-order block lists neither this folder nor #3036 under "Shared folders". Adding the line `AutomorphicFormsOnReductiveGroups`: "also changed by #3036" there would tell the reader; whichever merges second keeps the other's text, and §§6.8a and 7.5a already carry their own `*Needs:*` lines.

## N01 — The letter `E` changes meaning within §7.5a

In §7.5a's first paragraph (line 1249) `E` is "a field of characteristic zero with an involution `c`" and `M` is "the level coefficient module `M` of §7.4"; in §7.4 and in §7.5a's second paragraph `E` is a finite extension of `ℚ_ℓ` and §7.4's `M` is a module over an `O_E`-algebra. Another letter for the field with involution, and a reference to §7.4's abstract carrier (any right `J`-module), would remove the clash.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.8a holomorphic chamber; `W_K`-invariance; dominance | `SL₂`; `Sp₄`, `λ=(2,1)`; `G` compact | `SL₂`: `λ=k−1` pairs positively with the weight-2 root iff `k≥2`. `Sp₄`: pairings with `(2,0),(1,1),(0,2)` are `2,3,1`. Compact `G`: `𝔭⁺=0`, condition empty | holds |
| 6.8a lowest `K`-type `λ+ρ_n−ρ_c` | `SL₂`; `Sp₄`, `k=3`; compact `G` | `(k−1)+1−0=k`. `(2,1)+(3/2,3/2)−(1/2,−1/2)=(3,3)`, as §6.8. Compact: `λ−ρ_c`, the highest weight of the representation with parameter `λ` | consistent with §§2.4, 6.8 |
| 6.8a `𝔭⁻` kills `σ₀`; module is `S(𝔭⁺)⊗σ₀` | `D_k⁺`; `Sp₄`, `k=3` | §2.6: `Y_cv_k=(k−k)/2·v_{k−2}=0`; types `k+2m`, each once, equal `S(ℂ_2)⊗ℂ_k`. `Sp₄`: `S(Sym²ℂ²)⊗det³` gives `(3+2a,3+2b)`, `a≥b≥0` | holds |
| 6.8a `K`-types in `λ₀+ℕ·(roots of 𝔭⁺)` | `Sp₄`, `k=3` | `(3+2a,3+2b)=(3,3)+(a−b)(2,0)+2b(1,1)` | holds |
| 6.8a route: holomorphic model is `π^∨` | `SL₂` on the disc | `z^n` has `K`-weight `−k−2n`: the types of `D_k⁻=(D_k⁺)^∨`. `∂_z` lowers degree and kills constants; `z²∂_z+kz` raises it by one | consistent |
| 6.8a Check 1 | §2.6 at `ℓ=k` | `X_cv_k=(k+k)/2·v_{k+2}=kv_{k+2}`, `Y_cv_k=0`. §2.6's relations are consistent: `[X_c,Y_c]v_ℓ=((k−ℓ)(k+ℓ−2)−(k+ℓ)(k−ℓ−2))/4·v_ℓ=ℓv_ℓ` | true |
| 6.8a Check 2 (negative control) | `D_k⁻`, `ℓ=−k`, `k=2` | `Y_cv_{−k}=(k+k)/2·v_{−k−2}=kv_{−k−2}`; at `k=2`, `2v_{−4}≠0`, and `−4` lies on the allowed ray | true |
| 7.5a `classSetInner_independent` | `t↦γtu`; Gross model | `f(γtu)=σ(u)⁻¹f(t)` and the form is `J`-invariant; `G(F)∩γtuJu⁻¹t⁻¹γ⁻¹=γΓ_tγ⁻¹`, same order. Gross: `F(γt)=ρ(γ)F(t)`, form `ρ(G(F))`-invariant | holds |
| 7.5a `classSetPairing_perfect` | `Γ=C₂`, `ℓ=2,3`; trivial `Γ` | No element of order `ℓ` gives `ℓ∤|Γ_i|` (Cauchy), so `e=|Γ|⁻¹Σγ` is defined, `⟨em,φ⟩=⟨m,eφ⟩`, and `M=eM⊕(1−e)M` is orthogonal to the dual splitting. Trivial `Γ`: `M^h×(M^∨)^h` | holds |
| 7.5a Check, `GL₁/ℚ` | `J=Ẑ^×`, `ℓ=2,3` | Class number 1; `Γ₁=ℚ^×∩Ẑ^×={±1}`; `(1,1)_J=1/2`, the mass `Σ|Γ_i|⁻¹`. `1/2∈ℤ₃^×`; `1/2∉ℤ₂` and `−1` has order 2 | true |
| 7.5a locator: Thorne, proof of Lemma 6.4 | arXiv v1 | Lemma stated at the foot of p.33; the pairing with denominators `#(t⁻¹G(L⁺)t∩V)` and its perfectness on p.34. Perfectness is asserted there, not argued | matches; C01 |
| Supplier sentence, AdelicAlgebraicGroups §4.5a | head and `main` | At the head: mass `Σ_i|Γ_i|⁻¹` under `G(F_∞)/A_G(ℝ)⁰` compact; `ℝ^×/ℝ_{>0}` is compact. Not on `main`: this pull request adds it | consistent |
| §7.5a's `*Needs:*`, AdelicAlgebraicGroups §3.4 | `main` | The item *Arithmetic subgroups attached to a level* is in §3.4 on `main` | resolves |
| Dependencies sentence of Layer 6 | LieGroups Layer 7; §6.8a | Layer 7 is "complexification and real forms", no `P⁺K_ℂP⁻`; §6.8a has the decomposition only inside its route | C03 |
| Description: "generality of its source" | §7.5a against Thorne | Thorne: definite `U_n`, lattices `M_{λ,{χ_v}}`. §7.5a: every `G` with §7.4's hypotheses, any finite free `M` | C01 |
| Headline `compactFinite_dense_locallyConvex` (unchanged) | trivial `K`; elaborated type | Trivial `K`: each orbit spans dimension ≤1, the set is all of `E`. Elaborated type keeps compactness, completeness, local convexity and joint continuity, as README §2.1 | holds |

- Source locators checked against the text: 2 (Thorne, Lemma 6.4 at `thorne-small-residual-image` line 1472, p.33; the pairing and its perfectness at lines 1493–1503, p.34). The 15 targets of the seeded sample all lie in untouched text the change does not affect; of them only §2.6 is used by the change, and its formulas were recomputed (row 6).
- Roadmap sections opened: LieGroups Layer 7; LieHighestWeight Layers 3, 7 and 9; AdelicAlgebraicGroups §§3.4 and 4.5a; ShimuraVarieties P.2; PotentialAutomorphyInfrastructurePartII §3.4. Cross-roadmap citations of the changed text resolved: 6 of 6. Consumers of the new ids: DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8 (cites §6.8a) and ThetaChainsOnDefiniteUnitaryGroups (cites §7.5a).
- Record check: 8 layers at the merge base and at the head, none removed or retitled; the diff has 47 added lines and 5 lines extended by a clause, no item removed, no id reused; no Lean declaration changed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` gives the single `sorry` warning. `#check`-level comparison: the elaborated type of the one theorem agrees with README §2.1 and has lost no binder. One-tactic probe on a copy: `simp`, `rfl`, `infer_instance` and `exact dense_univ` all fail.
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlap check: read AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactors, SmoothBanachRepresentations (main), AutomorphicSpectralTheoryPartII (open), and by object ShimuraVarieties, PotentialAutomorphyInfrastructurePartII and SpecialFunctionsGroupModels (open); GL2AutomorphicRepresentationsAndTransfer's open head was not available to read. Lowest-weight theorem for holomorphic discrete series: owner here (§6.8a); SpecialFunctionsGroupModels §2.3 has only the explicit `SU(1,1)` model. Class-set pairing: owner here (§7.5a); PotentialAutomorphyInfrastructurePartII §3.4 uses it for definite unitary groups inside a route and states exactness and freeness, not the pairing. Bounded realization: ShimuraVarieties P.2 for a Shimura datum; here only a route step (C03).
- Source independence: changed passages only; 3 passages of §7.5a compared with 1 source (Thorne, arXiv v1, pp.33–34), none shared beyond the forced formula and the six-word hypothesis; the changed passages carry 3 locators, one each for Thorne, Knapp 1986 and Harish-Chandra, so no source has a largest share; §6.8a not compared (neither source readable); contents not compared, since no layer is added, removed or reordered.
- Research link: §7.5a is the duality behind Thorne (2012), Lemma 6.4, the freeness of algebraic modular forms over a diamond group ring used in Taylor–Wiles patching on definite unitary groups; §6.8a is Harish-Chandra's (1955–56) holomorphic discrete series, feeding Layer 6's coherent cohomology (Harris; Boxer–Pilloni). Rests on the README and Thorne's text.

## Not verifiable

- Knapp, *Representation theory of semisimple groups* (1986), Ch. VI: the sources service found no legal copy (the publisher's page is closed).
- Harish-Chandra, *Representations of semisimple Lie groups IV–VI*, Amer. J. Math. 77–78 (1955–56): the sources service found no legal copy.
- The text of pull request #3036 outside this README: only its version of this README was read.

## Source issues

- none

## For the human reviewers

- Not tested: §6.8a's only sources, Knapp 1986 Ch. VI and Harish-Chandra IV–VI (`TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` lines 1094, 1386, 1407), have no legal open copy; its wording and locators were not compared with them.
