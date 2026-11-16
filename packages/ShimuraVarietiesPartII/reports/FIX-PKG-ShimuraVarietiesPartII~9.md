# FIX-PKG-ShimuraVarietiesPartII~9

This round repairs the two findings of `REV-PKG-ShimuraVarietiesPartII~8`, both P3. I checked both against the cached KZ text and the roadmap's own targets. Both are correct.

- F01 is applied, with a correction to the suggested wording. The suggested text cites §0.3 for the tower and uses GL₂ as its witness. But Layer 7 works with strongly acceptable triples, whose integral model comes from §3.8, and GL₂ is not strongly acceptable (§2.1's Check: Z^c=μ₂). The repair therefore states the setting, uses a strongly acceptable witness, and adds the Hodge-type reason why the tower is a K^p-torsor.
- F02 is applied as written.

Only `packages/ShimuraVarietiesPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-ShimuraVarietiesPartII~8/F01 (P3) — applied differently

**Verified.** KZ line 2068–2073 (§5.1.1, p.47) defines the pro-étale cover only when the level has the form K_ℓK^ℓ. KZ Theorem 5.1.4 (KZ line 2104–2106) is stated for every ℓ≠p, and README §7.6 is stated for any prime-to-p level. The old §7.1 never said what K_ℓ is.

The reviewer's witness is correct. For K^p ⊂ GL₂(Ẑ^(7)) cut out by χ₃(det k₃)χ₅(det k₅)=1:

- the image in GL₂(Q₃) is all of GL₂(Z₃): for any k₃, choose k₅ with χ₅(det k₅)=χ₃(det k₃);
- the intersection K^p∩GL₂(Q₃) is ker(χ₃∘det), of index 2.

**Change (§7.1 Construction).** Old → new:

- "refine the ℓ-component of the prime-to-p Shimura tower to obtain its pro-étale K_ℓ-cover" → K_ℓ is defined as the image of K^p in G(Q_ℓ), and K^(ℓ) as the kernel of K^p→K_ℓ.
- The setting is now explicit: a strongly acceptable triple (§2.1) with its model S_K (§3.8).
- At neat level the tower is a pro-étale K^p-torsor. The reason is stated: Hodge type gives that Z_G(Q) is discrete in Z_G(A_f).
- The tower is divided by K^(ℓ) and its structure group extended to G(Q_ℓ). Equivalently, it is pushed out along K^p→G(Q_ℓ).
- At a product level this is KZ's cover.
- The abelian scheme A comes from §5.4.

**Other edits.**

- Proof sketch: says that KZ uses product levels.
- `*Needs:*`: gains §2.1, §3.8 and §5.4.
- API bullet on level maps: the pullback to K′^p is the local system built from K′^p, with K′_ℓ⊂K_ℓ.

**Checks added (2).**

1. A non-product level for a strongly acceptable triple: GU(1,1) for Q(i), p=5, with the χ₃(ν(k₃))χ₇(ν(k₇)) condition. Here K_3=G(Z₃) while K^p∩G(Q₃) has index 2. The product of the two pieces has index 2 in K^p, so its tower lies over a double cover of S_K, not over S_K.
2. A negative control for the torsor claim: Res_(F/Q)GL₂ for F real quadratic. The units of O_F congruent to 1 mod N act trivially on the tower, so the push-out to G(Q_ℓ) is not defined.

**Why not the literal repair.**

- The suggested text cites §0.3, which is about the Hodge model of Layer 0. The model of a strongly acceptable triple is the descended model of §3.8 (KZ line 2063–2066; KZ line 1469–1473). §0.3 is still in the `*Needs:*` line.
- The suggested Check uses GL₂, which is outside Layer 7's scope.
- "The prime-to-p tower is a K^p-torsor" needs a reason, and it fails for abelian-type data without Hodge type. Check 2 records that failure.

**Pattern.** I searched the README for every K_ℓ, K^ℓ, "product" and "pro-étale".

- §3.4's Check chooses K_ℓ=GL₂(Z_ℓ) as a component inside an example. It is unaffected.
- §0.4 "tower torsor Isom_tensor(V_Qℓ,H₁)" is a G(Q_ℓ)-torsor and does not depend on the level.
- §7.2 ("independent of … the chosen neat cover") and §7.6 ("any prime-to-p level") are now supported by §7.1.

No other occurrence assumed a product level. Layer 7 `### Dependencies` gains §2.1, §3.8 and §5.4.

## REV-PKG-ShimuraVarietiesPartII~8/F02 (P3) — applied

**Verified.**

- §4.3's proof sketch names PadicDifferentialEquationsAndRigidCohomology §RD.3.43 and the universal G-isocrystal of §0.6, but its `*Needs:*` line lists neither.
- §3.4's first API bullet uses ShimuraVarieties §§6.3–6.6, which its `*Needs:*` line omits.

Both supplier ids resolve at the heads of their open pull requests: "### RD.3.43 Semicontinuity of Newton polygons in families", and ShimuraVarieties "### 6.3" through "### 6.6". Both suppliers are already listed in their layer's Dependencies and in the supplier contracts.

**Change.**

- §4.3: "*Needs:* §4.1; §4.2; BunGAndNewtonStrata §§1.22–1.26, 2.16." → "*Needs:* §4.1; §4.2; §0.6; BunGAndNewtonStrata §§1.22–1.26, 2.16; PadicDifferentialEquationsAndRigidCohomology §RD.3.43."
- §3.4: "… §0.1." → "… §0.1; ShimuraVarieties §§6.3–6.6."

**Pattern.** I compared the supplier names cited in each of the 63 numbered targets with that target's `*Needs:*` line, mechanically. After the edit, one hit remains: §4.3 names IgusaVarietiesAndTorsionConcentration §§0.1–0.2 and §0.12. That citation sits in a Check, not in the statement or the proof route. The supplier contract already says it is "used only for the comparison Check in §4.3", so it is not added.

A scan of internal § references against the `*Needs:*` lines found only:

- source section numbers (KZ §4.1 and the like);
- supplier sections written without the roadmap name inside the same sentence, for example "(§1.34)" after BunGAndNewtonStrata.

No other internal omission was found.

## Checks run

- **Elaboration.** `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, 2.9 s. The file has `import Mathlib` only, no `TauCeti.*` import, and 0 declarations, so nothing needed building.
- **`#check @name` comparison.** There are 0 declarations, so there was nothing to compare and nothing changed. The module docstring's §7.6 headline ("for a strongly acceptable triple … a point `y` of the integral model over `𝔽_q`") is unchanged and still agrees with the README.
- **Dependency check** (the prescribed command with `--movable`), exit 0:

```text
depcheck: 239 roadmaps, 2274 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or `moved:` line. The new edges are §2.1, §3.8 and §5.4 inside the roadmap, plus PadicDifferentialEquationsAndRigidCohomology and ShimuraVarieties, which were already suppliers.
- **Citation resolver** (`roadmaps resolve` on the README, against main c639cfa and 455 open heads): no cross-roadmap citation and no Lean name found nowhere.
- **Residue scan** of the README for LaTeX delimiters, "optional", "deferred", "removed", "so far", machine paths, and job or round labels: 0 hits.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| K_ℓ = image of K^p is compact open, and K^p→K_ℓ is onto | any K^p; GU(1,1)/Q(i), p=5, χ₃χ₇-level | Projection to a factor is open and continuous, so the image is open and compact. On the witness: the image is G(Z₃), index 1. | holds | Check added |
| K^(ℓ) = ker(K^p→K_ℓ) is open in G(A_f^(p,ℓ)) | K^p ⊇ U_ℓ×U^(ℓ) | K^(ℓ) ⊇ U^(ℓ), so it is open; it is normal as a kernel | holds | none |
| Intersection model in place of image | witness | K^p∩G(Q₃)=ker(χ₃∘ν), index 2 in G(Z₃). (K^p∩G(Q₃))·K^(3) is cut out by χ₃(ν(k₃))=1=χ₇(ν(k₇)), index 2 in K^p, so its tower lies over a double cover | wrong model excluded | Check added |
| ν(G(Z_v))=Z_v^× at inert v=3,7 | scalars z∈O_(E_v)^× | h(zx,zy)=z z̄ h(x,y), so ν(z)=N(z). The unramified norm is onto on units, and ν of a lattice stabilizer is a unit | holds | used in the Check |
| (Q(i), p=5) is strongly acceptable | §2.1 Check | 5=(2+i)(2−i) is split. G_der,Q5=SL₂ is split. Z^c=U(1)≅G_m at 5, an induced torus. The level is hyperspecial | holds | none |
| Neat tower is a K^p-torsor (Hodge type) | stabilizer of [x,g] | q∈G(Q)∩gKg⁻¹ fixes x, so its image in G_ad is neat and lies in a compact group, hence trivial; so q∈Z_G(Q)∩K. For Hodge type, Z_G(R)/G_m is compact (positivity of ψ(·,h(i)·)), so Z_G(Q) is discrete; finite plus neat gives trivial | holds | reason stated |
| Same, without Hodge type | Res_(F/Q)GL₂, F real quadratic, level N≥3 | Units ε≡1 mod N have rank 1, hence infinitely many. Each z central rational satisfies [x,gz]=[z⁻¹x,g]=[x,g]. The ℓ-component of ε≠1 is nontrivial in K_ℓ | torsor claim fails, so the hypothesis is needed | negative-control Check |
| Freeness extends to the integral tower | finite étale transitions (§3.8) | G×S_(K′)→S_(K′)×_(S_K)S_(K′) is a map of finite étale covers of a normal scheme, and it is an isomorphism on the dense generic fibre, so it is an isomorphism | holds | none |
| Product level recovers KZ | K^p=K_ℓK^ℓ | K^(ℓ)=K^ℓ, and the preimage of open K′_ℓ is K′_ℓK^ℓ, giving the limit of S_(K_pK′_ℓK^ℓ) | agrees with KZ line 2071–2073 | none |
| Push-out formula equals quotient-then-extend | T a K^p-torsor | (T/K^(ℓ))×^(K_ℓ)G(Q_ℓ) = T×^(K^p)G(Q_ℓ), since K^p acts through K^p/K^(ℓ)≅K_ℓ | holds | stated as "equivalently" |
| Level-change API | K′^p⊂K^p | The pullback of T×^(K^p)G(Q_ℓ) to S_(K_pK′^p) is T×^(K′^p)G(Q_ℓ), and K′_ℓ=pr_ℓ(K′^p)⊂K_ℓ | holds | API bullet sharpened |
| H₁ identification at a non-product level | neat level, Hodge embedding via §5.4 | The level torsor is the set of tensor-preserving η: V_(A_f^p)≅V^p(A) in the K^p-class. Pushing η to η_ℓ gives Isom_tensor(V_Qℓ,V_ℓ(A)), a G(Q_ℓ)-torsor, as in KZ (5.1.1.1), KZ line 2077 | holds | §5.4 cited |
| Non-neat level | the stack of §0.2, K_1^p neat normal | The K^p-torsor over [S_(K_1)/(K^p/K_1^p)] is pushed out along K^p→G(Q_ℓ). K_ℓ is the image of K^p, not of K_1^p | holds | stated |
| §4.3 `*Needs:*` (F02) | proof sketch | It names the universal G-isocrystal (§0.6) and §RD.3.43, and both are now listed | consistent with §4.4 | edited |
| §3.4 `*Needs:*` (F02) | API bullet 1 | It names ShimuraVarieties §§6.3–6.6, now listed. Layer 3 Dependencies already has it | consistent | edited |

No Check or worked example of Layer 7 changes value. §7.2's coordinates, (2/5,1/5) over F₅ and (−6/25,1/25) over F₂₅, do not depend on how K_ℓ is chosen.

## Ownership and sources

- **Ownership.** No new object is introduced. K_ℓ and K^(ℓ) are notation inside the existing §7.1 construction. The tower is §3.8's, the abelian scheme is §5.4's, and the generic automorphic local systems remain AutomorphicBundles §§3.4–3.8.
- **Sources.** No new source was cited or fetched. All locators used are KZ lines in the cached text. `sources.toml` already records KZ §5.1.1 and §4.4.1, and `needs-references.toml` was not created.

## For the maintainer

- **Names.** No name that other roadmaps cite changed: section ids are unchanged and no Lean name was added or removed.
- **Consumers of §7.1, §7.6 and §5.4.** §7.1 now states its setting (strongly acceptable triples) and depends on §§2.1, 3.8 and 5.4. Those targets are earlier in the same roadmap, so this has no effect outside it.
- **Source issue.** KZ §5.1.1, which defines the cover only at product levels, is listed among the review's Source issues. The README handles it inside §7.1 and does not add a separate entry under "Source conventions and corrections".
- **Suspicious text.** None; the review contained no instructions outside its findings.
