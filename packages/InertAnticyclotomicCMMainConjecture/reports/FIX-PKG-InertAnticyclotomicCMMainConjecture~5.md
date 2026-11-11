# FIX-PKG-InertAnticyclotomicCMMainConjecture~5: repair report

Review settled: `REV-PKG-InertAnticyclotomicCMMainConjecture~4` (one finding, P3).

## F01 (P3) — applied

Verified at the pinned Tau Ceti (`2fd255d9`). `TauCeti.ContCohomology.SelmerStructure` (TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean, variables at lines 58–64) asks only for `[AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M] [DistribMulAction G M] [ContinuousSMul G M]`, with no `DiscreteTopology`. `TauCeti.ContCohomology.H1` (LowDegree.lean:829) has the same binders, and a scratch `#check` confirmed this. Its docstring (lines 820–825) says the quotient of the pointwise topology is not the intended topology. So the README was wrong to say the carrier "has no … compact or rational coefficients".

Change (`packages/InertAnticyclotomicCMMainConjecture/README.md`, "From Tau Ceti" contract): "as the discrete Selmer carrier … has no R-module structure, compact or rational coefficients, or limits" → "as the Selmer kernel for every coefficient module". The new text:
- states the topological-coefficient signature and names `TauCeti.ContCohomology.H1`;
- says that W, T, T′ and V_T all fit, and gives the ℤ_p/ℚ_p trivial-action witness;
- lists what the carrier really lacks: the unramified-almost-everywhere condition, an R-module structure and R-submodule conditions, the intended topology with its comparison to limits, propagation between V_T, T and W, and limits along towers;
- assigns these to SelmerIwasawaCohomology §§2.1–2.6, 3.1, which instantiates this kernel rather than a second one.

Same pattern repaired elsewhere:
- Scope and ownership, SelmerIwasawaCohomology bullet: "Their general discrete carrier" → "Their underlying Selmer kernel … for every topological coefficient module with continuous action, discrete, compact or rational".
- "From TauCetiRoadmap.EllipticCurves": "The general discrete Selmer structure that Layer 7 plans is the pinned … carrier …, and SelmerIwasawaCohomology §2.1 extends that discrete interface to compact and rational coefficients" → Layer 7 plans a discrete-module Selmer structure. The pinned carrier supplies its kernel, without the unramified condition and for every topological coefficient module. SelmerIwasawaCohomology §2.1 supplies the R-module Selmer data and the compact and rational cohomology.

Left unchanged:
- §1.4 says "on the discrete G_(K_n)-module W". That is correct: W is discrete.
- `Suggested.lean` is unchanged, as the finding asks. Its docstring never says the carrier excludes compact or rational coefficients. It says the signed local conditions, limits and V_pE-limit objects are missing, which stays true.
- No other occurrence was found by grepping for `discrete carrier`, `compact or rational`, `rational coefficients` and `carrier`.

## Checks

- `lake env lean packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: a single `import Mathlib`, the module docstring and the namespace, with zero declarations. No Tau Ceti module had to be built.
- Mechanical `#check` pass: `Suggested.lean` declares nothing, so there are no signatures to compare with the README. I also elaborated a scratch file (`import Mathlib`, `import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`) containing `#check @TauCeti.ContCohomology.H1` and `#check @TauCeti.ContCohomology.H1EquivOfSmulEqSelf`. It returned exit 0. The elaborated binders are a topological additive group with continuous action and no discreteness; the second is an equivalence with `Additive (G →ₜ* Multiplicative M)` for a trivial action. The `SelmerStructure` module has no built object file at the pin. I read its binders directly from the source rather than building it.
- Dependency check:

```text
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

  This has no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citations and no roadmap Lean names found nowhere. The resolver does not check library names on this host. The newly cited `TauCeti.ContCohomology.H1` was confirmed at the pin as described above (namespace `TauCeti.ContCohomology`, LowDegree.lean lines 124–1094; declaration at 829).

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| The carrier accepts any topological additive coefficient group with continuous action | G=ℤ_p (as a multiplicative monoid), trivial action, M=ℤ_p and M=ℚ_p | Cocycle law with trivial action: c(g+h)=c(g)+c(h), so Z¹ is the continuous homomorphisms. Coboundaries: g·m−m=0, so B¹=0. c=id gives c(1)=1≠0, and likewise its composite into ℚ_p. Full local condition at one identity-localised index keeps [c]; the zero condition gives Sel=0. | True: the claim was wrong, and the README now says so. |
| W, T, T′, V_T all fit | T≅R (ϖ_R-adic), T′≅ℤ_p^[R:ℤ_p] (compact), V_T≅L, W≅L/R (discrete), each with G_(K_n) acting through a continuous character | φ_p is continuous and multiplication on R and L is continuous, so the joint action is continuous. All four are topological additive groups. | Fits the binders. |
| H¹ carries no R-module structure at the pin | grep for `Module … (H1 …)` instances in the pinned Tau Ceti | Only `instModuleH1 : Module (ZMod n) (H1 G A)` (H1/ZMod.lean:83). There is none for a DVR R. | Claim kept. |
| The inherited topology is not the intended one | LowDegree.lean docstring of `H1`, lines 820–825 | Trivial ℤ/2 coefficients on an infinite product of C₂: no finite set of evaluations isolates the zero character, so the quotient topology is not discrete. | Claim kept, restricted to what the roadmap needs (compact and rational coefficients). |
| EllipticCurves Layer 7 plans a discrete-module structure with unramified conditions | `TauCetiRoadmap/EllipticCurves/README.md` lines 1264–1276 on main | That text says "on a discrete Gal-module M", "unramified at almost all v" and "coefficient module forced discrete". The pinned carrier has neither restriction. | New wording matches both. |
| SelmerIwasawaCohomology §2.1 supplies R-module Selmer data and compact/rational cohomology without a second kernel | SelmerIwasawaCohomology §2.1 at its open head | It defines R-modules H and H_v, R-linear res_v and R-submodule L_v. It says it "uses the supplier's discrete datum without introducing a second discrete carrier" and admits compact and rational cohomology through ArithmeticGaloisDuality Layer R02.1. | Contract attribution is correct, and no second carrier is planned here. |

## Gate failures

None were listed.

## For the maintainer

- No name, section or target that other roadmaps cite was changed. The edits only reword three supplier and scope sentences.
- SelmerIwasawaCohomology §§2.1–2.2 still call the pinned interface "discrete" and describe their work as extending it to compact and rational coefficients. At the pin the kernel already accepts those coefficients. What that roadmap actually adds is the R-module structure, the intended topology and comparisons, and limits. That wording belongs to SelmerIwasawaCohomology and was not edited here.
- Ownership against open pull requests: the closest open roadmaps were not re-searched beyond SelmerIwasawaCohomology and EllipticCurves, because the repair adds no new construction. The overlap file lists no head changing this roadmap.
- `sources.toml`, `metadata.toml`, `design/plan.json` and `Suggested.lean` are unchanged. No source was fetched or requested.
